# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

# Todo: remove source file reference (__FILE__?) from cti_serial_core.ko
# Todo: driver should only create /dev/ttyCTI* for number of ports found
# Todo: make install for utilities
# Todo: How do we configure Xtreme/104 with setserial according to readme.txt
# Todo: man pages for utilities
# Todo: Update Copyright dates on utilities
# Todo: Utility readme repeats set485 in setmodem section

# sudo cat /proc/tty/driver/ctipu

_opt_DKMS=1            # This can be toggled between installs

set -u
pkgname='connecttech-cti-serial'
pkgver='1.46'
pkgrel='1'
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
  "https://connecttech.com/ftp/dropbox/${_srcdir}.tgz"
  #'0000-kernel-4.18-proc_fops-to-proc_show.patch' # https://patchwork.kernel.org/patch/10349751/
  #'0001-kernel-5.0.0-8250_core-access_ok.patch' # https://lkml.org/lkml/2019/1/4/418
  '0002-kernel-5.10-async-initialized.patch'
  '0003-kernel-5.12-tty-low_latency.patch'
  '0004-kernel-5.14-task_struct.state-unsigned-tty-flow-tty.patch'
  '0005-kernel-5.15-alloc_tty_driver-put_tty_driver.patch'
  '0006-kernel-5.18-bitwise.patch'
  '0007-kernel-6.0-set_termios-const-ktermios.patch'
)
_srcdir='.'
md5sums=('6e56f2b93611e4b0f367aec3a430a8f0'
         '97cd518024af079d1188398af69ca6cb'
         'b8a139a882c8aa550f33cd34d2412c45'
         'd6cf91270e603716a90ea4120a928f9f'
         'e9181275b574a74c6a180129203b3dbf'
         '052753de7460ae2e3cebd9baf3ef8332'
         '7fc262419c1363af052950ea1312294d')
