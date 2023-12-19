# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

_opt_DKMS=1           # This can be toggled between installs
_opt_PARALLEL=0       # 0 for SPEED without parallel port, 1 to enable parallel support

#export KERNELRELEASE="$(basename $(dirname /usr/lib/modules/6.6.*/modules.alias))"

# Todo: /dev/ttyPS* should be created dynamically instead of all at once

# See /etc/perle-serial-setultrap.sh for persistent port modes

# Perle Ultraport 1 2 4 8 8i 16
# Perle PCI-RAS 4 8
# Perle Ultraport 1 2 4 8 16 SI Exar
# Perle Ultraport Express 1 2 4 8 8i
# Perle SPEED LE 1 2 4 8 Oxford 95x, not supported by built in kernel drivers
# Perle SPEED LE1P
# Perle SPEED LE1P Express

# ls -l /dev/ttyPS*
# lsmod | grep perle
# lspci -v | grep -A4 -i perle

# dmesg | grep -A8 -i perle
#[ 6188.852357] Perle Systems Limited - Parallel Port Driver: version 3.9.0 date: 2013-04-15, time: 19:04:11
#[ 6188.855676] Perle Serial driver version 3.9.0 (2013-04-11) with SHARE_IRQ SERIAL_PCI enabled
#[ 6188.856613] ttyPS0 at iomem 0xffffc90003143000 (irq = 18) is a 16C950/2/4
#[ 6188.856629] ttyPS1 at iomem 0xffffc90003145200 (irq = 18) is a 16C950/2/4
#[ 6188.856644] ttyPS2 at iomem 0xffffc90003147400 (irq = 18) is a 16C950/2/4
#[ 6188.856660] ttyPS3 at iomem 0xffffc900032e3600 (irq = 18) is a 16C950/2/4

# A list I found, (-) are not in the source files and are unlikely to be supported by this driver.
#http://deviceinbox.com/drivers/812-perle-pci-fast-16-fmc-port-adapter.html
# My SPEED4 LE 04003170 OXPCIe954-FBAG shows as 155f:b032
# My SPEED2 LE shows as 155f:b022
# 10B5:9030 PLX Technology, Inc. PCI9030 32-bit 33MHz PCI <-> IOBus Bridge
# -10B5:9050 PLX Technology, Inc. PCI <-> IOBus Bridge
# -11CB:9501 Perle SPEED4+ PCI Adapter
# -11CB:9511 Perle SPEED2+ PCI Adapter Local Bus
# 13A8:0152 Exar Corp. XR17C/D152 Dual PCI UART
# 13A8:0154 Exar Corp. XR17C154 Quad UART
# 13A8:0158 Exar Corp. XR17C158 Octal UART
# 1415:9501 Oxford Semiconductor Ltd OX16PCI954 (Quad 16950 UART) function 0 (Uart)
# -1415:9510 Oxford Semiconductor Ltd OX16PCI954 (Quad 16950 UART) function 1 (Disabled)
# 1415:9505 OXSEMI OXMPCIe95x
# 1415:9511 OXSEMI 16PCI95N
# 1415:9513 OXSEMI OXMPCI952P
# 1415:9521 OXSEMI 16PCI952
# 155F:0211 Perle UltraPort2 SI Adapter
# 155F:0221 Perle UltraPort8 SI Adapter
# 155F:0231 Perle UltraPort4 SI Adapter
# 155F:0251 Perle UltraPort8i SI Adapter
# 155F:0261 Perle UltraPort1 SI Adapter
# 155F:0311 Perle UltraPort2 Express Adapter Local Bus
# 155F:0321 Perle UltraPort8 Express Adapter Local Bus
# 155F:0331 Perle UltraPort4 Express Adapter Local Bus
# 155F:0351 Perle UltraPort8i Express Adapter
# 155F:0361 Perle UltraPort1 Express Adapter Local Bus
# 155F:B001 Perle SPEED1 LE Adapter
# 155F:B002 Perle SPEED2 LE Adapter Local Bus
# 155F:B004 Perle SPEED4 LE Adapter Local Bus
# 155F:B008 Perle SPEED8 LE Adapter
# 155F:B011 Perle SPEED1 LEV2 - Parallel Port Not Supported
# 155F:B012 Perle SPEED2 LEV2 - Parallel Port Not Supported
# 155F:B013 Perle SPEED1 LE1P Parallel Port
# 155F:B014 Perle SPEED2 LE1P Parallel Port
# 155F:B015 Perle SPEED LE1P Parallel Port
# 155F:B021 Perle SPEED1 LE Express Adapter
# 155F:B022 Perle SPEED2 LE Express - Parallel Port Not Supported
# 155F:B024 Perle SPEED2 LE1P Express Adapter
# 155F:B025 Perle SPEED LE1P Express Adapter
# 155F:B026 Perle SPEED1 LE1P Express Parallel Port
# 155F:B030 Perle UltraPort1 Express Adapter
# 155F:B031 Perle UltraPort2 Express Adapter
# 155F:B032 Perle UltraPort4 Express Adapter
# 155F:B033 Perle UltraPort8 Express Adapter
# 155F:B034 Perle UltraPort8i Express Adapter

