# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# TODO: The Linux kernel in tree rocket module is (C)2003 and should be updated to this driver.
# TODO: Test firmware updater.
# TODO: Could the RocketModem II firmware updater be launched by udev?
# TODO: Should the firmware updater be set to an earlier target to minimize conflicts with programs that use the modems?
# TODO: kernel bug lspci: The RocketPort PCI 4J is claimed to have RJ11 connectors. It has RJ45 connectors. The 8J has RJ11 connectors.

# This is for PCI and uPCI, not Express or Infinity

_opt_DKMS=1           # This can be toggled between installs

# ls -l /dev/ttyR*
# lsmod | grep rocket
# lspci -v | grep -A4 -i rocket
# sudo cat /proc/tty/driver/rocketupci

# dmesg | grep -A8 -i rocket
#[    4.138731] rocketupci: Comtrol RocketPort driver version 4.05 Arch Linux https://aur.archlinux.org/packages/comtrol-rocketport-upci/
#[    4.138880] rocketupci 0000:07:02.0: found RP UPCI Plus 4 port RJ45 with 4 ports
#[    4.139228] 0000:07:02.0: ttyR0 at I/O 0x1c000 (irq = 18, base_baud = 921600) is a RP UPCI Plus 4 port RJ45
#[    4.139622] 0000:07:02.0: ttyR1 at I/O 0x1c002 (irq = 18, base_baud = 921600) is a RP UPCI Plus 4 port RJ45
#[    4.140027] 0000:07:02.0: ttyR2 at I/O 0x1c004 (irq = 18, base_baud = 921600) is a RP UPCI Plus 4 port RJ45
#[    4.140448] 0000:07:02.0: ttyR3 at I/O 0x1c006 (irq = 18, base_baud = 921600) is a RP UPCI Plus 4 port RJ45
#[    4.140504] rocketupci 0000:07:02.0: polling at 100Hz

set -u
pkgname='comtrol-rocketport-upci'
pkgver='4.05'
pkgrel='1'
pkgdesc='kernel module driver for Comtrol RocketPort PCI Plus Universal uPCI CPCI Rocketmodem serial RS-232 422 port'
arch=('i686' 'x86_64')
url='http://downloads.comtrol.com/html/RPuPCI_drivers.htm'
license=('GPL')
makedepends=('gzip' 'findutils' 'sed' 'diffutils' 'patch')
backup=('etc/modprobe.d/rocketupci.conf')
install="${pkgname}-install.sh"
_srcdir="rocketport-linux-${pkgver}"
source=("http://downloads.comtrol.com/rport/drivers/u_pci/linux/rocketport-linux-${pkgver}.tar.gz" 'rocketport-upci-firmware.sh')
sha256sums=('370f65a2dc5128e57cb7480aff5756996ceb24ad4312d1454f5debb1611fe5da'
            '6fa93b24ffe0ff6849b9b05bcd55dcaf4eb09c13321c55bbb2f04b369008d149')

_modulename='rocketupci'

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
  for _ckvar in _pkgname _modulename; do
    _ckline="${_ckvar}='${!_ckvar}'"
    if ! grep -q "^${_ckline}"'$' "${startdir}/${install}"; then
      set +u
      msg "${install} must be fixed"
      echo "${_ckline}"
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
  sed -e '/printk/ s@DRV_VERS@& " Arch Linux'" https://aur.archlinux.org/packages/${pkgname}/"'" @g' -i 'rocket.c'

  # Change module name to prevent conflict with rocket.ko (C)2003 for RocketPort PCI
  if [ "${_modulename}" != 'rocket' ]; then
    sed -e "s:rocket:${_modulename}:g" -i 'Makefile'
    sed -e "s|rocket:|${_modulename}:|g" \
        -e "/DRV_NAME/ s:rocket:${_modulename}:g" \
      -i 'rocket.c'
    sed -e "s:rocket:${_modulename}:g" -i 'install.sh'
    mv 'rocket.c' "${_modulename}.c"
  fi

  # Fix loadrm2 makefile
  sed -e 's:/sbin:/usr/bin:g' \
      -e 's: /usr/: $(DESTDIR)/usr/:g' \
      -e 's: /etc: $(DESTDIR)/etc:g' \
    -i 'loadrm2/Makefile'

  # Move the firmware out of /etc
  sed -e "s:/etc/:/usr/lib/firmware/${pkgname}/:g" -i 'loadrm2/loadrm2.h'

  # Make installer package compatible
  cp -p 'install.sh' 'install.Arch.sh' # debugging
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
    "${pkgdir}/etc" \
    "${pkgdir}/etc/modules-load.d" \
    "${pkgdir}/etc/modprobe.d"
  ln -s '/usr/bin/true' "${pkgdir}/usr/bin/depmod"
  make -s -j1 DESTDIR="${pkgdir}" install rm2_install
  rm "${pkgdir}/usr/bin/depmod"
  install -Dp "${pkgdir}/etc"/*.rm -t "${pkgdir}/usr/lib/firmware/${pkgname}"
  rm "${pkgdir}/etc"/*.rm

  # Modern kernels detect and load automatically
  rm -r "${pkgdir}/etc/modules-load.d"

  # Blacklist exiting incomplete rocket module
  cat >> "${pkgdir}/etc/modprobe.d/rocketupci.conf" << EOF
# Do not load old rocket module that only supports RocketPort PCI
blacklist rocket
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
    rm -r 'loadrm2'
    popd > /dev/null
    sed -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple' \
        -e 's:shell uname -r:KERNELRELEASE:g' \
        -e '# Disable compile loadrm2' \
        -e '/loadrm2/ s:^:#:g' \
      -i "${_dkms}/Makefile"
    make -s -C "${_dkms}/" clean
  fi
  set +u
}

set +u
