# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

# Todo: remove source file reference (__FILE__?) from cti_serial_core.ko
# Todo: driver should only create /dev/ttyCTI* for number of ports found
# Todo: make install for utilities
# Todo: How do we configure Xtreme/104 with setserial according to readme.txt
# Todo: man pages for utilities
# Todo: Update Copyright dates on utilities
# Todo: Utility readme repeats set485 in setmodem section

# For now the source file is obtained by request from ConnectTech.

# sudo cat /proc/tty/driver/ctipu

_opt_DKMS=1            # This can be toggled between installs

set -u
pkgname='connecttech-cti-serial'
pkgver='1.42'
pkgrel='2'
pkgdesc='tty UART driver for BlueStorm BlueHeat Xtreme/104-Plus Titan and Xtreme/104-Express families'
arch=('i686' 'x86_64')
url='http://connecttech.com/product/pci-express-bluestorm-express/'
license=('GPL')
depends=('glibc')
_servicename='cti-serial-set485.service'
_etcconf="/etc/${_servicename/.service/.sh}"
backup=("${_etcconf#/}")
install="${pkgname}-install.sh"
_srcdir="cti_serial_${pkgver//./}"
source=(
  "file://${_srcdir}.tgz"
  '0000-kernel-4.18-proc_fops-to-proc_show.patch' # https://patchwork.kernel.org/patch/10349751/
  '0001-kernel-5.0.0-8250_core-access_ok.patch' # https://lkml.org/lkml/2019/1/4/418
)
sha256sums=('9833dfcac4b9116c1d22dcee16bb0533e7b3ab0ae3291c4570e716e1e991f042'
            'bfe7886f273eed35d36956c143cd07fa1c6c9448cf21f8484bb5a0872ea6d04e'
            'fbb546222486ccbd3fc0cfaf44c146208a27507c20788602fcc6e77853692b00')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

# We can't modify .install but we can stop and force the user to fix it.
_install_check() {
  local _ckerrs=0
  local _ckvar
  local _ckline
  local _pkgname="${pkgname}"
  for _ckvar in _pkgname _servicename _etcconf; do
    _ckline="$(declare -p  ${_ckvar} 2>/dev/null)"
    _ckline="${_ckline#* }"
    _ckline="${_ckline#* }"
    _ckline="${_ckline//\[[0-9]\]=/}" # unenumerate arrays
    _ckline="${_ckline//\"/\'}"
    if ! grep -q "^${_ckline}"'$' "${startdir}/${install}"; then
      set +u
      if [ "${_ckerrs}" -eq 0 ]; then
        msg "${install} must be fixed"
      fi
      echo "${_ckline}"
      _ckerrs=$((_ckerrs+1))
    fi
  done
  return "${_ckerrs}"
}

