# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# TODO: serserial port RS-422/485 setting does not stick after power loss or USB replug
# TODO: mxusbserial causes sysfs group 'power' not found for kobject 'ttyMXUSB7'

# Installing the Moxa version lets you use setserial to change modes to RS-422 or 485

_opt_DKMS=1           # This can be toggled between installs

#export KERNELRELEASE="$(basename $(dirname /usr/lib/modules/6.12.*/modules.alias))"

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
#pkgver='1.2'; _build='12071314'
#pkgver='1.2.9'; _build='14103017'
pkgver='1.2.13'; _build='18030617'
pkgrel='8'
pkgdesc='kernel module driver for Moxa multi port USB serial 1250 1410 1450 1610 1650 RS-232 422 485'
_servicedesc='Moxa UPort persistent settings'
arch=('i686' 'x86_64')
url='https://www.moxa.com/product/UPort_1610-8_1650-8.htm'
#url='https://github.com/uecasm/mxser'
#url='https://pkgs.org/download/moxa-kmp-default'
#url='https://www.moxa.ru/forum/index.php?/topic/25005-drajver-dlia-moxa-uport-1250-dlia-linux-iadro-316/'
license=('GPL')
depends=('glibc')
optdepends=('setserial: set RS-422 485 modes')
makedepends=('gzip' 'findutils' 'sed' 'diffutils' 'patch')
backup=("etc/${_servicename}.sh")
options=('!strip')
install="${pkgname}-install.sh"
_srcdir='mxuport'
source=(
  #"https://www.moxa.com/drivers/UPort/U12_14_1600/Linux2.6/V1.2/driv_linux_uport_v${pkgver}_build_${_build}.tgz"
  #"http://ftp.gwdg.de/pub/opensuse/repositories/hardware/openSUSE_Tumbleweed/src/moxa-${pkgver}_${_build}-1.299.src.rpm"
  "https://download.opensuse.org/repositories/hardware/openSUSE_Leap_42.3/src/moxa-${pkgver}_${_build}-1.1.src.rpm"
  '0003-kernel-5.0.0-dgrp_mon_ops-access_ok.patch'
  '0004-kernel-5.12-tty-low_latency.patch'
  '0005-kernel-5.13-dropped-tty_check_change.patch'
  '0006-kernel-5.14-unsigned-tty.patch'
  '0007-kernel-5.15-bus_type.remove-void.patch'
  '0008-kernel-5.15-alloc_tty_driver-put_tty_driver.patch'
  '0009-kernel-6.1-user_termios_to_kernel_termios-copy_from_user.patch'
  '0010-kernel-6.0-set_termios-const-ktermios.patch'
  '0011-kernel-6.6-struct-tty_operations-size_t.patch'
  '0012-kernel-6.11-struct-bus_type-match-const-struct-device_driver.patch'
)
md5sums=('17a240340a322b3da2e07fc929950288'
         '9f7d6139da105c3f0bb4e341729189be'
         'fcc5c618b5be2989df6e1233180977ff'
         '917f1fb1b1763004869c5343f93e8b5f'
         'fa199dbdbaae4e9601ed957141e21b37'
         'f5bb4993f771d29aac537d6662340899'
         '7a722b72267962800ceeb2421da58b59'
         'a9604e54d37a29590492c92311b18400'
         'a9d2f5eb65ed26436692cfc37e607e66'
         '4d1271d2313ab713a006a2443b8284bd'
         '844bc982767ef623dc119815832324c8')
