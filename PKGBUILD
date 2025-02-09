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

#export KERNELRELEASE="$(basename $(dirname /usr/lib/modules/6.13.*/vmlinuz))"

set -u
pkgname='connecttech-cti-serial'
pkgver='1.46'
pkgrel='4'
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
  '0008-kernel-6.3-tty_port_operations-int-to-bool.patch'
  '0009-kernel-6.6-struct-tty_operations-size_t.patch'
  '0010-gcc-no-previous-prototype-for-non-static-functions.patch'
  '0011-kernel-6.8-kernel-4.3-strlcpy-strscpy.patch'
  '0012-kernel-6.8-tty_driver.h-send_xchar-to-u8.patch'
  '0013-kernel-6.10-platform_driver-remove-void-return.patch'
  '0014-kernel-6.13-irq_get_nr_irqs.patch'
)
md5sums=('6e56f2b93611e4b0f367aec3a430a8f0'
         '9a93004eac4487957ea4a822cc1167a1'
         '54ced1c19a3597e087b700d98d63a10c'
         'd0e427b7def4f2ecbf6a393158f7ce5e'
         'dd9106c2ff838423791fd9431e8cadda'
         '68dc760530917337e3c2947899c4c1f9'
         '782a3a72f5acfa62cc4f8090e4a83cb6'
         '36113fbb937a070c0e92134782eb71f8'
         '8e4dd0aa9539f5e87d12b7adbcf653b0'
         'c2578a9b11295b55beb707c0c76b8f58'
         'b76bc6e1f0bfe9353e9776c099f73daa'
         '0c10b25ea11b95873afb29663a657375'
         'ebe2874c60ae0c9b3b6ad06af269034f'
         '8ecd628325af9a9015284a0f9569a9b6')
sha256sums=('7c1d8ade5e605bc01f80e2ca0705d048b3c83e32e68422b836f32accb436925f'
            '1f569305d4478a0dd5e1a99f0f76bb39a7d70b3cf2480320fb57a062f0e1141d'
            'ccbc1d7cc70b7473a8c73609230a3b2fa28235e4f61d70b62049d126e0183449'
            'cdcd583c804e7c41a60a6d633d8ffb3ac59f6ce4ec50ced95926ca1f2fa62634'
            '08a3708e08dddb5e6127bdd13b7ad4ea8db539c3226391538c7a875be80e6912'
            'bcb0eec3c4e7cce8d4a2382f25f0dde7a83693a26792e1244c264582f146dff1'
            'faa4310269889649d69685a55db48b866d91987321ba03a7083d73b3b9458766'
            'd3d205486258c0aa181ce87c68e96eb6c19ce69eb1b11da88d39f47ec694cb05'
            '98d97104dc2e479a1012b52277a875da005d8e5ef0d06b57e8808e5e75e575d1'
            '8bb68c2d49d4431ebfd3fda3c23d76f76b467854637185311ce93b09a7453df0'
            '453f6a01b041e6f598b2de4467e3f346aaaa81cac041a5c02315f8b48aaff12a'
            '24cc0ed9d03806858ebdc34b1d95e3f8b5e18b69753dd489068297c7eae3d3b9'
            'a20bbf93ba04c297005f8976309601cb267c3a2b1e551a43a477c16348bfc159'
            '6126618a2199cf06825acb284534a7ebe0a036ea4739bfca64c62d7f13beb840')
noextract=("${source[0]##*/}")

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
  if [ ! -d "${_srcdir}" ]; then
    mkdir "${_srcdir}"
    bsdtar -C "${_srcdir}" -xf "${_srcdir}.tgz"
  fi
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
  patch -Nup1 -i "${srcdir}/0002-kernel-5.10-async-initialized.patch"
  sed -e '/ArchLinuxPatch-0002-Begin/ r driver/serial_core_kernel510.h' -i 'driver/serial_core.c' 'driver/8250_core.c'
  rm 'driver/serial_core_kernel510.h'

  local _patches=()
  _patches+=('0003-kernel-5.12-tty-low_latency.patch')

  # tty.stopped https://lore.kernel.org/lkml/20210505091928.22010-13-jslaby@suse.cz/
  # unsigned write_room https://www.spinics.net/lists/linux-serial/msg42297.html
  # unsigned chars_in_buffer https://www.spinics.net/lists/linux-serial/msg42299.html
  # set_current_state https://linux-kernel.vger.kernel.narkive.com/xnPfKhYP/patch-2-5-52-use-set-current-state-instead-of-current-state-take-1
  _patches+=('0004-kernel-5.14-task_struct.state-unsigned-tty-flow-tty.patch')

  # http://lkml.iu.edu/hypermail/linux/kernel/2107.2/08799.html [PATCH 5/8] tty: drop alloc_tty_driver
  # http://lkml.iu.edu/hypermail/linux/kernel/2107.2/08801.html [PATCH 7/8] tty: drop put_tty_driver
  _patches+=('0005-kernel-5.15-alloc_tty_driver-put_tty_driver.patch')
  _patches+=('0006-kernel-5.18-bitwise.patch')
  _patches+=('0007-kernel-6.0-set_termios-const-ktermios.patch') # https://lore.kernel.org/linux-arm-kernel/20220816115739.10928-9-ilpo.jarvinen@linux.intel.com/T/
  _patches+=('0008-kernel-6.3-tty_port_operations-int-to-bool.patch')
  _patches+=('0009-kernel-6.6-struct-tty_operations-size_t.patch')
  if :; then
    _patches+=('0010-gcc-no-previous-prototype-for-non-static-functions.patch')
    _fn_pt_0010() {
      sed -Ene '/ARCH_LINUX_HCLIP_BEGIN/,/ARCH_LINUX_HCLIP_END/ p' 'driver/8250_core.c' >> 'driver/8250_coreArch.h'
      sed -Ee '/ARCH_LINUX_HCLIP_BEGIN/,/ARCH_LINUX_HCLIP_END/ d' -i 'driver/8250_core.c'
    }
  else
    _fn_pt_0010() { :; }
  fi
  _patches+=('0011-kernel-6.8-kernel-4.3-strlcpy-strscpy.patch') # https://github.com/gnif/vendor-reset/commit/f72619e468846e0bab4426f5e71b069f88c33a11
  _patches+=('0012-kernel-6.8-tty_driver.h-send_xchar-to-u8.patch')
  _patches+=('0013-kernel-6.10-platform_driver-remove-void-return.patch') # https://lore.kernel.org/lkml/2024060432-relieving-yonder-85ae@gregkh/T/
  _patches+=('0014-kernel-6.13-irq_get_nr_irqs.patch') # https://lore.kernel.org/all/20241015190953.1266194-3-bvanassche@acm.org/

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

  _fn_pt_0010

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
  #cp -p 'Makefile'{,.Arch}
  local _seds=(
    -e 's: /lib/modules: /usr/lib/modules:g'
    -e '#Get this variable out of the way'
    -e 's:KERNELRELEASE:&_ARCH:g'
    -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple'
    -e 's:$(shell uname -r):$(KERNELRELEASE):g'
    -e 's:`uname -r`:$(KERNELRELEASE):g'
    -e 's:$(KVER):$(KERNELRELEASE):g'
    -e '# Get rid of make lines so make all makes the module'
    -e 's:^\s\+make\s:#&:g'
    -e '1i KERNELRELEASE ?= $(shell uname -r)'
  )
  sed "${_seds[@]}" -i 'Makefile'
  test -s 'Makefile.Arch' && echo "${}"

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
  fi
  set +u
}

set +u
