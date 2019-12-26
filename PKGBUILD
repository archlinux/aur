# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# TODO: Test msdiag for Smartio/Industio card. Can't test until mxser works.
# TODO: Test mxser with supported PCI card
# TODO: Get remaining tools mon and term that use mxlib.a and wlib.a to compile. Nothing in the headers look secret so Moxa should release the source code.
# TODO: mxupcie does not report itself for lspci -k Kernel driver in use:

# TODO: Test CP-114EL on Syba cable

_opt_DKMS=1           # This can be toggled between installs
_opt_MXSER=0          # Old PCI and ISA cards, with C168H IRQ error then crashed on unload

# mxser
# C104 C168
# CB108 CB114 CB134I
# CP102 CP102U CP102UF CP102UL CP104EL CP104JU CP104U CP112UL CP114 CP114UL CP118EL CP118U CP132 CP132U CP134U CP138U CP168EL CP168U
# CT114
# POS104UL
# RC7000

# mxupcie
# CP-102E
# CP-102EL
# CP-104EL
# CP-114EL
# CP-116EA (A)
# CP-116EA (B)
# CP-118E-A-I
# CP-118EL
# CP-132EL
# CP-134EL-A
# CP-138E-A
# CP-168EL

set -u

_modulenames=('mxupcie')
if [ "${_opt_MXSER}" -ne 0 ]; then
  _modulenames+=('mxser')
fi
_origmodname='8250_moxa'

pkgname='moxa-mxser-mxupcie'
pkgver='1.16'; _build='14030317'
pkgrel='3'
pkgdesc='kernel module driver for Moxa Smartio Industio MUE ISA PCIe UPCI PCI Express CP multi port serial RS-232 422 485'
arch=('i686' 'x86_64')
url='https://www.moxa.com/product/PCIe_UPCI_PCI.htm'
#url='https://github.com/uecasm/mxser'
license=('GPL')
makedepends=('findutils' 'sed' 'diffutils' 'patch')
backup=("etc/modprobe.d/${_modulenames[0]}.conf" 'etc/moxa-mxser-settings.sh')
options=('!strip')
install="${pkgname}-install.sh"
_srcdir='mxser'
source=(
  "https://www.moxa.com/drivers/MSB/SmartioIndustio/driv_linux_smart_v${pkgver}_build_${_build}.tgz"
  '0000-mxser-utilities-warnings.patch'
  '0001-mxser-kernel-4.12-IRQF_DISABLED.patch'
  '0003-kernel-5.0.0-access_ok.patch'
)
sha256sums=('445f452eb7f56b70ef1b9795421556fb28284a90cde8746e5895316d5c67899f'
            '4988d6cc1c779c1e30f659896e9e25beaedb4a473d4f2f09a81bbef5d2ccb276'
            '7357da2ada66681705b2c6806fa3fe910ddd198e531d851bd0a97b548de4bbb3'
            'ba1a55fa48f93f3a309bec5783d7deb5f728798ae39f28301d19384b5444113e')

# Moxa https doesn't work with curl
for _dlagentk in "${!DLAGENTS[@]}"; do
  case "${DLAGENTS[${_dlagentk}]}" in
  'https::/'*) DLAGENTS[${_dlagentk}]="${DLAGENTS[${_dlagentk}]//\/curl -/\/curl -k}";;
  esac
done

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
  set -u
  _install_check
  cd "${_srcdir}"
  # diff -pNaru5 src{.old,} > '0001-mxser-kernel-4.12-IRQF_DISABLED.patch'
  patch -Nup2 -i '../0001-mxser-kernel-4.12-IRQF_DISABLED.patch'

  # diff -pNaru5 'src.old/mxser' 'src/mxser' > '0000-mxser-utilities-warnings.patch'
  patch -Nup2 -i '../0000-mxser-utilities-warnings.patch'

  #cp -pr driver{,.orig}; false
  #diff -pNaru5 driver{.orig,} > '0003-kernel-5.0.0-access_ok.patch'
  patch -Nbup0 -i "${srcdir}/0003-kernel-5.0.0-access_ok.patch"

  # Make package compatible
  # cp -p driver/Makefile{,.Arch}
  sed -e '# Fix path' \
      -e 's:/lib/:/usr/lib/:g' \
      -e '# Remove leading @ to prevent silent execution' \
      -e 's:^\t@:\t:g' \
      -e '# Disable envchk' \
      -e '/^module/ s:envchk::g' \
      -e '# Remove build log helper that hides output' \
      -e '/^\t\$(MAKE)/ s:\s\+2>>.\+$::g' \
      -e '# Disable all make lines' \
      -e '/^module2*:/,/^$/ s:^\t:#\t:g' \
      -e '# Reenable module targets' \
      -e '/^#module2*:/ s:^#::g' \
      -e '# Reenable make line' \
      -e '/^#\t\$(MAKE/ s:^#\t:\t:g' \
      -e '# Fix install lines' \
      -e '# Dont remake modules on install' \
      -e '/^install/ s:module2*::g' \
      -e '# Make package compatible' \
      -e '/^install/,/^$/ s:/usr/:"$(DESTDIR)"&:g' \
      -e '# Disable depmod' \
      -e 's:^\tdepmod:\ttrue depmod:g' \
      -e '# Kernel 5.4 compatible' \
      -e 's: SUBDIRS=\([^ ]\+\) : M=\1&:g ' \
    -i 'driver/Makefile'
  test ! -s driver/Makefile.Arch
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -C 'utility/conf' -s -j1 # too small for parallel make
  if [ "${_opt_MXSER}" -ne 0 ]; then
    make -C 'utility/diag' -s -j1 # too small for parallel make
  fi
  make -C 'driver' -s -j1 module # too small for parallel make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  install -Dpm755 'utility/conf/muestty' "${pkgdir}/usr/bin/moxa-muestty"
  if [ "${_opt_MXSER}" -ne 0 ]; then
    install -Dpm755 'utility/diag/msdiag' "${pkgdir}/usr/bin/moxa-msdiag"
  fi
  make -C 'driver' -s -j1 install DESTDIR="${pkgdir}"

  # Don't install twice
  rm -r "${pkgdir}/usr/lib/modules/$(uname -r)/misc"

  # Install persistent settings service
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=Moxa mxser serial port persistent settings
After=network.target