set -u
pkgname='perle-serial'
#_pkgver='3.9.0-14'
_pkgver='3.9.2-4'
pkgver="${_pkgver//-/.}"
pkgrel='6'
pkgdesc='kernel module driver for Perle UltraPort SI Express PCI-RAS modem SPEED LE multi I/O serial parallel RS-232 422 485 port'
arch=('i686' 'x86_64')
url='https://www.perle.com/downloads/mp_speedle.shtml'
license=('GPL')
depends=('awk')
makedepends=('gzip' 'findutils' 'sed' 'diffutils' 'patch')
backup=('etc/perle-serial-setultrap.sh')
install="${pkgname}-install.sh"
_srcdir="${pkgname}-${_pkgver%%-*}"
source=(
  "https://www.perle.com/downloads/drivers/ultraport/linux/perle-serial-${_pkgver}.tgz"
  '0000-kernel-4.11-signal_pending.patch'
  '0001-kernel-5.6-proc_dir_entry-proc_ops.patch'
  '0002-kernel-4.7-async-initialized.patch'
  '0003-kernel-5.12-tty-low_latency.patch'
  '0004-tty_unregister_driver-void.patch'
  '0005-kernel-5.14-unsigned-tty-flow-tty.patch'
  '0006-kernel-5.15-alloc_tty_driver-put_tty_driver.patch'
  '0007-kernel-6.0-serial_UART_XMIT_SIZE.patch'
  '0008-kernel-6.0-set_termios-const-ktermios.patch'
  '0009-kernel-6.6-struct-tty_operations-write-size_t.patch'
)
md5sums=('85e9617af62fcab55c684fa8e4b26987'
         '52f87acfeb5f5820a74ad6aa74d18acf'
         '6dac46dc8f094dd8f8b760a68414bd0b'
         'f97869736f93fb70b9f034106697c0a2'
         'd85366f7566046dbd580850fbfa640e0'
         '7d7c57fc3a46599aebede7f940c5c5a8'
         '47a81ca7f524a3e86abb72ae872bac74'
         '128ee03b62d13384a249f6f6244d0214'
         '3058470a7727ad05608a292d4850e052'
         'ac437dd477d593c042af2752d1dfaf33'
         'b83c590138dcb1c23ad523bcbeb7ad72')
sha256sums=('d9d61a941ecfd2ff41d5450557eb9071d934497dbd10229e97c8f88b48cb9a58'
            '691e0d8d348ab9f19f0398ff79e0d4780d5110e3dd11acf3261e3f73b2983ea1'
            '31e0d244d22b16d2c0b783e38bac2d96a53cbe0ce14f2fe11142a8691ce952aa'
            '8dcb2c32d641cef471fe45db1e122492a82b3439c55be8c530758d519eeae289'
            '3e2b44baf4d8e29ce5e084485f0882a8f06a1d1b045a93ffa5cdd2f8112d1bfa'
            '7c0c4af907e68a2641beffd20bf487b47cf58ca79dea45276b5046fe81f436bc'
            '0c942db9e9a5f41873cc2ba6edae3372da672e8f82ea5c1266a2c905d4373319'
            '4c9e99b780353f270b96e57cd25e4ebf8e3058fa44105422ada42eb87cf798b2'
            '517e2aa68ee91bf2d8c0d6896dee2367cbc29f98ed5a3eb8392ca32028cd9b84'
            '9780f642f30b0870c78864418f5a46bc189f27249eba312bec91538f622c2334'
            '9c93b5166e4b13b7a2cc39868dc578a621bbe07d7295a4d10d89328cf264d055')

