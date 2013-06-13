# Contributor && Maintarner: Swift Geek <swiftgeek ɐt gmail døt com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: hokasch <hokasch at operamail dot com>
# Contributor: Dennis Brendel <buddabrod at gmail dot com>
# Contributor: Mathias Buren <mathias.buren at gmail dot com>
# Contributor: Benjamin Mtz (Cruznick) <cruznick at archlinux dot us>

_runkernver=$(uname -r)

pkgname=backports-patched
pkgver=3.10_rc1_2 # NO CRAP! (-c). Use _ instead of -
_upver="${pkgver//_/-}"
pkgrel=4
pkgdesc='Compat drivers provides drivers released on newer kernels backported for usage on older kernels. Patched flavor'
url='https://backports.wiki.kernel.org/index.php/Main_Page'
arch=('i686' 'x86_64')
license=('GPL')
depends=('linux')
makedepends=('linux-api-headers' "linux-headers>=${_runkernver:0:3}")
optdepends=('backports-frag+ack: wl-frag+ack patch')
install=backports.install
#source=("http://www.orbit-lab.org/kernel/compat-wireless-${pkgver:0:1}-stable/v${pkgver:0:3}/compat-wireless-${_upver}.tar.bz2")
#source=("http://www.kernel.org/pub/linux/kernel/projects/backports/stable/v${_upver%%-*}/compat-drivers-${_upver}.tar.xz")
source=("http://www.kernel.org/pub/linux/kernel/projects/backports/stable/v3.10-rc1/backports-${_upver}.tar.xz")
#echo $source
#XZ is way better in decompression

sha256sums=('1a7fb65ff46419a0bb5beb88f9de3db324d956910ead9158b53f24e05e58de69')


#_extramodules=extramodules-3.7-ARCH
_extramodules=extramodules-${_runkernver:0:3}-ARCH
_kernver=$(cat /usr/lib/modules/${_extramodules}/version) # TODO make this a lower boundary and utilize in reality pacman to get freshest paths. Or make it for specific kernels. Or multiply it over specific kernels ? :3

_cfgdir="/etc/makepkg.d/${pkgname}/"
_patchdir="${_cfgdir}/patches/"

# For a list of supported drivers, run ./scripts/driver-select from the source tarball.
# To only build specific ones, define the _selected_drivers variable; for instance:
#         _selected_drivers='atheros intel wl12xx'
# You can also export this variable in ~/.bashrc or /etc/profile to automate updating this package

prepare() {
  cd "${srcdir}/backports-${_upver}"
  # modprobe -l dropped in kmod
  sed 's:modprobe -l \([^ )`]*\):find /usr/lib/modules/*/kernel -name "\1.ko*" | sed "s|.*/kernel||":' -i scripts/*
  sed 's:\$(MODPROBE) -l \([^ )`]*\):find /usr/lib/modules/*/kernel -name "\1.ko*" | sed "s|.*/kernel||":' -i Makefile

  # rfkill.h does not use compat-3.1.h # TODO : IS THIS RLY NEEDED ?
  echo '#define br_port_exists(dev) (dev->priv_flags & IFF_BRIDGE_PORT)' >> net/wireless/core.h

  # Patch time!
  #patch -p1 -i ../mac80211.compat08082009.wl_frag+ack_v1.patch
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

  # Make time! 
  [[ -n ${_selected_drivers} ]] && scripts/driver-select ${_selected_drivers}
  make KLIB=/usr/lib/modules/"${_kernver}"
}

package() {
  cd "${srcdir}/backports-${_upver}"
  mkdir ${pkgdir}/usr/
  make INSTALL_MOD_PATH="${pkgdir}/usr" KMODDIR=../"${_extramodules}" install-modules
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;

  install -d "${pkgdir}"/usr/bin
  install scripts/*{enable,load} "${pkgdir}"/usr/bin

  install -d "${pkgdir}"/usr/lib/compat-drivers
  install scripts/modlib.sh "${pkgdir}"/usr/lib/compat-drivers

  install -d "${pkgdir}"/usr/lib/udev/rules.d
  install udev/compat_firmware.sh	"${pkgdir}"/usr/lib/udev
  install udev/50-compat_firmware.rules "${pkgdir}"/usr/lib/udev/rules.d

  # Preparation for future
  install -d "${pkgdir}"/etc/makepkg.d/"${pkgname}"/patches
}