[Service]
Type=notify
ExecStart=/usr/bin/bash -c 'source /etc/${pkgname}.sh; systemd-notify --ready'
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
  ) "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  install -Dm644 <(cat << EOF
# From driver/rx.mxser

# Use moxa-muestty to set RS-422 and RS-485 settings per port at every boot.
# Some settings can be set for all ports in /etc/modprobe.d/${pkgname}.conf
#
# moxa-muestty -t xxx /dev/ttyMUE0
# moxa-muestty -p xxx /dev/ttyMUE0
EOF
  ) "${pkgdir}/etc/${pkgname}.sh"

  # Blacklist exiting incomplete built in module
  install -Dm644 <(cat << EOF
# From driver/rx.mxser

# When using ISA board, please add parameter to options
# options mxser ioaddr=x,x,x,x
#
# ex : I/O address=0x180 & 0x280
# options mxser ioaddr=0x180,0x280
#
# You can add other parameters as well
#
# ex : interface=0x01
# options mxupcie interface=0x01

# From readme.txt
#          The MUE series multiport board provides two options to set
#          the interface and terminator resistor while loading the driver.
#          The two options are available while working in RS-422 and
#          RS-485 mode. Option's value is applied to all ports on the
#          devices.

#          options mxupcie interface=2 terminator=1
#                                    |            |
#                                    |            +- 120 ohm
#                                    +-------------- RS-422

#          The interface and terminator have values to set as follows.

#          Option        Value   Comment

#          interface      1      RS-232
#                         2      RS-422
#                         4      RS-485 2 wire
#                         8      RS-485 4 wire

#          terminator     0        0 ohm
#                         1      120 ohm

# Do not load built in module with only barebones support
blacklist ${_origmodname}
EOF
  ) "${pkgdir}/etc/modprobe.d/${pkgname}.conf"

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
MAKE[0]="make -C driver -j1"

BUILT_MODULE_NAME[0]="${_modulenames[0]}"
BUILT_MODULE_LOCATION[0]="driver"
# The install version is .ko.gz. The DKMS version is .ko. No conflicts.
DEST_MODULE_LOCATION[0]="/kernel/drivers/char"
EOF
    ) "${_dkms}/dkms.conf"
    if [ "${_opt_MXSER}" -ne 0 ]; then
      cat >> "${_dkms}/dkms.conf" << EOF

BUILT_MODULE_NAME[1]="${_modulenames[1]}"
BUILT_MODULE_LOCATION[1]="driver"
# The install version is .ko.gz. The DKMS version is .ko. No conflicts.
DEST_MODULE_LOCATION[1]="/kernel/drivers/char"
EOF
    fi
    cp -pr 'driver/' "${_dkms}/"
    rm "${_dkms}/driver"/{msmknod,mxconf,rc.mxser}
    sed -e '/^KERNEL_/ s:shell uname -r:shell echo "$(KERNELRELEASE)":g' \
        -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple' \
        -e 's:shell uname -r:KERNELRELEASE:g' \
        -e '# DKMS sets KERNELRELEASE which accidentally launches phase 2 of this Makefile' \
        -e '# Fix by changing the detection var.' \
        -e '# SUBDIRS makes more sense to me because I can see it in the Makefile!' \
        -e 's:^ifneq (\$(KERNELRELEASE),):ifneq (\$(SUBDIRS),):g' \
        -e '# Disable stuff only used for make install' \
        -e '/^base =/,/^$/ d' \
        -e '# Disable non kernel utilities' \
        -e 's:^UTILS:# &:g' \
      -i "${_dkms}/driver/Makefile"
    if [ "${_opt_MXSER}" -eq 0 ]; then
      sed -e '/obj/ s:$(TARGET_DRIVER1).o::g' -i "${_dkms}/driver/Makefile"
      rm "${_dkms}/driver"/mxser.*
    fi
    make -s -C "${_dkms}/driver/" clean KERNELRELEASE="$(uname -r)"
  fi
  set +u
}

set +u