_opt_SERIAL=1    # This is for bug testing dkms only. All cards have serial ports so this should always be enabled.

if [ "${_opt_SERIAL}" -ne 0 ]; then
  _modulenames+=('perle-serial')
fi
if [ "${_opt_PARALLEL}" -ne 0 ]; then
  _modulenames+=('pparport-pc')
fi

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
  for _ckvar in _pkgname _modulenames; do
    _ckline="$(declare -p  ${_ckvar} 2>/dev/null)"
    _ckline="${_ckline#* }"
    _ckline="${_ckline#* }"
    _ckline="${_ckline//\[[0-9]\]=/}" # unenumerate arrays
    _ckline="${_ckline//\"/\'}"
    if ! grep -q "^${_ckline}"'$' "${startdir}/${install}"; then
      set +u
      msg "${install} must be fixed"
      echo "${_ckline}"
      false
    fi
  done
}

prepare() {
  if [ "${_opt_PARALLEL}" -eq 0 ] && [ "${_opt_SERIAL}" -eq 0 ]; then
    msg 'Disabling both PARALLEL and SERIAL does not make sense'
    false
  fi
  set -u
  _install_check
  cd "${_srcdir}"

  # Files unpack with bad permissions
  find -type 'd' -exec chmod 755 '{}' ';'
  find -type 'f' -exec chmod 644 '{}' '+'
  find -type 'f' -name '*.sh' -exec chmod 755 '{}' '+'
  rm 'querydrivers.sh'

  # Fix for reproducible build. The release date seems more useful than the build date.
  local _dtm
  _dtm="$(TZ=UTC stat -c '%y' 'pparport26/pparport_pc.c')" # 2013-04-15 19:04:11.862057600 +0000
  local _dt="${_dtm%% *}"
  local _tm="${_dtm#* }"
  _tm="${_tm%%\.*}"
  sed -e "s|__DATE__|\"${_dt}\"|g" -e "s|__TIME__|\"${_tm}\"|g" -i 'pparport26/pparport_pc.c'

  # Improve install
  #cp -p 'pserial/Makefile'{,.Arch}
  #cp -p 'pparport26/Makefile'{,.Arch}
  sed -e 's:lib/:usr/lib/:g' \
      -e '# Forgot to clean a few things and some new files for gcc8' \
      -e '/\*\.o\.cmd/ s:^.*$:& *.symvers *.order *.mod.c .*.ko.cmd .*.o.d .cache.mk\n\trm -rf .tmp_versions:g' \
      -e '# Switch SUBDIRS= to M= for Kernel 5.4' \
      -e 's:SUBDIRS=:M=$(PWD) &:g' \
      -e '/^KERNEL_/ s:shell uname -r:shell echo "$(KERNELRELEASE)":g' \
      -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple' \
      -e 's:shell uname -r:KERNELRELEASE:g' \
      -e '# DKMS sets KERNELRELEASE which accidentally launches phase 2 of this Makefile' \
      -e '# Fix by changing the detection var.' \
      -e '# SUBDIRS makes more sense to me because I can see it in the Makefile!' \
      -e 's:^ifeq (\$(KERNELRELEASE),):ifeq (\$(SUBDIRS),):g' \
      -e '# Disable stuff only used for make install' \
      -e '/^base =/,/^$/ d' \
      -e '# Disable non kernel utilities' \
      -e 's:^#UTILS:# &:g' \
      -e '# Move utils to separate target' \
      -e '/^\s*all:/ s:$(UTILS).*$::g' \
      -e 's@^install:@utils: $(UTILS)\n\n&@g' \
      -e '1i KERNELRELEASE?=$(shell uname -r)' \
    -i 'pserial/Makefile' 'pparport26/Makefile'
  ! test -s 'pserial/Makefile.Arch' || echo "${}"
  ! test -s 'pparport26/Makefile.Arch' || echo "${}"

  # Patch
  #cp -pr "${srcdir}/${_srcdir}"{,.orig-0000}; false
  #diff -pNaru5 perle-serial-3.9.2{.orig-0000,} > '0000-kernel-4.11-signal_pending.patch'
  patch -Nup1 -i "${srcdir}/0000-kernel-4.11-signal_pending.patch"

  #cp -pr "${srcdir}/${_srcdir}"{,.orig-0001}; false
  #diff -pNaru5 perle-serial-3.9.2{.orig-0001,} > '0001-kernel-5.6-proc_dir_entry-proc_ops.patch'
  patch -Nup1 -i "${srcdir}/0001-kernel-5.6-proc_dir_entry-proc_ops.patch"

  #cp -pr "${srcdir}/${_srcdir}"{,.orig-0002}; false
  #diff -pNaru5 perle-serial-3.9.2{.orig-0002,} > '0002-kernel-4.7-async-initialized.patch'
  patch -Nup1 -i "${srcdir}/0002-kernel-4.7-async-initialized.patch"

  #cp -pr "${srcdir}/${_srcdir}"{,.orig-0003}; false
  #diff -pNaru5 perle-serial-3.9.2{.orig-0003,} > '0003-kernel-5.12-tty-low_latency.patch'
  patch -Nup1 -i "${srcdir}/0003-kernel-5.12-tty-low_latency.patch"

  #cp -pr "${srcdir}/${_srcdir}"{,.orig-0004}; false
  #diff -pNaru5 perle-serial-3.9.2{.orig-0004,} > '0004-tty_unregister_driver-void.patch'
  patch -Nup1 -i "${srcdir}/0004-tty_unregister_driver-void.patch"

  #cp -pr "${srcdir}/${_srcdir}"{,.orig-0005}; false
  #diff -pNaru5 perle-serial-3.9.2{.orig-0005,} > '0005-kernel-5.14-unsigned-tty-flow-tty.patch'
  patch -Nup1 -i "${srcdir}/0005-kernel-5.14-unsigned-tty-flow-tty.patch"

  # http://lkml.iu.edu/hypermail/linux/kernel/2107.2/08799.html [PATCH 5/8] tty: drop alloc_tty_driver
  # http://lkml.iu.edu/hypermail/linux/kernel/2107.2/08801.html [PATCH 7/8] tty: drop put_tty_driver
  #cp -pr "${srcdir}/${_srcdir}"{,.orig-0006}; false
  #diff -pNaru5 perle-serial-3.9.2{.orig-0006,} > '0006-kernel-5.15-alloc_tty_driver-put_tty_driver.patch'
  patch -Nup1 -i "${srcdir}/0006-kernel-5.15-alloc_tty_driver-put_tty_driver.patch"

  # https://lore.kernel.org/linux-arm-kernel/6fb33489-946f-ad92-df35-7f608420bc7@linux.intel.com/T/
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0007-kernel-6.0-serial_UART_XMIT_SIZE.patch'
  patch -Nup1 -i "${srcdir}/0007-kernel-6.0-serial_UART_XMIT_SIZE.patch"

  # https://lore.kernel.org/linux-arm-kernel/20220816115739.10928-9-ilpo.jarvinen@linux.intel.com/T/
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0008-kernel-6.0-set_termios-const-ktermios.patch'
  patch -Nup1 -i "${srcdir}/0008-kernel-6.0-set_termios-const-ktermios.patch"

  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0009-kernel-6.6-struct-tty_operations-write-size_t.patch'
  patch -Nup1 -i "${srcdir}/0009-kernel-6.6-struct-tty_operations-write-size_t.patch"

  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  # Always build both so we know when patches are needed
  #if [ "${_opt_PARALLEL}" -ne 0 ]; then
    make -C 'pparport26' -s -j1
  #fi
  #if [ "${_opt_SERIAL}" -ne 0 ]; then
    make -C 'pserial' -s -j1 all utils # too small for parallel make
  #fi
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

  if [ "${_opt_PARALLEL}" -ne 0 ]; then
    make -C 'pparport26' -s -j1 DESTDIR="${pkgdir}/" PERLE_DIR="${srcdir}/${_srcdir}" rpm_install
  fi
  if [ "${_opt_SERIAL}" -ne 0 ]; then
    make -C 'pserial' -s -j1 DESTDIR="${pkgdir}/" PERLE_DIR="${srcdir}/${_srcdir}" rpm_install
    # Cat fight to add head and tail to existing file
    cat <(cat << EOF
#!/usr/bin/sh

# Automatically generated by ${pkgname} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/
EOF
    ) "${pkgdir}/etc/init.d/rc.setultrap" <(cat << EOF

# These must be the last lines. Put all your Perle control lines above this.
if [ "\${1:-}" = '--systemd' ]; then
  systemd-notify --ready
fi
EOF
    ) > "${pkgdir}/etc/perle-serial-setultrap.sh"
    sed -e 's:/bin/:/usr/bin/:g' -e 's:/usr/usr/:/usr/:g' -i "${pkgdir}/etc/perle-serial-setultrap.sh"
    chmod 744 "${pkgdir}/etc/perle-serial-setultrap.sh"
    rm -rf "${pkgdir}/UNKONWN" "${pkgdir}/etc/init.d"
    # Install persistent settings service
    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=Perle multi port serial persistent settings
After=network.target

[Service]
Type=notify
ExecStart=/usr/bin/bash /etc/perle-serial-setultrap.sh --systemd
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
    ) "${pkgdir}/usr/lib/systemd/system/perle-serial-settings.service"
  fi

  # Relocate misc drivers into tree
  local _ulm="${pkgdir}/usr/lib/modules/$(uname -r)"
  if [ "${_opt_SERIAL}" -ne 0 ]; then
    install -d "${_ulm}/kernel/drivers/tty"
    mv "${_ulm}/misc/perle-serial.ko" "${_ulm}/kernel/drivers/tty/"
  fi
  if [ "${_opt_PARALLEL}" -ne 0 ]; then
    install -d "${_ulm}/kernel/drivers/parport"
    mv "${_ulm}/misc/pparport-pc.ko" "${_ulm}/kernel/drivers/parport/"
  fi
  rmdir "${_ulm}/misc"

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
# MAKE[0] is expected to make all modules with an umbrella makefile
MAKE[0]="make -j1"
EOF
      ) "${_dkms}/dkms.conf"
    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