prepare() {
  set -u
  _install_check
  cd "${_srcdir}"

  #cp -p driver/serial_core.c{,.orig}; false
  #diff -pNau5 driver/serial_core.c{.orig,} > '0000-kernel-4.18-proc_fops-to-proc_show.patch'
  patch -Nbup0 -i "${srcdir}/0000-kernel-4.18-proc_fops-to-proc_show.patch"

  #cp -p driver/8250_core.c{,.orig}; false
  #diff -pNau5 driver/8250_core.c{.orig,} > '0001-kernel-5.0.0-8250_core-access_ok.patch'
  patch -Nbup0 -i "${srcdir}/0001-kernel-5.0.0-8250_core-access_ok.patch"

  pushd 'driver' > /dev/null
  # Fix permissions
  find -type 'f' -perm '/111' -exec chmod 644 '{}' '+'
  chmod 755 *_dr
  local _ver
  _ver="$(sed -n -e 's:^#define\sREVISION\s"\([^"]\+\).*$:\1:p' 'serial_core.c')"
  if [ "${pkgver}" != "${_ver}" ]; then
    echo "Version mismatch ${pkgver} != ${_ver}"
    set +u
    false
  fi
  unset _ver

  # Branding in dmesg
  sed -e 's/CTISerial driver revision:%s/& Arch Linux/g' -i 'serial_core.c'
  grep -qFe 'Arch Linux' 'serial_core.c' || echo "${}"

  # Fix makefile
  sed -e 's: /lib/modules: /usr/lib/modules:g' -i 'Makefile'

  popd > /dev/null
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -C 'driver' -j1
  make -C 'utilities' -j1
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

  # Kernel Module
  # https://www.linuxquestions.org/questions/linux-software-2/is-there-a-destdir-for-make-module_install-596578/
  make -C 'driver' modules_install INSTALL_MOD_PATH="${pkgdir}/usr"

  # programs
  local _exe
  for _exe in $(find 'utilities' -type 'f' -executable); do
    # Names must be findable with tab completion
    install -g uucp -Dpm754 "${_exe}" "${pkgdir}/usr/bin/${_exe##*/}-cti"
  done

  # Blacklist built in module(s)
  install -Dpm644 <(cat << EOF
# See tgz readme.txt for details on these and more options

# Expand port count
#options cti_serial_core nr_uarts=24

# Block built in kernel modules that take some cards

# Bluestorm/Express Opto BBG001
blacklist 8250_exar

# CTI boards picked up by 8250_pci can be blocked without blacklisting by lowering
# 8250.nr_uarts=? on the kernel command line.
EOF
  ) "${pkgdir}/usr/lib/modprobe.d/cti_8250_pci.conf"

  # Boot time settings
  install -Dpm644 <(cat << EOF
#!/usr/bin/sh

# Automatically generated by ${pkgname} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

$(sed -n -e '/^---/,$ p' 'utilities/README' | sed -n -e '/^[0-9].\sset485/,/^----/ p' | head --lines=-1 | sed -e 's:^.:#&:g' -e 's:\bset485\b:&-cti:g')





# These must be the last lines. Put all your CTI control lines above this.
if [ "\${1:-}" = '--systemd' ]; then
  systemd-notify --ready
fi
EOF
  ) "${pkgdir}/${_etcconf}"

  # Install persistent settings service
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=Connect Tech CTI multi port serial persistent RS-485 settings
After=network.target

[Service]
Type=notify
ExecStart=/usr/bin/bash ${_etcconf} --systemd
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
  ) "${pkgdir}/usr/lib/systemd/system/${_servicename}"

  # DKMS
  if [ "${_opt_DKMS}" -ne 0 ]; then
    rm -r "${pkgdir}/usr/lib/modules/"
    local _dkms="${pkgdir}/usr/src/${pkgname}-${pkgver}"
    #install -d "${_dkms}"

    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

PACKAGE_NAME="${pkgname}"
PACKAGE_VERSION="${pkgver}"
AUTOINSTALL="yes"

BUILT_MODULE_NAME[0]="cti_8250_pci"
BUILT_MODULE_LOCATION[0]="driver/"
# Using all processors doesn't compile this tiny module any faster.
MAKE[0]="make -C 'driver' -j1 DEBUG=n"
CLEAN[0]="make -C 'driver' -j1 clean DEBUG=n"
# Placing the DKMS generated module in a different location than the standard install prevents conflicts when PKGBUILD _opt_DKMS is toggled
DEST_MODULE_LOCATION[0]="/kernel/drivers/misc"

BUILT_MODULE_NAME[1]="cti_serial_core"
BUILT_MODULE_LOCATION[1]="driver/"
DEST_MODULE_LOCATION[1]="/kernel/drivers/misc"
EOF
    ) "${_dkms}/dkms.conf"
    install -Dpm644 driver/* -t "${_dkms}/driver"
    rm "${_dkms}/driver"/*_dr "${_dkms}/driver/readme.txt"
    make -C "${_dkms}/driver" clean
    sed -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple' \
        -e 's:$(shell uname -r):$(KERNELRELEASE):g' \
        -e 's:`uname -r`:$(KERNELRELEASE):g' \
        -e 's:$(KVER):$(KERNELRELEASE):g' \
        -e '# Get rid of make lines so make all makes the module' \
        -e 's:^\s\+make\s:#&:g' \
       -i "${_dkms}/driver/Makefile"
  fi
  set +u
}

set +u
