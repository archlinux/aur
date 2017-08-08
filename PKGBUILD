# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# TODO: serserial port RS-422/485 setting does not stick after power loss or USB replug
# TODO: mxusbserial causes sysfs group 'power' not found for kobject 'ttyMXUSB7'

# Installing the Moxa version lets you use setserial to change modes to RS-422 or 485

_opt_DKMS=1           # This can be toggled between installs

# ls -l /dev/ttyMXUSB[0-9]*
# lsmod | grep mx
# setserial -g /dev/ttyMXUSB*

# See /etc/moxa-uport16x0.sh to set port speed and mode to RS-422 or RS-485

#% dmesg | grep -iF $'mxusbserial|moxa|mx'
#1 chris@gq ~/build/moxa-uport16x0 % dmesg | grep -iF $'mxusbserial\nmoxa\nmx'
#[    9.077859] usbcore: registered new interface driver mxusbserial
#[    9.087250] USB Serial support registered for MOXA UPort 1200 series
#[    9.087255] USB Serial support registered for MOXA UPort 1400 series
#[    9.087259] USB Serial support registered for MOXA UPort 1600-8 series
#[    9.087264] USB Serial support registered for MOXA UPort 1600-16 series
#[    9.087275] mxuport 1-1.4:1.0: MOXA UPort 1600-8 series converter detected
#[    9.087501] usb 1-1.4: MOXA UPort 1650-8 detected
#[    9.087622] Moxa: Upgrading firmware
#[   11.713663] usb 1-1.4: MOXA UPort 1600-8 series converter now attached to ttyMXUSB0
#[   11.713717] usb 1-1.4: MOXA UPort 1600-8 series converter now attached to ttyMXUSB1
#[   11.713770] usb 1-1.4: MOXA UPort 1600-8 series converter now attached to ttyMXUSB2
#[   11.713821] usb 1-1.4: MOXA UPort 1600-8 series converter now attached to ttyMXUSB3
#[   11.713870] usb 1-1.4: MOXA UPort 1600-8 series converter now attached to ttyMXUSB4
#[   11.713920] usb 1-1.4: MOXA UPort 1600-8 series converter now attached to ttyMXUSB5
#[   11.713970] usb 1-1.4: MOXA UPort 1600-8 series converter now attached to ttyMXUSB6
#[   11.713996] usb 1-1.4: MOXA UPort 1600-8 series converter now attached to ttyMXUSB7
#[   11.714007] usbcore: registered new interface driver mxuport
#[   11.714008] MOXA UPort series driver v1.2.9

_modulenames=('mxusbserial' 'mxuport') # mxusbserial must be listed first
#_modulenames=('mxusbserial' 'mxuport16x0') # mxusbserial must be listed first
_origmodname=('mxuport')

set -u
pkgname='moxa-uport16x0'
_servicename="${pkgname}-settings"
pkgver='1.2.9'; _build='14103017'
#pkgver='1.2'; _build='12071314'
pkgrel='1'
pkgdesc='kernel module driver for Moxa multi port USB serial 1250 1410 1450 1610 1650 RS-232 422 485'
_servicedesc='Moxa UPort persistent settings'
arch=('i686' 'x86_64')
url='https://www.moxa.com/product/UPort_1610-8_1650-8.htm'
#url='https://github.com/uecasm/mxser'
#url='https://pkgs.org/download/moxa-kmp-default'
#url='https://www.moxa.ru/forum/index.php?/topic/25005-drajver-dlia-moxa-uport-1250-dlia-linux-iadro-316/'
license=('GPL')
depends=('setserial')
makedepends=('gzip' 'findutils' 'sed' 'diffutils' 'patch')
backup=("etc/${_servicename}.sh")
options=('!strip')
install="${pkgname}-install.sh"
_srcdir='mxuport'
source=(
  #"https://www.moxa.com/drivers/UPort/U12_14_1600/Linux2.6/V1.2/driv_linux_uport_v${pkgver}_build_${_build}.tgz"
  "http://ftp.gwdg.de/pub/opensuse/repositories/hardware/openSUSE_Tumbleweed/src/moxa-${pkgver}_${_build}-1.299.src.rpm"
  '0001-kernel-4.9-no-dma-on-stack-transfer-buffer-not-dma-capable.patch'
)
sha256sums=('280ec934e6683b962e037faaa92b890608bc20701c4836954f5586c40d96f796'
            '1243f168ed4876a5d821386b62104ae77ffddf66833cd76f21180f398d8b0608')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

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
  for _ckvar in _pkgname _modulenames _origmodname _servicename; do
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