modules:

# Arch DKMS appears to not use make clean but it's here anyway just in case it does
clean:

EOF
      ) "${_dkms}/Makefile"
    local _modno=0
    if [ "${_opt_SERIAL}" -ne 0 ]; then
      cat >> "${_dkms}/dkms.conf" << EOF

BUILT_MODULE_NAME[${_modno}]="${_modulenames[${_modno}]}"
BUILT_MODULE_LOCATION[${_modno}]="pserial"
# The install version is .ko.gz. The DKMS version is .ko. No conflicts.
DEST_MODULE_LOCATION[${_modno}]="/kernel/drivers/tty"
EOF
      _modno=$((_modno+1))
      cp -pr 'pserial/' "${_dkms}/"
      sed -e '/modules:/ a make -j1 KERNELRELEASE=$(KERNELRELEASE) -C pserial' -i "${_dkms}/Makefile"
      sed -e '/clean:/ a make -j1 -C pserial clean' -i "${_dkms}/Makefile"
    fi
    if [ "${_opt_PARALLEL}" -ne 0 ]; then
      cat >> "${_dkms}/dkms.conf" << EOF

BUILT_MODULE_NAME[${_modno}]="${_modulenames[${_modno}]}"
BUILT_MODULE_LOCATION[${_modno}]="pparport26"
# The install version is .ko.gz. The DKMS version is .ko. No conflicts.
DEST_MODULE_LOCATION[${_modno}]="/kernel/drivers/parport"
EOF
      _modno=$((_modno+1))
      cp -pr 'pparport26/' "${_dkms}/"
      sed -e '/modules:/ a make -j1 KERNELRELEASE=$(KERNELRELEASE) -C pparport26' -i "${_dkms}/Makefile"
      sed -e '/clean:/ a make -j1 -C pparport26 clean' -i "${_dkms}/Makefile"
    fi
    # sed 'a' can't add leading tabs so we add them here. It's also handy because this guarantees tabs not spaces.
    sed -e 's:^make:\t&:g' -i "${_dkms}/Makefile"
    rm "${_dkms}"/*/*.sh "${_dkms}"/*/rc.*
    if [ "${_opt_SERIAL}" -ne 0 ]; then
      make -s -C "${_dkms}/pserial" clean KERNELRELEASE="$(uname -r)"
      rm "${_dkms}/pserial"/{ps_addports,set_io8_rts,swirl.c} "${_dkms}/pserial"/setultrap.* "${_dkms}/pserial"/osultrap.*
    fi
    if [ "${_opt_PARALLEL}" -ne 0 ]; then
      make -s -C "${_dkms}/pparport26" clean KERNELRELEASE="$(uname -r)"
    fi
  fi
  set +u
}

set +u
