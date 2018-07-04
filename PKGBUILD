# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# TODO: The Linux kernel in tree rocket module is (C)2003 and should be updated to this driver.
# TODO: Test firmware updater.
# TODO: Could the RocketModem II firmware updater be launched by udev?
# TODO: Should the firmware updater be set to an earlier target to minimize conflicts with programs that use the modems?
# TODO: kernel bug lspci: The RocketPort PCI 4J is claimed to have RJ11 connectors. It has RJ45 connectors. The 8J has RJ11 connectors.

# This is for PCI and uPCI, not Express or Infinity
# This blacklists and replaces the built in driver

_opt_DKMS=1           # This can be toggled between installs

# ls -l /dev/ttyR[0-9]*
# lsmod | grep rocket
# lspci -v | grep -B7 -i rocket
# sudo cat /proc/tty/driver/rocketupci

# dmesg | grep -A8 -i rocket
#[    4.138731] rocketupci: Comtrol RocketPort driver version 4.05 Arch Linux https://aur.archlinux.org/packages/comtrol-rocketport-upci/
#[    4.138880] rocketupci 0000:07:02.0: found RP UPCI Plus 4 port RJ45 with 4 ports
#[    4.139228] 0000:07:02.0: ttyR0 at I/O 0x1c000 (irq = 18, base_baud = 921600) is a RP UPCI Plus 4 port RJ45
#[    4.139622] 0000:07:02.0: ttyR1 at I/O 0x1c002 (irq = 18, base_baud = 921600) is a RP UPCI Plus 4 port RJ45
#[    4.140027] 0000:07:02.0: ttyR2 at I/O 0x1c004 (irq = 18, base_baud = 921600) is a RP UPCI Plus 4 port RJ45
#[    4.140448] 0000:07:02.0: ttyR3 at I/O 0x1c006 (irq = 18, base_baud = 921600) is a RP UPCI Plus 4 port RJ45
#[    4.140504] rocketupci 0000:07:02.0: polling at 100Hz

_modulename='rocketupci'
_origmodname='rocket'

set -u
pkgname='comtrol-rocketport-upci'
pkgver='4.07'
pkgrel='1'
pkgdesc='kernel module driver for Comtrol RocketPort PCI Plus Universal uPCI CPCI Rocketmodem serial RS-232 422 port'
arch=('i686' 'x86_64')
url='http://downloads.comtrol.com/'
license=('GPL')
makedepends=('gzip' 'findutils' 'sed' 'diffutils' 'patch')
backup=("etc/modprobe.d/${_modulename}.conf")
install="${pkgname}-install.sh"
_srcdir="rocketport-linux-${pkgver}"
source=("http://downloads.comtrol.com/obsolete/rport/drivers/u_pci/linux/${pkgver}/rocketport-linux-${pkgver}.tar.gz" 'rocketport-upci-firmware.sh')
sha256sums=('f0c483cc58e24910669c67aad40b8c9f781f4c2ef41a544eaab5af9c87eaddd0'
            '6fa93b24ffe0ff6849b9b05bcd55dcaf4eb09c13321c55bbb2f04b369008d149'
            '370f65a2dc5128e57cb7480aff5756996ceb24ad4312d1454f5debb1611fe5da')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

_opt_LEGACY_VER=''
# Install both versions so dkms gets the right version for each kernel
if [ "${_opt_DKMS}" -ne 0 ]; then
  # 4.05 supports Kernels 2.6.24 through 4.14.x
  # >=4.07 supports Kernels 4.15 through 4.17.x
  _opt_LEGACY_VER='4.05'
  if [ "$(vercmp "${pkgver}" "${_opt_LEGACY_VER}")" -gt 0 ]; then
    _srcalt="${_srcdir//${pkgver}/${_opt_LEGACY_VER}}"
    source+=("http://downloads.comtrol.com/obsolete/rport/drivers/u_pci/linux/${_opt_LEGACY_VER}/rocketport-linux-${_opt_LEGACY_VER}.tar.gz")
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
  sed -e 's:/lib/:/usr/lib/:g' -i 'Makefile'

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

  # Fix loadrm2 makefile
  sed -e 's:/sbin:/usr/bin:g' \
      -e 's: /usr/: $(DESTDIR)/usr/:g' \
      -e 's: /etc: $(DESTDIR)/etc:g' \
    -i 'loadrm2/Makefile'

  # Move the firmware out of /etc
  sed -e "s:/etc/:/usr/lib/firmware/${pkgname}/:g" -i 'loadrm2/loadrm2.h'

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
  make -s -j1 DESTDIR="${pkgdir}" REBUILD_INITRAMFS='n' install rm2_install
  rm "${pkgdir}/usr/bin/depmod"
  install -Dp "${pkgdir}/etc"/*.rm -t "${pkgdir}/usr/lib/firmware/${pkgname}"
  rm "${pkgdir}/etc"/*.rm

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

  # Install the setcountry script with a name findable by tab completion
  install -Dpm755 'setcountry.sh' "${pkgdir}/usr/bin/setcountry-rocketmodem.sh"

  # Install RocketPort II firmware helper
  install -Dpm755 "${srcdir}/rocketport-upci-firmware.sh" -t "${pkgdir}/usr/bin"
  sed -e 's:^\(module\)=.*$'":\1='${_modulename}':g" -i  "${pkgdir}/usr/bin/rocketport-upci-firmware.sh"

  # Install RocketPort II firmware service
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=Comtrol RocketModem II Firmware Loader
After=network.target

[Service]
Type=notify
# We want the logs to show that the modems were initialized
ExecStart=/usr/bin/rocketport-upci-firmware.sh --systemd -p
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
  ) "${pkgdir}/usr/lib/systemd/system/rocketport-upci-firmware.service"

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
    cp -pr './' "$1/"
    pushd "$1" > /dev/null
    rm 'HISTORY' *.sh
    rm -r 'loadrm2'
    popd > /dev/null
    sed -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple' \
        -e 's:shell uname -r:KERNELRELEASE:g' \
        -e '# Disable compile loadrm2' \
        -e '/loadrm2/ s:^:#:g' \
      -i "$1/Makefile"
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