sha256sums=('aed6f9a1bb6e88a22b520dc6cbbb6624accea080dcaca727c0fab031868228b6'
            'b3c7b8e625ddee04cc00fa022c18ea146a395ad09a1a7c765119c670d1cc59a3'
            'e846b2941f4542609753179601f10e12be7fe4510a1b12630d469be5ec6bdaa9'
            'c8aa824ace1c9e1e4e02948e3de8749d14ce726af3002aef16b6f1d66a12dd6b'
            '71845ce9d114261a102a17f8d42a5fff55d672b0b70c6555f8ced1d201315bf2'
            '5c4239cf2e70a358dd2acb72f4346cca118bb51e9509e3aa2669a844752cb9e9'
            'cdb9aa88ac7f668645e81a81dee9c50678e4455dbf613d15e502e52066537be7'
            'c765e7dfdcd684d29dc5dc7595733addb95eb4264100d73ed1d541cd4329dde7'
            'fc62764f2be15e2906f7f28a80b818643257ea523eacc5aa18a444a1af4e178c'
            '17cc56a95f1a84aa00024da223a8f416a4da3d9b8f68768f460c530719e831c7'
            '8b3548cafce2871458acc2aeabe62201ee1f4faeeb22776c8d2fde673be2495f')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

# Moxa https doesn't work with curl
if [ "${source[*]//moxa.com/}" != "${source[*]}" ]; then
  for _dlagentk in "${!DLAGENTS[@]}"; do
    case "${DLAGENTS[${_dlagentk}]}" in
    'https::/'*) DLAGENTS[${_dlagentk}]="${DLAGENTS[${_dlagentk}]//\/curl -/\/curl -k}";;
    esac
  done
fi

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

# From 1.2 to 1.2.9 all the firmwares were changed which makes the patch too large to be useful
_make_patch() {
  cd "${startdir}"
  rm -rf 'makepatch'
  mkdir 'makepatch'
  cd 'makepatch'
  bsdtar -xf "../$1"
  if [ ! -d 'mxuport' ]; then
    bsdtar -xf "driv_linux_uport_v$2"_build_*.tgz
  fi
  mv 'mxuport'{,"-$2"}
  bsdtar -xf "../$3"
  if [ ! -d 'mxuport' ]; then
    bsdtar -xf "driv_linux_uport_v$4"_build_*.tgz
  fi
  mv 'mxuport'{,"-$4"}
  sed -e 's:\r$::g' -i $(grep -rlFe $'\r')
  diff -w -pNaru5 mxuport-{"$2","$4"} > "../0000-mxuport-$2-$4.patch" || :
  cd ..
  rm -r 'makepatch'
  #patch -Nbup2 < '../0000-mxuport-1.2-1.2.9.patch'
  set +u
  false
}