sha256sums=('7c1d8ade5e605bc01f80e2ca0705d048b3c83e32e68422b836f32accb436925f'
            '3f1c0aec4f287803b0c571ce0258bf16163fed920170fb6eac2ec717f704e3e5'
            '4b5a12f5122252ccee5aec97c392f2b718284ed0d4b70ee8b506f64fb89eced7'
            '3b7b66ac199025183fe1b6e7ddb14524b88251ff6f7f739fbc3973dd4f5039d5'
            '34e3d2061b794ce52fdeed91c09561e03c424572185a65714e1fcff8878ddf9a'
            '1437ae1873d5ed5215619a96962214ca5131b3629309d21c03a8795225d66273'
            'bdb5f5c268b3df15d1901a009b62e765e64788e4fbbe853fa069d0712b7ac44a')

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

  rm -rf '.svn'

  #cp -p driver/serial_core.c{,.orig}; false
  #diff -pNau5 driver/serial_core.c{.orig,} > '0000-kernel-4.18-proc_fops-to-proc_show.patch'
  #patch -Nup0 -i "${srcdir}/0000-kernel-4.18-proc_fops-to-proc_show.patch"

  #cp -p driver/8250_core.c{,.orig}; false
  #diff -pNau5 driver/8250_core.c{.orig,} > '0001-kernel-5.0.0-8250_core-access_ok.patch'
  #patch -Nup0 -i "${srcdir}/0001-kernel-5.0.0-8250_core-access_ok.patch"

  # Kernel 5.6
  #sed -e 's:ioremap_nocache:ioremap:g' -i 'driver/8250_core.c' 'driver/8250_pci.c'

  # Not compatible with Kernel 4.4 headers
  #sed -n -e '/^#ifndef __KERNEL__/,/^#endif/ p' "/usr/lib/modules/$(uname -r)/build/include/uapi/linux/tty_flags.h" | sed -e 's:__KERNEL__:ASYNC_INITIALIZED:g' >> 'driver/serial_core_kernel510.h'
  sed -n -E -e '/ASYNCB_INITIALIZED|ASYNCB_SUSPENDED|ASYNCB_CTS_FLOW|ASYNCB_CHECK_CD|ASYNCB_NORMAL_ACTIVE|ASYNCB_CLOSING/ p' "/usr/lib/modules/$(uname -r)/build/include/uapi/linux/tty_flags.h" >> 'driver/serial_core_kernel510.h'
  #cp -pr 'driver' 'driver.orig'; false
  #diff -pNau5 'driver'{.orig,} > '0002-kernel-5.10-async-initialized.patch'
  patch -Nup0 -i "${srcdir}/0002-kernel-5.10-async-initialized.patch"
  sed -e '/ArchLinuxPatch-0002-Begin/ r driver/serial_core_kernel510.h' -i 'driver/serial_core.c' 'driver/8250_core.c'
  rm 'driver/serial_core_kernel510.h'

  #cp -p driver/serial_core.c{,.orig}; false
  #diff -pNau5 driver/serial_core.c{.orig,} > '0003-kernel-5.12-tty-low_latency.patch'
  patch -Nup0 -i "${srcdir}/0003-kernel-5.12-tty-low_latency.patch"

  # tty.stopped https://lore.kernel.org/lkml/20210505091928.22010-13-jslaby@suse.cz/
  # unsigned write_room https://www.spinics.net/lists/linux-serial/msg42297.html
  # unsigned chars_in_buffer https://www.spinics.net/lists/linux-serial/msg42299.html
  # set_current_state https://linux-kernel.vger.kernel.narkive.com/xnPfKhYP/patch-2-5-52-use-set-current-state-instead-of-current-state-take-1
  #rm -f driver/*.orig; cp -pr 'driver' 'driver.orig'; false
  #diff -pNau5 'driver'{.orig,} > '0004-kernel-5.14-task_struct.state-unsigned-tty-flow-tty.patch'
  patch -Nup0 -i "${srcdir}/0004-kernel-5.14-task_struct.state-unsigned-tty-flow-tty.patch"

  # http://lkml.iu.edu/hypermail/linux/kernel/2107.2/08799.html [PATCH 5/8] tty: drop alloc_tty_driver
  # http://lkml.iu.edu/hypermail/linux/kernel/2107.2/08801.html [PATCH 7/8] tty: drop put_tty_driver
  #rm -f driver/*.orig; cp -pr 'driver' 'driver.orig'; false
  #diff -pNau5 'driver'{.orig,} > '0005-kernel-5.15-alloc_tty_driver-put_tty_driver.patch'
  patch -Nup0 -i "${srcdir}/0005-kernel-5.15-alloc_tty_driver-put_tty_driver.patch"

  #rm -f driver/*.orig; cp -pr 'driver' 'a'; ln -s 'driver' 'b'; false
  #diff -pNaru5 'a' 'b' > '0006-kernel-5.18-bitwise.patch'
  patch -d 'driver' -Nup1 -i "${srcdir}/0006-kernel-5.18-bitwise.patch"

  # https://lore.kernel.org/linux-arm-kernel/20220816115739.10928-9-ilpo.jarvinen@linux.intel.com/T/
  #rm -f driver/*.orig; cp -pr 'driver' 'a'; ln -s 'driver' 'b'; false
  #diff -pNaru5 'a' 'b' > '0007-kernel-6.0-set_termios-const-ktermios.patch'
  patch -d 'driver' -Nup1 -i "${srcdir}/0007-kernel-6.0-set_termios-const-ktermios.patch"

  pushd 'driver' > /dev/null
  # Fix permissions
  find -type 'f' -perm '/111' -exec chmod 644 '{}' '+'
  chmod 755 *_dr
  local _ver
  #_ver="$(sed -n -e 's:^#define\sREVISION\s"\([^"]\+\).*$:\1:p' 'serial_core.c')"
  _ver="$(sed -n -e 's:^Revision \([0-9.]\+\),\?.*$:\1:p' 'readme.txt' | tail -1)"
  if [ "${pkgver}" != "${_ver}" ]; then
    echo "Version mismatch ${pkgver} != ${_ver}"
    set +u
    false
  fi
  unset _ver
  sed -e '/^#define\sREVISION\s/ s:"[^"]\+":"'"${pkgver}"'":g' -i 'serial_core.c'

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
