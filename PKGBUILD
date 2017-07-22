# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# This is for Express or Infinity, not PCI and uPCI
# This blacklists and replaces the built in driver

_opt_DKMS=1           # This can be toggled between installs

# ls -l /dev/ttyRP[0-9]*
# lsmod | grep rp2
# lspci -v | grep -B7 -i rp2
# sudo cat /proc/tty/driver/rocketrp2

# See /etc/modprobe.d/rocketrp2.conf to set port mode to RS-422 or RS-485

# dmesg | grep -A8 -i rp2
#[ 2697.826224] rocketrp2: Comtrol RocketPort Infinity/Express driver version 2.06 Arch Linux https://aur.archlinux.org/packages/comtrol-rocketport-express-infinity/ (Polled mode)
#[ 2697.826339] rocketrp2 0000:06:00.0: found RocketPort Express 8, Octa DB, Selectable with 8 ports
#[ 2697.932931] 0000:06:00.0: ttyRP0 at MMIO 0xf7d00000 (irq = 16, base_baud = 2764800) is a RocketPort Express 8, Octa DB, Selectable (rs232)
#[ 2697.933145] 0000:06:00.0: ttyRP1 at MMIO 0xf7d00040 (irq = 16, base_baud = 2764800) is a RocketPort Express 8, Octa DB, Selectable (rs232)
#[ 2697.933342] 0000:06:00.0: ttyRP2 at MMIO 0xf7d00080 (irq = 16, base_baud = 2764800) is a RocketPort Express 8, Octa DB, Selectable (rs232)
#[ 2697.933557] 0000:06:00.0: ttyRP3 at MMIO 0xf7d000c0 (irq = 16, base_baud = 2764800) is a RocketPort Express 8, Octa DB, Selectable (rs232)
#[ 2697.933770] 0000:06:00.0: ttyRP4 at MMIO 0xf7d00100 (irq = 16, base_baud = 2764800) is a RocketPort Express 8, Octa DB, Selectable (rs232)
#[ 2697.933977] 0000:06:00.0: ttyRP5 at MMIO 0xf7d00140 (irq = 16, base_baud = 2764800) is a RocketPort Express 8, Octa DB, Selectable (rs232)
#[ 2697.934140] 0000:06:00.0: ttyRP6 at MMIO 0xf7d00180 (irq = 16, base_baud = 2764800) is a RocketPort Express 8, Octa DB, Selectable (rs232)
#[ 2697.934271] 0000:06:00.0: ttyRP7 at MMIO 0xf7d001c0 (irq = 16, base_baud = 2764800) is a RocketPort Express 8, Octa DB, Selectable (rs232)
#[ 2697.934371] rocketrp2 0000:06:00.0: polling at 100Hz

_modulename='rocketrp2'
_origmodname='rp2'

set -u
pkgname='comtrol-rocketport-express-infinity'
pkgver='2.06'
pkgrel='1'
pkgdesc='kernel module driver for Comtrol RocketPort Express Infinity Rocketmodem serial RS-232 422 485 port'
arch=('i686' 'x86_64')
url='http://downloads.comtrol.com/html/rp_express_drivers.htm'
license=('GPL')
makedepends=('gzip' 'findutils' 'sed' 'diffutils' 'patch')
backup=("etc/modprobe.d/${_modulename}.conf")
install="${pkgname}-install.sh"
_srcdir="rocketport_infinity_express-linux-${pkgver}"
source=("http://downloads.comtrol.com/beta/rport_express/drivers/Linux/rocketport_infinity_express-linux-${pkgver}.tar.gz")
sha256sums=('6ffd81e40ef90eb84bbffbb4662ac08225ec7cdf7da09322e22f83721111c4bd')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

# We can't modify .install but we can stop and force the user to fix it.
_install_check() {
  local _ckvar
  local _ckline
  local _pkgname="${pkgname}"
  for _ckvar in '_pkgname' '_modulename' '_origmodname'; do
    _ckline="${_ckvar}='${!_ckvar}'"
    if ! grep -q "^${_ckline}"'$' "${startdir}/${install}"; then
      msg "${install} must be fixed"
      echo "${_ckline}"
      set +u
      false
    fi
  done
}

