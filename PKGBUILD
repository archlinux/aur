# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# This is for Express or Infinity, not PCI and uPCI
# This blacklists and replaces the built in driver

_opt_DKMS=1           # This can be toggled between installs

#export KERNELRELEASE="$(basename $(dirname /usr/lib/modules/6.12.*/vmlinuz))"

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
pkgver='3.01'
pkgrel='1'
pkgdesc='kernel module driver for Comtrol RocketPort Express Infinity Rocketmodem serial RS-232 422 485 port'
arch=('i686' 'x86_64')
url='http://downloads.comtrol.com/html/rp_express_drivers.htm'
license=('GPL')
makedepends=('gzip' 'findutils' 'sed' 'diffutils' 'patch')
backup=("etc/modprobe.d/${_modulename}.conf")
install="${pkgname}-install.sh"
_verwatch=('http://downloads.comtrol.com/rport_express/drivers/Linux/' '.*>rocketport_infinity_express-linux-\([0-9\.]\+\)\.tar\.gz.*' 'f')
_srcdir="rocketport_infinity_express-linux-${pkgver}"
source=(
  #"http://downloads.comtrol.com/rport_express/drivers/Linux/rocketport_infinity_express-linux-${pkgver}.tar.gz"
  "https://files.comtrol.com/rport_express/drivers/linux/rocketport_infinity_express-linux-${pkgver}.tar.gz"
  '0000-kernel-5.12-tty-low_latency.patch'
  '0001-kernel-6.0-set_termios-const-ktermios.patch'
)
md5sums=('185f9db39e71e0a657502a5c89bc2c3e'
         'c9266b2221c94260be22d6de216f1cc9'
         'd2a8d4ea27c25651ad3fcd3d4aafa007')
sha256sums=('7e3aee7462986b25a00ec4ec1141c5e2538669ec4866c974799cffc346b2fccb'
            '8ce087d7a4da17fd0c52fc257058f8f81af944bc5859978a0329019e08deb868'
            '0ea99153c86c8f6a3faa9362859d5ff0c71838b710bc2e4c9d4b888fb81c0652')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

_opt_LEGACY_VER=''
# Install both versions so dkms gets the right version for each kernel
if [ "${_opt_DKMS}" -ne 0 ] && false; then
  # 2.10 supports Kernels 2.6.33 through 4.14.x
  # >=2.16 supports Kernels 4.15 through 4.17.x.
  _opt_LEGACY_VER='2.10'
  if [ "$(vercmp "${pkgver}" "${_opt_LEGACY_VER}")" -gt 0 ]; then
    _srcalt="${_srcdir//${pkgver}/${_opt_LEGACY_VER}}"
    source+=("http://downloads.comtrol.com/rport_express/drivers/Linux/${_srcalt}.tar.gz")
  else
    _opt_LEGACY_VER=''
  fi
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

_fn_patch_km() {
  # Fix permissions
  find -type 'f' -exec chmod 644 '{}' '+'
  chmod 755 *.sh

  # Fix umbrella makefile
  #cp -p 'Makefile'{,.Arch}
  local _seds=(
    -e 's:/lib/:/usr/lib/:g'
    -e '# Switch SUBDIRS= to M= for Kernel 5.4'
    -e 's:SUBDIRS=:M=:g'
    -e '/^clean:/ a TaB$(MAKE) -C $(LINUX_SRC) M=$(PWD) clean'
    -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple'
    -e 's:\$(shell uname -r):$(KERNELRELEASE):g'
    -e '1i KERNELRELEASE ?= $(shell uname -r)'
  )
  sed "${_seds[@]}" -i 'Makefile'
  sed -e 's:^TaB:\t:g' -i 'Makefile'
  test ! -s 'Makefile.Arch'

  # Branding in dmesg
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
  #cp -p 'install.sh' 'install.Arch.sh' # testmode for diff comparison
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
  ! test -s 'install.Arch.sh' || echo "${}"

}

