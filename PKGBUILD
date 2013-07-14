# Contributor && Maintarner: Swift Geek <swiftgeek ɐt gmail døt com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: hokasch <hokasch at operamail dot com>
# Contributor: Dennis Brendel <buddabrod at gmail dot com>
# Contributor: Mathias Buren <mathias.buren at gmail dot com>
# Contributor: Benjamin Mtz (Cruznick) <cruznick at archlinux dot us>

_runkernver=$(uname -r)

pkgname=backports-patched
pkgver=3.10_2 # NO CRAP! (-c). Use _ instead of -
_upver="${pkgver//_/-}"
pkgrel=6
pkgdesc='Compat drivers provides drivers released on newer kernels backported for usage on older kernels. Patched flavor'
url='https://backports.wiki.kernel.org/index.php/Main_Page'
arch=('i686' 'x86_64')
license=('GPL')
depends=('linux')
makedepends=('linux-api-headers' "linux-headers>=${_runkernver:0:3}")
optdepends=('backports-frag+ack: wl-frag+ack patch')
install=backports.install
# TODO: GET SOME BETTER SOURCE CHECKING
#source=("http://www.kernel.org/pub/linux/kernel/projects/backports/stable/v${_upver%%-*}/compat-drivers-${_upver}.tar.xz")
source=("http://www.kernel.org/pub/linux/kernel/projects/backports/stable/v${_upver%%-*}/backports-${_upver}.tar.xz")
#source=("http://www.kernel.org/pub/linux/kernel/projects/backports/${pkgver:0:4}/${pkgver:4:2}/${pkgver:6:2}/backports-${pkgver}.tar.xz")
#echo $source
#XZ is way better in decompression

sha256sums=('4cb2f68a052c440a0a57f6d55dc23e07f174759da8fbb2908bd814c1f8c7815a')


#_extramodules=extramodules-3.9-ARCH
_extramodules=extramodules-${_runkernver%.*}-ARCH
_kernver=$(cat /usr/lib/modules/${_extramodules}/version) # TODO make this a lower boundary and utilize in reality pacman to get freshest paths. Or make it for specific kernels. Or multiply it over specific kernels ? :3

_cfgdir="/etc/makepkg.d/${pkgname}/"
_patchdir="${_cfgdir}/patches/"

prepare() {
  cd "${srcdir}/backports-${_upver}"
  # modprobe -l dropped in kmod
  sed 's:modprobe -l \([^ )`]*\):find /usr/lib/modules/*/kernel -name "\1.ko*" | sed "s|.*/kernel||":' -i scripts/*
  sed 's:\$(MODPROBE) -l \([^ )`]*\):find /usr/lib/modules/*/kernel -name "\1.ko*" | sed "s|.*/kernel||":' -i Makefile

  # rfkill.h does not use compat-3.1.h # TODO : IS THIS RLY NEEDED ?
  #echo '#define br_port_exists(dev) (dev->priv_flags & IFF_BRIDGE_PORT)' >> net/wireless/core.h

  # Patch time!
  # WARNING - PART BELOW IS UNTESTED: current format - 00-name for cfgfile (to export variables) and 12-3-name for patches (3 stands for -p3)
  if [ -d "${_cfgdir}" ]; then
    _CFGLIST=$(ls -1 "${_cfgdir}" | awk ' /^[0-9][0-9]-.*/ {print "source '${_cfgdir}'"$0";"}')
    eval $_CFGLIST
    unset _CFGLIST
    if [ -d "${_patchdir}" ]; then
      _PATCHLIST=$(ls -1 "${_patchdir}" | awk ' /^[0-9][0-9]-[0-9]-.*/ {print $0}')
      for _patch in $_PATCHLIST; do
        msg "Merging patch: ${_patch}"
        patch -p${_patch:3:1} -i ${_patchdir}/${_patch}
      done
      unset _PATCHLIST
    fi
  fi
}

build() {
  cd "${srcdir}/backports-${_upver}"
  unset _selected_drivers
  # Make time! 
  if [ -n "${_selected_drivers}" ]; then
    msg "Config detected"
    make "${_selected_drivers[@]/#/defconfig-}"
  else # TODO: else if not that try showing up dialog menu with checkboxes based on available defconfigs ;)
    warning "Config undetected"
    # TODO: WAIT 10s FOR INTEACTIVE PART - PRESS I FOR INTERACTIVE CONFIG
    sleep 3
    # BEGIN INTERACTIVE PART
    # TODO: ADD OLDCONFIG OPTION
    cfgway=$(dialog --clear --backtitle "$pkgname" --radiolist 'Choose method to configure' 0 0 0 defconfig 'desc' off "menuconfig" 'desc' off 2>&1 >/dev/tty)
    case "$cfgway" in
      defconfig)
        for i in $(ls ./defconfigs/); do
          list_opts+=("$i" "desc" "off")
        done
        echo "${list_opts[@]}"
        _selected_drivers=$(dialog --clear --backtitle "$pkgname" --checklist 'Choose driver groups to compile' 0 0 0 "${list_opts[@]}" 2>&1 >/dev/tty)
        make "${_selected_drivers[@]/#/defconfig-}"
        ;;
      menuconfig)
        make menuconfig
        ;;
      *)
        echo Break out from the PKGBUILD
        false
        ;;
    esac
    # END OF THE INTERACTIVE PART
  fi
  [[ -n "$_selected_drivers" ]] && msg "» $_selected_drivers «" # CONVERT TO MESSAGE AND ONLY IF VAR IS -n
  msg "Starting actual build"
  make KLIB=/usr/lib/modules/"${_kernver}" # should be make modules
}

package() {
  cd "${srcdir}/backports-${_upver}"
  mkdir ${pkgdir}/usr/
  make INSTALL_MOD_PATH="${pkgdir}/usr" KMODDIR=../"${_extramodules}" install
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;

  #install -d "${pkgdir}"/usr/bin
  #install scripts/*{enable,load} "${pkgdir}"/usr/bin

  #install -d "${pkgdir}"/usr/lib/compat-drivers
  #install scripts/modlib.sh "${pkgdir}"/usr/lib/compat-drivers

  install -d "${pkgdir}"/usr/lib/udev/rules.d
  install udev/compat_firmware.sh	"${pkgdir}"/usr/lib/udev
  install udev/50-compat_firmware.rules "${pkgdir}"/usr/lib/udev/rules.d

  # Preparation for future
  install -d "${pkgdir}"/etc/makepkg.d/"${pkgname}"/patches
}