prepare() {
  set -u
  _install_check
  cd "${_srcdir}"
  find -type 'f' -exec chmod 644 '{}' '+'
  chmod 755 *.sh

  # Fix umbrella makefile
  sed -e 's:/lib/:/usr/lib/:g' -i 'Makefile'

  # Branding
  sed -e '/printk/ s@DRV_VERS@& " Arch Linux'" https://aur.archlinux.org/packages/${pkgname}/"'" @g' -i "${_origmodname}.c"

  # Change module name to prevent conflict with built in module
  if [ "${_modulename}" != "${_origmodname}" ]; then
    sed -e "s:${_origmodname}:${_modulename}:g" -i 'Makefile'
    sed -e "s|\"${_origmodname}:|\"${_modulename}:|g" \
        -e "/DRV_NAME/ s:\"${_origmodname}:\"${_modulename}:g" \
      -i "${_origmodname}.c"
    sed -e "s:${_origmodname}:${_modulename}:g" -i 'install.sh'
    mv "${_origmodname}.c" "${_modulename}.c"
  fi

  # Make installer package compatible
  #cp -p 'install.sh' 'install.Arch.sh' # debugging
  sed -e '1a set -e' -e '1a set -u' -e '#1a set -x' -e '1a DESTDIR=' -i 'install.sh'
  sed -e '# Fix sbin and lib' \
      -e 's:/usr/sbin/:/usr/bin/:g' \
      -e 's:/sbin/:/usr/bin/:g' \
      -e 's:/lib/:/usr/lib/:g' \
      -e '# Add DESTDIR' \
      -e 's:/usr/:"${DESTDIR}"&:g' \
      -e 's:/etc/:"${DESTDIR}"&:g' \
      -e 's:""${DESTDIR}":"${DESTDIR}:g' \
    -i 'install.sh'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s -j1 # too small for parallel make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  if [ "${_opt_DKMS}" -eq 0 ]; then
    # I don't want Linux version info showing on AUR web. After a few months 'linux<0.0.0' makes it look like an out of date package.
    local _kernelversionsmall="$(uname -r)"
    _kernelversionsmall="${_kernelversionsmall%%-*}"
    _kernelversionsmall="${_kernelversionsmall%\.0}" # trim 4.0.0 -> 4.0, 4.1.0 -> 4.1
    # prevent the mksrcinfo bash emulator from getting these vars!
    eval 'conf''licts=("linux>${_kernelversionsmall}" "linux<${_kernelversionsmall}")'
    eval 'dep''ends+=("linux=${_kernelversionsmall}")'
  fi

  sed -e 's:^\(DESTDIR\)=.*$'":\1=${pkgdir}:g" -i 'install.sh'
  install -d \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/lib/modules/$(uname -r)/kernel/drivers" \
    "${pkgdir}/etc/modules-load.d" \
    "${pkgdir}/etc/modprobe.d"
  ln -s '/usr/bin/true' "${pkgdir}/usr/bin/depmod"
  make -s -j1 DESTDIR="${pkgdir}" install
  rm "${pkgdir}/usr/bin/depmod"
  rmdir "${pkgdir}/usr/bin"

  # Modern kernels detect and load automatically
  rm -r "${pkgdir}/etc/modules-load.d"

  # Blacklist exiting incomplete built in module
  cat >> "${pkgdir}/etc/modprobe.d/${_modulename}.conf" << EOF
# Do not load built in module with only barebones support
blacklist ${_origmodname}
EOF

  # The module is in the same folder as DKMS. Compress to a different name to prevent conflict.
  # When future versions of DKMS compress we'll stop doing this.
  find "${pkgdir}/usr/lib/modules/" -type 'f' -name '*.ko' -exec 'gzip' '-9' '{}' ';'

  if [ "${_opt_DKMS}" -ne 0 ]; then
    rm -rf "${pkgdir}/usr/lib/modules/"
    local _dkms="${pkgdir}/usr/src/${pkgname}-${pkgver}"
    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

PACKAGE_NAME="${pkgname}"
PACKAGE_VERSION="${pkgver}"
AUTOINSTALL="yes"

BUILT_MODULE_NAME[0]="${_modulename}"
BUILT_MODULE_LOCATION[0]=""
# Using all processors doesn't compile this tiny module any faster.
MAKE[0]="make -j1"
CLEAN[0]="make -j1 clean"
# The install version is .ko.gz. The DKMS version is .ko. No conflicts.
DEST_MODULE_LOCATION[0]="/kernel/drivers/tty"
EOF
    ) "${_dkms}/dkms.conf"
    install -dm755 "${_dkms}/"
    cp -pr './' "${_dkms}/"
    pushd "${_dkms}" > /dev/null
    rm 'HISTORY' *.sh
    popd > /dev/null
    sed -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple' \
        -e 's:shell uname -r:KERNELRELEASE:g' \
      -i "${_dkms}/Makefile"
    make -s -C "${_dkms}/" clean
  fi
  set +u
}

set +u