prepare() {
  set -u
  #_make_patch 'driv_linux_uport_v1.2_build_12071314.tgz' '1.2' 'moxa-1.2.9_14103017-1.5.src.rpm' '1.2.9'
  #_make_patch 'moxa-1.2.9_14103017-1.5.src.rpm' '1.2.9' 'moxa-1.2.13_18030617-1.1.src.rpm' '1.2.13'
  _install_check

  if [ ! -d "${_srcdir}" ]; then
    bsdtar -xf "driv_linux_uport_v${pkgver}_build_${_build}.tgz"
  fi

  cd "${_srcdir}"
  # This doesn't do anything we need
  rm 'driver/mxconf'

  # A few files have MS-DOS line endings
  sed -e 's:\s*\r$::g' -i $(grep -rlFe $'\r')

  local _patches=()
  _patches+=('0003-kernel-5.0.0-dgrp_mon_ops-access_ok.patch')
  _patches+=('0004-kernel-5.12-tty-low_latency.patch')
  _patches+=('0005-kernel-5.13-dropped-tty_check_change.patch')
  _patches+=('0006-kernel-5.14-unsigned-tty.patch')

  # https://www.spinics.net/lists/backports/msg05227.html [PATCH 39/47] patches: Adapt signature of bus_type->remove callback
  # http://lkml.iu.edu/hypermail/linux/kernel/2107.0/03551.html [PATCH] bus: Make remove callback return void
  _patches+=('0007-kernel-5.15-bus_type.remove-void.patch')

  # http://lkml.iu.edu/hypermail/linux/kernel/2107.2/08799.html [PATCH 5/8] tty: drop alloc_tty_driver
  # http://lkml.iu.edu/hypermail/linux/kernel/2107.2/08801.html [PATCH 7/8] tty: drop put_tty_driver
  _patches+=('0008-kernel-5.15-alloc_tty_driver-put_tty_driver.patch')
  _patches+=('0009-kernel-6.1-user_termios_to_kernel_termios-copy_from_user.patch')
  _patches+=('0010-kernel-6.0-set_termios-const-ktermios.patch') # https://lore.kernel.org/linux-arm-kernel/20220816115739.10928-9-ilpo.jarvinen@linux.intel.com/T/
  _patches+=('0011-kernel-6.6-struct-tty_operations-size_t.patch')
  _patches+=('0012-kernel-6.11-struct-bus_type-match-const-struct-device_driver.patch')

  local _pt _ptf=() _pts=()
  for _pt in "${_patches[@]}"; do
    set +u; msg2 "Patch ${_pt}"; set -u
    if patch -Nufp1 -i "${srcdir}/${_pt}"; then
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
  # diff -pNaru5 'a' 'b' > "0000-$RANDOM.patch"

  # Fix umbrella Makefile
  local _sedsumb=(
    -e '# Disable silent'
    -e '/make / s:\s\+-s::g'
    -e '# Improve chdir technique'
    -e 's:^\t@cd .*$:#&-:g'
    -e 's:^\tmake :&-C driver :g'
  )
  sed "${_sedsumb[@]}" -i 'Makefile'
  #cp -p driver/Makefile{,.Arch}
  # Make DKMS compatible
  local _sedsdkms=(
    -e '# Remove pesky blank line. n messes up the positioning so we do it separately'
    -e '/^modules:/ {n; d}'
    -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple'
    -e 's:shell uname -r:KERNELRELEASE:g'
    -e '# DKMS sets KERNELRELEASE which accidentally launches phase 2 of this Makefile'
    -e '# Fix by changing the detection var.'
    -e '# SUBDIRS makes more sense to me because I can see it in the Makefile!'
    -e 's:^ifneq (\$(KERNELRELEASE),):ifneq (\$(SUBDIRS),):g'
    -e '1i KERNELRELEASE?=$(shell uname -r)'
  )
  sed "${_sedsdkms[@]}" -i 'driver/Makefile'
  # Make package compatible
  local _sedspkg=(
    -e '# Fix path'
    -e 's:/lib/:/usr/lib/:g'
    -e '# Get rid of useless vars'
    -e 's:^REL_DATE:# &:g'
    -e 's:^KDISVER:# &:g'
    -e 's:^TARGET:# &:g'
    -e '# Disable Fedora hack'
    -e '/Fedora/,/^$/ s:^.:#&:g'
    -e '# Remove leading @ to prevent silent execution'
    -e 's:^\t@:\t:g'
    -e '# Ungroup envchk from make module'
    -e '/^modules:/ s:\s\+envchk::g'
    -e '# Remove build log helper that hides output'
    -e '/^\t\$(MAKE)/ s:\s\+2>>.\+$::g'
    -e '# Disable all make lines'
    -e '/^modules:/,/^$/ s:^\t:#\t:g'
    -e '# Enable make lines'
    -e '/^modules:/,/^$/ s:^#\(\t\$(MAKE)\):\1:g'
    -e '# Fix install lines'
    -e '# Dont remake modules on install'
    -e '/^install:/ s:\s\+modules::g'
    -e '# Disable all install lines'
    -e '/^install:/,/^$/ s:^\t:#&:g'
    -e '# Enable make lines'
    -e '/^install:/,/^$/ s:^#\tmake:\tmake:g'
    -e '# Make package compatible'
    -e '/^install:/,/^$/ s:/usr/:"$(DESTDIR)"&:g'
    -e '# Disable clean_lib'
    -e '/^clean:/ s:\s\+clean_lib::g'
    -e '# Disable all clean_local lines'
    -e '/^clean_local:/,/^$/ s:^\t:#&:g'
    -e '# Enable make lines'
    -e '/^clean_local:/,/^$/ s:^#\tmake:\tmake:g'
    -e '# Disable silent'
    -e 's:make -s:make:g'
    -e '# Add kernel clean'
    -e 's/^clean_local:.*$/&\n\t$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean/g'
    -e '# Kernel 5.4 compatible'
    -e 's: SUBDIRS=\([^ ]\+\) : M=\1&:g '
  )
  sed "${_sedspkg[@]}" -i 'driver/Makefile'
  test ! -s 'driver/Makefile.Arch'
  #cp -p 'driver/mxusbserial/Makefile'{,.Arch}
  #cp -p 'driver/mxuport/Makefile'{,.Arch}
  local _sedsdrivers=(
    -e '# Fix path'
    -e 's:/lib/:/usr/lib/:g'
    -e '# Get rid of useless vars'
    -e 's:^KDISVER:# &:g'
    -e '# Disable Fedora hack'
    -e '/Fedora/,/^endif/ s:^:#:g'
    -e '# Remove leading @ to prevent silent execution'
    -e 's:^\t@:\t:g'
    -e '# Fix install lines'
    -e '# Dont remake modules on install'
    -e 's@^\(install:\).*$@\1@g'
    -e '# Make package compatible'
    -e '/^install:/,/^$/ s:/usr/:"$(DESTDIR)"&:g'
    -e '# Disable depmod'
    -e 's:^\tdepmod:#&:g'
    -e '# Change to kernel clean'
    -e 's/^clean:/cleanorig:/g'
    -e 's/^cleanorig:/clean:\n\t$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean\n\n&/g'
    -e '# Kernel 5.4 compatible'
    -e 's: SUBDIRS=\([^ ]\+\) : M=\1&:g '
  )
  sed "${_sedsdkms[@]}" "${_sedsdrivers[@]}" -i driver/{mxusbserial,mxuport}/Makefile
  test ! -s 'driver/mxusbserial/Makefile.Arch' -a ! -s 'driver/mxuport/Makefile.Arch'

  local _sedsbug=(
    -e '# This make modules is never used so it contains a bug'
    -e '/^\t\$(MAKE)/ {s: -EXTRA: EXTRA:g; s: C : -C :g}'
  )
  sed "${_sedsbug[@]}" -i 'driver/mxusbserial/Makefile'

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

  local _KERNELRELEASE_PKG="${KERNELRELEASE:-$(uname -r)}"
  if [ "${_opt_DKMS}" -eq 0 ]; then
    # I don't want Linux version info showing on AUR web. After a few months 'linux<0.0.0' makes it look like an out of date package.
    local _kernelversionsmall="${_KERNELRELEASE_PKG}"
    _kernelversionsmall="${_kernelversionsmall%%-*}"
    _kernelversionsmall="${_kernelversionsmall%\.0}" # trim 4.0.0 -> 4.0, 4.1.0 -> 4.1
    # prevent the mksrcinfo bash emulator from getting these vars!
    #eval 'conf''licts=("linux>${_kernelversionsmall}" "linux<${_kernelversionsmall}")'
    eval 'dep''ends+=("linux=${_kernelversionsmall}")'
  fi

  make -C 'driver' -s -j1 install DESTDIR="${pkgdir}"

  local _driverfd='/updates'
  if [ "${_modulenames[1]}" != "${_origmodname}" ]; then
    # Don't install twice
    rm -r "${pkgdir}/usr/lib/modules/${_KERNELRELEASE_PKG}/misc"
    # Blacklist exiting incomplete built in module
    install -Dm644 <(cat << EOF
# Do not load built in module with only barebones support
blacklist ${_origmodname}
EOF
    ) "${pkgdir}/etc/modprobe.d/${pkgname}.conf"
    _driverfd='/kernel/drivers/usb/serial'
  else
    # Don't install twice
    rm -r "${pkgdir}/usr/lib/modules/${_KERNELRELEASE_PKG}/kernel"
    # The new driver is the same name as the built in driver so put it in updates
    mv "${pkgdir}/usr/lib/modules/${_KERNELRELEASE_PKG}"/{misc,updates}
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
    make -s -C "${_dkms}/driver/" clean KERNELRELEASE="${_KERNELRELEASE_PKG}"
  fi
  set +u
}

set +u