prepare() {
  set -u
  _install_check
  cd "${_srcdir}"

  _fn_patch_km "${pkgver}"
  if [ ! -z "${_opt_LEGACY_VER}" ]; then
    pushd "${srcdir}/${_srcalt}" > /dev/null
    _fn_patch_km "${_opt_LEGACY_VER}"
    popd > /dev/null
  fi

  local _patches=()
  #_patches+=('0000-kernel-5.12-tty-low_latency.patch')
  #_patches+=('0001-kernel-6.0-set_termios-const-ktermios.patch') # https://lore.kernel.org/linux-arm-kernel/20220816115739.10928-9-ilpo.jarvinen@linux.intel.com/T/

  local _pt _ptf=() _pts=()
  for _pt in "${_patches[@]}"; do
    set +u; msg2 "Patch ${_pt}"; set -u
    if patch -Nup1 --no-backup-if-mismatch -i "${srcdir}/${_pt}"; then
      _pts+=("${_pt}")
    else
      _ptf+=("${_pt}")
    fi
  done
  if [ "${#_ptf[@]}" -gt 0 ]; then
     if [ "${#_pts[@]}" -gt 0 ]; then
       printf 'Patch success %s\n' "${_pts[@]}"
       printf 'Warning: Some old patches may need to be removed even if they are successful\n'
     fi
     printf 'Patch failed %s\n' "${_ptf[@]}"
     set +x
     false
  fi
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  #diff -pNaru5 'a' 'b' > "0000-$RANDOM.patch"

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

  local _KERNELRELEASE_PKG="${KERNELRELEASE:-$(uname -r)}"
  if [ "${_opt_DKMS}" -eq 0 ]; then
    # I don't want Linux version info showing on AUR web. After a few months 'linux<0.0.0' makes it look like an out of date package.
    local _kernelversionsmall="${_KERNELRELEASE_PKG}"
    _kernelversionsmall="${_kernelversionsmall%%-*}"
    _kernelversionsmall="${_kernelversionsmall%\.0}" # trim 4.0.0 -> 4.0, 4.1.0 -> 4.1
    # prevent the mksrcinfo bash emulator from getting these vars!
    eval 'conf''licts=("linux>${_kernelversionsmall}" "linux<${_kernelversionsmall}")'
    eval 'dep''ends+=("linux=${_kernelversionsmall}")'
  fi

  sed -e 's:^\(DESTDIR\)=.*$'":\1=${pkgdir}:g" -i 'install.sh'
  install -d \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/lib/modules/${_KERNELRELEASE_PKG}/kernel/drivers" \
    "${pkgdir}/etc/modules-load.d" \
    "${pkgdir}/etc/modprobe.d"
  ln -s '/usr/bin/true' "${pkgdir}/usr/bin/depmod"
  make -s -j1 DESTDIR="${pkgdir}" REBUILD_INITRAMFS='n' install
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

  # DKMS
  if [ "${_opt_DKMS}" -ne 0 ]; then
    rm -r "${pkgdir}/usr/lib/modules/"
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
_fn_dkmsinst() {
    install -d "$1"
    cp -p * "$1/"
    pushd "$1" > /dev/null
    rm 'HISTORY' *.sh
    popd > /dev/null
    make -s -C "$1/" clean
}
    if [ -z "${_opt_LEGACY_VER}" ]; then
      _fn_dkmsinst "${_dkms}"
    else
      # It is not necessary to install files to ${_dkms} for pacman -Qo
      # The cp does not happen in /usr/src but in /var/lib/dkms where dkms cleans everything up
      _fn_dkmsinst "${_dkms}/${pkgver}"

      # Install a custom make helper that selects source based on kernel version
      sed -e "/^MAKE/ s:make :${_dkms#${pkgdir}}/makedkms.sh"' KERNELRELEASE=$kernelver :g' -i "${_dkms}/dkms.conf"
      install -Dm744 <(cat << EOF
#!/usr/bin/bash

set -e
set -u

kv="\$*" # \$@ is not what we want here.
kv="\${kv##*KERNELRELEASE=}"
kv="\${kv%% *}"

if [ "\$(vercmp "\${kv}" '4.15')" -lt 0 ]; then
  cp -p '${_opt_LEGACY_VER}'/* .
else
  cp -p '${pkgver}'/* .
fi
make "\$@"
EOF
      ) "${_dkms}/makedkms.sh"

      # Install legacy code
      pushd "${srcdir}/${_srcalt}" > /dev/null
      _fn_dkmsinst "${_dkms}/${_opt_LEGACY_VER}"
      popd > /dev/null
    fi
  fi
  set +u
}

set +u