# All the firmwares were changed which makes the patch too large to be useful
_make_patch() {
  cd "${startdir}"
  rm -rf 'makepatch'
  mkdir 'makepatch'
  cd 'makepatch'
  bsdtar -xf '../driv_linux_uport_v1.2_build_12071314.tgz'
  mv 'mxuport'{,-1.2}
  bsdtar -xf '../driv_linux_uport_v1.2.9_build_14103017.tgz'
  mv 'mxuport'{,-1.2.9}
  sed -e 's:\r$::g' -i $(grep -rlFe $'\r')
  diff -pNaru5 mxuport-{1.2,1.2.9} > '../0000-mxuport-1.2-1.2.9.patch' || :
  cd ..
  rm -r 'makepatch'
  #patch -Nbup2 < '../0000-mxuport-1.2-1.2.9.patch'
  set +u
  false
}

prepare() {
  set -u
  #_make_patch
  _install_check

  bsdtar -xf "driv_linux_uport_v${pkgver}_build_${_build}.tgz"

  cd "${_srcdir}"

  rm 'driver/mxconf'

  sed -e 's:\s*\r$::g' -i $(grep -rlFe $'\r')

  # diff -pNau5 driver/mxuport/mx-uport.c{.orig,} > '0001-kernel-4.9-no-dma-on-stack-transfer-buffer-not-dma-capable.patch'
  patch -Nbup0 < '../0001-kernel-4.9-no-dma-on-stack-transfer-buffer-not-dma-capable.patch'

  # Make package compatible
  # cp -p driver/Makefile{,.Arch}
  sed -e '# Remove pesky blank line. n messes up the positioning so we do it separately' \
      -e '/^modules:/ {n; d}' \
    -i 'driver/Makefile'
  sed -e '# Fix path' \
      -e 's:/lib/:/usr/lib/:g' \
      -e '# Get rid of useless var' \
      -e 's:^REL_DATE:# &:g' \
      -e '# Get rid of useless var' \
      -e 's:^KDISVER:# &:g' \
      -e '# Disable Fedora hack' \
      -e '/Fedora/,/^endif/ s:^:#:g' \
      -e '# Remove leading @ to prevent silent execution' \
      -e 's:^\t@:\t:g' \
      -e '# Disable envchk' \
      -e '/^module/ s:envchk::g' \
      -e '# Remove build log helper that hides output' \
      -e '/^\t\$(MAKE)/ s:\s\+2>>.\+$::g' \
      -e '# Disable all make lines' \
      -e '/^modules:/,/^$/ s:^\t:#\t:g' \
      -e '# Reenable module targets' \
      -e '/^#modules:/ s:^#::g' \
      -e '# Reenable make line' \
      -e '/^#\t\$(MAKE/ s:^#\t:\t:g' \
      -e '# Fix install lines' \
      -e '# Dont remake modules on install' \
      -e '/^install/ s:modules::g' \
      -e '# Make package compatible' \
      -e '/^install/,/^$/ s:/usr/:"$(DESTDIR)"&:g' \
      -e '# Disable depmod' \
      -e 's:^\tdepmod:\ttrue depmod:g' \
    -i 'driver/Makefile'
  sed -e '# Fix path' \
      -e 's:/lib/:/usr/lib/:g' \
      -e '# Get rid of KDIS' \
      -e 's:^KDISVER:# &:g' \
      -e '# Disable Fedora hack' \
      -e '/Fedora/,/^endif/ s:^:#:g' \
      -e '# Remove leading @ to prevent silent execution' \
      -e 's:^\t@:\t:g' \
      -e '# Fix install lines' \
      -e '# Dont remake modules on install' \
      -e 's@^\(install:\).*$@\1@g' \
      -e '# Make package compatible' \
      -e '/^install/,/^$/ s:/usr/:"$(DESTDIR)"&:g' \
      -e '# Disable depmod' \
      -e 's:^\tdepmod:\ttrue depmod:g' \
    -i driver/{mxusbserial,mxuport}/Makefile
  sed -e '# Forgot to clean something' \
      -e 's/^clean:$/&\n\trm -f .mx*.o.d/g' \
      -e '# This make modules is never used so it contains a bug' \
      -e '/^\t\$(MAKE)/ {s: -EXTRA: EXTRA:g; s: C : -C :g}'\
    -i 'driver/mxusbserial/Makefile'

  # Change module name
  if [ "${_modulenames[1]}" != "${_origmodname}" ]; then
    sed -e "s:\"${_origmodname}\":\"${_modulenames[1]}\":g" -i 'driver/mxuport/mx-uport.c'
    sed -e "/^TARGET/ s:${_origmodname}:${_modulenames[1]}:g" -i 'driver/mxuport/Makefile'
  fi
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -C 'driver' -j1 # too small for parallel make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  make -C 'driver' -s -j1 install DESTDIR="${pkgdir}"

  local _driverfd='/updates'
  if [ "${_modulenames[1]}" != "${_origmodname}" ]; then
    # Don't install twice
    rm -r "${pkgdir}/usr/lib/modules/$(uname -r)/misc"
    # Blacklist exiting incomplete built in module
    install -Dm644 <(cat << EOF
# Do not load built in module with only barebones support
blacklist ${_origmodname}
EOF
    ) "${pkgdir}/etc/modprobe.d/${pkgname}.conf"
    _driverfd='/kernel/drivers/usb/serial'
  else
    # Don't install twice
    rm -r "${pkgdir}/usr/lib/modules/$(uname -r)/kernel"
    # The new driver is the same name as the built in driver so put it in updates
    mv "${pkgdir}/usr/lib/modules/$(uname -r)"/{misc,updates}
  fi

  # Install persistent settings service
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=${_servicedesc}
#After=sysinit.target
After=local-fs.target

[Service]
Type=notify
ExecStart=/usr/bin/bash -c 'source /etc/${_servicename}.sh; systemd-notify --ready'
RemainAfterExit=yes

[Install]
WantedBy=network.target
EOF
  ) "${pkgdir}/usr/lib/systemd/system/${_servicename}.service"

  install -Dm644 <(cat << EOF
# From readme.txt

#4. Setserial

#   Supported Setserial parameters are listed as below.

#   port        use for change port interface
#               0x3 RS-485 4W
#               0x2 RS-422
#               0x1 RS-485 2W
#               0x0 RS-232

#   spd_hi      Use 57.6kb  when the application requests 38.4kb.
#   spd_vhi     Use 115.2kb when the application requests 38.4kb.
#   spd_shi     Use 230kb   when the application requests 38.4kb.
#   spd_warp    Use 460kb   when the application requests 38.4kb.
#   spd_normal  Use 38.4kb  when the application requests 38.4kb.

#   [Example]

#    i) The following command sets interface of "/dev/ttyMXUSB0" to RS-422.

#       # setserial /dev/ttyMXUSB0 port 0x2

#    ii) Lookup the serial settings of current port.

#       # setserial -g /dev/ttyMXUSB0
EOF
  ) "${pkgdir}/etc/${_servicename}.sh"

  # The module is in the same folder as DKMS. Compress to a different name to prevent conflict.
  # When future versions of DKMS compress we'll stop doing this.
  find "${pkgdir}/usr/lib/modules/" -type 'f' -name '*.ko' -exec 'gzip' '-9' '{}' ';'

  if [ "${_opt_DKMS}" -ne 0 ]; then
    rm -r "${pkgdir}/usr/lib/modules/"
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
BUILT_MODULE_LOCATION[0]="driver/${_modulenames[0]}"
# The install version is .ko.gz. The DKMS version is .ko. No conflicts.
DEST_MODULE_LOCATION[0]="${_driverfd}"

BUILT_MODULE_NAME[1]="${_modulenames[1]}"
BUILT_MODULE_LOCATION[1]="driver/${_origmodname}"
# The install version is .ko.gz. The DKMS version is .ko. No conflicts.
DEST_MODULE_LOCATION[1]="${_driverfd}"
EOF
    ) "${_dkms}/dkms.conf"
    cp -pr 'driver/' "${_dkms}/"
    sed -e 's:shell uname -r:KERNELRELEASE:g' \
        -e '# DKMS sets KERNELRELEASE which accidentally launches phase 2 of this Makefile' \
        -e '# Fix by changing the detection var.' \
        -e '# SUBDIRS makes more sense to me because I can see it in the Makefile!' \
        -e 's:^ifneq (\$(KERNELRELEASE),):ifneq (\$(SUBDIRS),):g' \
      -i "${_dkms}/driver/Makefile"
    make -s -C "${_dkms}/driver/" clean_local KERNELRELEASE="$(uname -r)"
  fi
  set +u
}

set +u
