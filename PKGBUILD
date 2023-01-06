# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

_opt_DKMS=1           # This can be toggled between installs
_opt_MAXINSTPORTS=16  # Maximum install ports.
                      # Default=256 which is plenty for normal size installations.
                      # It's best to use a small number. Nodes are created for
                      # /dev/ttyADV{0..n-1}
#_opt_defaultmode='666' # default: 666

# Products, Intelligent Connectivity, Industrial Communication, Serial Device Servers

# Todo: misspellings all over
# Todo: what does vcinot do?
# Todo: What does vcomd SERVICE do?
# Todo: The daemon shouldn't require kill -9
# Todo: The port opens without error when the unit cannot be connected to, possibly due to wrong configuration.
# Todo: vcom does not announce itself in dmesg
# Todo: advadd does not check for duplicate adds
# Todo: /dev/ttyADV should be created as needed, not all at once
# Todo: implement automatically assigned major number

# Enable at boot
#   systemctl enable --now 'advtty-vcom.service'
#   systemctl status 'advtty-vcom.service'

# Add a 1 port Adam-4571L-CE
# See README.txt for table of device codes.
#   advadd -t 'B571' -a '192.168.50.222' -p 1 -m 6
#   advman -o restart
# or
#   systemctl restart 'advtty-vcom.service'

# Show the config
#   advls

# Show the tty. The number in the first column of advls is the ttyADV#
# ls /dev/ttyADV*

# Show the running module
#   lsmod | grep 'advvcom'

# Show the running driver
#  ps -ef | grep vcomd

# remove port
#   advrm -a '192.168.50.222'
#   advman -o restart

# More help
#   less -S '/usr/share/advtty/readme.txt'

# Uninstall cleanup: sudo rm -f /etc/advttyd.conf* /var/log/advttyd.log

_opt_RAR=0

set -u
# Earlier versions of Advantech TTY were called ICOM
# http://advdownload.advantech.com/productfile/Downloadfile1/1-NZ17GY/ICOM_LINUX_PSEUDO_TTY_DRIVER_V1.4.1.ZIP
pkgname='advantech-vcom'
#pkgver='2.0.0'; _dl='4/1-X92NP4'
#pkgver='2.1.0'; _dl='4/1-15OSOW4'
#pkgver='2.2.0'; _dl='4/1-1LPJPGD'
#pkgver='2.2.1'; _dl='5/1-1NOKMCV'; _opt_RAR=1 # not compatible with Linux 3.16, a RAR file
#pkgver='2.2.3'; _dl='5/1-1Y9Q0Z6' # bugs from new SSL code
#pkgver='2.2.5'; _dl='4/1-23X5L51' # bugs and hangs
pkgver='2.3.0'; _dl='3/1-250ZNM3' # non functional
pkgrel='1'
pkgdesc='tty driver for Advantech Adam EKI serial console terminal servers'
_pkgdescshort="Advantech ${pkgname} TTY driver"
arch=('i686' 'x86_64')
url='http://www.advantech.com/intelligent-connectivity/' # Serial Device Servers
license=('GPL')
depends=('glibc' 'gawk' 'psmisc' 'sed' 'grep')
backup=('etc/advttyd.conf')
install="${pkgname}-install.sh"
_srcdir="VCOM_LINUX_${pkgver}.TAR.BZ2"
_srcdir="${_srcdir,,}"
source=("${_srcdir}::https://advdownload.advantech.com/productfile/Downloadfile${_dl}/${_srcdir}")
if [ "${_opt_RAR}" -ne 0 ]; then
  _srcrar="${_srcdir//.tar.bz2/.rar}"
  noextract=("${_srcrar}") # the RAR crashes bsdtar. Parsing filters is unsupported.
  makedepends+=('unrar')
  source[0]="${_srcrar}::${source[0]##*::}"
fi
#source=("${_srcdir,,}::http://downloadt.advantech.com/download/downloadsr.aspx?File_Id=${_dl}") # redirect works sooner but can be changed arbitrairly
_srcdir="${_srcdir%\.tar*}"
#source=("http://advdownload.advantech.com/productfile/Downloadfile4/${_dl}/${_srcdir}.rar")
source+=(
  '0000-advman.systemd.patch'
  '0000a-advman.systemd.patch'
  '0000b-advman.systemd.patch'
  '0000c-advman.systemd.patch'
  '0001-adv_main-access_ok_kernel-5-0.patch'
  '0002-adv_mmap-vm_fault_t-5-1.patch'
  '0003-gcc-10-duplicate-variables-vc_mon-stk_mon.patch'
  '0003a-gcc-10-duplicate-variables-vc_mon-stk_mon.patch'
  '0004-adv_main-proc_create_data-kernel-5.6.patch'
  '0005-kernel-5.17-change-PDE_DATA.patch'
  '0006-kernel-6.0-set_termios-const-ktermios.patch'
)
md5sums=('a3f195545fa67310e754e682bf2414de'
         '65bb3f58bf90650cd629b94057c80da5'
         'e8e05eebaa36ccf7bfe456ab59b75386'
         'cf730b084619fac9c20106e8e6359ccc'
         '8e10c250ba777d270285e0bf79d44a1d'
         '6b07ea60f898b5586ad8f23a28c32ab7'
         'b30212f45f0dcebc9b88b17e4355d298'
         '0aa930803ed243f4e45f0d31bde581c8'
         '2cf8ab9c5541c38eba5fb9687142d94d'
         '446602b4feef554ade9a137303883432'
         '32f3a081b5926d6ea7f1cd2a22655d95'
         'b005fdd5de28f835b7b37ecd74453785')
sha256sums=('47d49391ad6863face08ec3129b65fa10e53c9849c10a45a7f0abb394f7ddafc'
            '02f504a23fbef07f666aaa595faba0513d9ffec5e99ebca7b7fe2299a0179e32'
            '17fa883aeaea5821e00ead10777f54f4ad6b96f3a2f07097e3d9a77755f21c10'
            '85785f80c7be4452e5b620b5d405646f0e9bacdbec2aecea68a059b6245519aa'
            '1959411a50b800def13849672196295db3acb4aabd1db9fbc5cc52ebf390993c'
            '9335cfe8addfdf80224d21529fe0a70a6b750fa0823cfe806f5c94ae50a06cad'
            '77edc7a806085fc738fa4536e91fce98fb8e103f8207ec0d395f340107e83d0c'
            '61c4b0c92488cce93e6b9ffca4f13eb7aa7fd8b267eb1438094ce41d96aaef53'
            'de3477551219d9fc5b1924775a4456155ef5beb5bd702fbc114ca0c956607953'
            'aa71ede3478a5b482cd085ed2406a1ccd6be3b3ef76ab1fc0b45f4133d3c5a59'
            'b65adbcbb83a21cf0a1c17b9bc2a039ad5c633021ecd90d88d5d978a03a59c23'
            '99b7b7a2c84d8b82a3e79b2a7abe99d1696a7ff3df350560d96ce7f049e8cb27')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

prepare() {
  set -u
  if [ "${_opt_RAR}" -ne 0 ]; then
    unrar x "${_srcrar}"
  fi
  if :; then
    rm -r "${_srcdir}/driver"
    mv 'vcom_linux_2.2.5/driver' "${_srcdir}"
  fi

  cd "${_srcdir}"

  if [ "$(vercmp "${pkgver}" "2.2.1")" -le 0 ]; then
    #cp -p driver/adv_main.c{,.orig}; false
    #diff -pNau5 driver/adv_main.c{.orig,} > '../0001-adv_main-access_ok_kernel-5-0.patch'
    patch -Nup0 -i "${srcdir}/0001-adv_main-access_ok_kernel-5-0.patch"

    #cp -p driver/adv_mmap.c{,.orig}; false
    #diff -pNau5 driver/adv_mmap.c{.orig,} > '../0002-adv_mmap-vm_fault_t-5-1.patch'
    patch -Nup0 -i "${srcdir}/0002-adv_mmap-vm_fault_t-5-1.patch"

  fi
  if [ "$(vercmp "${pkgver}" "2.2.5")" -le 0 ]; then
    #cp -pr daemon{,.orig}; false
    #diff -pNarZu5 daemon{.orig,} > '../0003-gcc-10-duplicate-variables-vc_mon-stk_mon.patch'
    patch -Nup0 -i "${srcdir}/0003-gcc-10-duplicate-variables-vc_mon-stk_mon.patch"
  else
    #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
    #diff -pNarZu5 'a' 'b' > '0003a-gcc-10-duplicate-variables-vc_mon-stk_mon.patch'
    patch -Nup1 -i "${srcdir}/0003a-gcc-10-duplicate-variables-vc_mon-stk_mon.patch"
  fi
  if [ "$(vercmp "${pkgver}" "2.2.3")" -le 0 ]; then
    #cp -p driver/adv_main.c{,.orig}; false
    #diff -pNau5 driver/adv_main.c{.orig,} > '../0004-adv_main-proc_create_data-kernel-5.6.patch'
    patch -Nup0 -i "${srcdir}/0004-adv_main-proc_create_data-kernel-5.6.patch"
  fi

  if :; then
    #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
    #diff -pNarZu5 'a' 'b' > '0005-kernel-5.17-change-PDE_DATA.patch'
    patch -Nup1 -i "${srcdir}/0005-kernel-5.17-change-PDE_DATA.patch"

    #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
    #diff -pNarZu2 'a' 'b' > '0006-kernel-6.0-set_termios-const-ktermios.patch'
    patch -Nup1 -i "${srcdir}/0006-kernel-6.0-set_termios-const-ktermios.patch"
  fi

  # Cosmetic correction of CRLF for Linux
  sed -e 's:\r$::g' -i 'readme.txt'

  # Fix umbrella Makefile
  #cp -p Makefile{,.Arch}
  sed -e '# Cosmetic correction of spaces' \
      -e 's:\s\+$::g' \
      -e '# Make package compatible' \
      -e '/ln -s/ ! s:$(INSTALL_PATH):$(DESTDIR)/&:g' \
      -e '# fix paths and more for package' \
      -e 's: /sbin/: $(DESTDIR)/usr/bin/:g' \
      -e '# Dont want the Makefile. Probably there for uninstall' \
      -e 's:^\s\+cp ./Makefile:#&:g' \
      -e '# Move config to /etc' \
      -e '/advttyd.conf/ s:\$(INSTALL_PATH):etc/:g' \
    -i 'Makefile'
  test ! -s 'Makefile.Arch' || echo "${}"

  # Fix driver Makefile
  sed -e '# Cosmetic correction of spaces' \
      -e 's:\s\+$::g' \
      -e '# Clean missed some files' \
      -e 's:^\s\+rm -.*$:& *.order *.symvers:g' \
      -e '# Adding the current dir (.) to the include path seems unnecessary' \
      -e 's:^ccflags-y += -I:#&:g' \
    -i 'driver/Makefile'

  local _lines='
set -u
if [ "${EUID}" -ne 0 ]; then
  echo "Must be root"
  exit 1
fi
'
  # Fix the scripts
  sed -e '#Get rid of some UTF-8 quotes, even though they seem to work' \
      -e "s:\xE2\x80\x9C:':g" \
      -e "s:\xE2\x80\x9D:':g" \
      -e '#Get rid of repeat hash bang' \
      -e '2,$ s:#!/bin.*$::g' \
      -e '# Catch misspellings that are code errors and root trap' \
      -e "1 a\\${_lines//$'\n'/\\\n}" -e '# 2 i also works' \
      -e '# misspelled variable, caught with set -u' \
      -e 's:INSTALLPTATH:INSTALLPATH:g' \
      -e '#Fix /usr/local' \
      -e 's:/usr/local/:/usr/share/:g' \
      -e '#Move config to /etc' \
      -e 's:$INSTALLPATH/advttyd.conf:/etc/advttyd.conf:g' \
      -e '#Move sort tmp to secure location in /tmp' \
      -e '/advttyd.tmp/ s:$INSTALLPATH/:/tmp/advmon/:g' \
      -e '#Create secure tmp folder.' \
      -e '/^cleanUp()/,/^}/ s:^sed :install -dm700 -oroot -groot "/tmp/advmon/"\nrm -f "/tmp/advmon/advttyd.tmp"\n&:g' \
      -e '#Clean up code' \
      -e 's:^HASARG=$:&0:g' \
    -i script/*
  sed -e '#Allow non root to run advls' \
      -e '/if \[ "\${EUID}"/,/^fi/ d' \
      -e 's:^cleanUp\s*$:if [ "${EUID}" -eq 0 ]; then\n  &\nfi:g' \
      -e '# Prevent samples from showing' \
      -e 's:^PATERN="$MINOR:PATERN="^$MINOR:g' \
    -i 'script/advls'

  # Fix start/stop
  sed -e '# Permanently disable a kernel well never see' \
      -e 's:\[ \$KERNEL = "2\.4" ]:false # &:g' \
      -e '# No need to detect kernel version' \
      -e 's:^KERNEL=:#&:g' \
      -e '# The internet says modprobe is better' \
      -e 's:insmod\s:modprobe :g' \
      -e '# The module is installed by the PKGBUILD so this is unnecessary' \
      -e 's:^DKMSFILE=:#&:g' \
      -e 's:\[ -e \$DKMSFILE \]:false # &:g' \
      -e '# Non zero exit code wont work for systemd' \
      -e '/^case $OBJECTIVE/,/^esac/ s:^\(\s\+\)exit 1:\1# systemd-notify --ready\n\1exit 0:g' \
      -e '# Modprobe just wants the name' \
      -e 's:^\(DRIVERFILE\)=.*\.ko$:\1=$DRIVER:g' \
      -e '# Secure our temp folder' \
      -e '\:/tmp/advmon: s:777:700 -oroot -groot:g' \
    -i 'script/advman'

  # Fix daemon
  sed -e '#Move config to /etc' \
      -e '/CF_CONFNAME/ s:work_path:"/etc":g' \
      -e '#Move log to /var' \
      -e '/CF_LOGNAME/ s:work_path:"/var/log":g' \
    -i 'initd/advttyd.c'

  # Cosmetic correction of spaces
  sed -e 's:\s\+$::g' -i 'readme.txt' script/* initd/adv* driver/adv* daemon/* inotify/* || :

  # Add device table to config
  sed -n -e '/Device-Type Table/,/install/ p' 'readme.txt' | \
    expand | head --lines=-1 | tail --lines=+2 | \
    sed -e 's:^:#:' -e 's:\(Device Name\) : \1:' >> 'config/advttyd.conf'

  # Convert the live config entries to samples. This eliminates
  # special handling for detecting a blank configuration.
  sed -e 's:^[0-9]:# Sample  &:g' \
      -e '/Minor/ s:^#:&00:g' \
    'config/advttyd.conf' > 'config/advttyd.conf.Arch'
  cat <(tail +4 'config/advttyd.conf.Arch') <(head -3 'config/advttyd.conf.Arch') > 'config/advttyd.conf'
  rm 'config/advttyd.conf.Arch'

  # Make a less noisy start/stop to not clog up the systemd logs
  sed -e 's@^\(\s*\)echo@\1: # echo@g' 'script/advman' > 'script/advman.quiet'

  if [ "$(vercmp "${pkgver}" "2.2.1")" -le 0 ]; then
    # Change original advman to systemd
    #cp -p script/advman{,.orig}; false
    #diff -pNau10 script/advman{.orig,} > '../0000-advman.systemd.patch'
    patch -Nup0 -i "${srcdir}/0000-advman.systemd.patch"
  elif [ "$(vercmp "${pkgver}" "2.2.3")" -le 0 ]; then
    #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
    #diff -pNaru10 'a' 'b' > '0000a-advman.systemd.patch'
    patch -Nup1 -i "${srcdir}/0000a-advman.systemd.patch"
  elif [ "$(vercmp "${pkgver}" "2.2.5")" -le 0 ]; then
    #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
    #diff -pNaru10 'a' 'b' > '0000b-advman.systemd.patch'
    patch -Nup1 -i "${srcdir}/0000b-advman.systemd.patch"
  elif [ "$(vercmp "${pkgver}" "2.3.0")" -le 0 ]; then
    #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
    #diff -pNaru10 'a' 'b' > '0000c-advman.systemd.patch'
    patch -Nup1 -i "${srcdir}/0000c-advman.systemd.patch"
  fi

  # Tame the port count
  sed -e 's:^\(#define VCOM_PORTS\)\s.*$:'"\1 ${_opt_MAXINSTPORTS}:g" -i 'driver/advconf.h'

  # Get rid of dmesg spam that looks like crashes but aren't.
  sed -e 's:dump_stack():// &:g' -i 'driver/adv_uart.c'

  # The compiled files should not have been included
  'ma'ke -s -j1 clean # keep git-aurcheck quiet

  find -type 'f' -name '*.orig' -delete

  if [ "${pkgver}" = '2.2.3' ] || [ "${pkgver}" = '2.2.5' ]; then
    sed -e 's:-Werror::g' -i $(grep --include='Makefile' -rle '-Werror' .)
  fi
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -j1
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
    #eval 'conf''licts=("linux>${_kernelversionsmall}" "linux<${_kernelversionsmall}")'
    eval 'dep''ends+=("linux=${_kernelversionsmall}")'
  fi

  # This install expects the system folders to exist
  install -d "${pkgdir}"{'/usr/bin','/etc','/var/log'}

  make -s -j1 DESTDIR="${pkgdir}" INSTALL_PATH="/usr/share/advtty/" install_daemon

  # Most utils are fixed to terminate on non root.
  find "${pkgdir}/usr/share/advtty/" -type 'f' -perm /111 -exec chmod 755 '{}' '+'
  # Root only permissions that don't block non root
  chmod 744 "${pkgdir}/usr/share/advtty/advttyd"

  # The makefile installed the module into the wrong place so we disabled it
  install -Dpm644 'driver/advvcom.ko' -t "${pkgdir}/usr/lib/modules/$(uname -r)/extra/char/"

  install -Dpm755 'script/advman.quiet' -t "${pkgdir}/usr/share/advtty/"
  install -Dpm644 'readme.txt' -t "${pkgdir}/usr/share/advtty/"

  # systemd service
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=${_pkgdescshort}
After=network.target

[Service]
#Type=notify
Type=forking
ExecStart=/usr/share/advtty/advman.quiet -o start
ExecStop=/usr/share/advtty/advman.quiet -o remove
ExecReload=/usr/share/advtty/advman.quiet -o restart
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
  ) "${pkgdir}/usr/lib/systemd/system/advtty-vcom.service"

  if [ "${_opt_DKMS}" -ne 0 ]; then
    rm -r "${pkgdir}/usr/lib/modules/"
    local _dkms="${pkgdir}/usr/src/${pkgname}-${pkgver}"
    # It's easier to make my own config than fix theirs
    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

PACKAGE_NAME="${pkgname}"
PACKAGE_VERSION="${pkgver}"
AUTOINSTALL="yes"

BUILT_MODULE_NAME[0]="advvcom"
BUILT_MODULE_LOCATION[0]="driver"
# Using all processors doesn't compile this tiny module any faster.
# make modules doesn't work
MAKE[0]="make -C 'driver' -j1 DEBUG=0"
CLEAN[0]="make -C 'driver' -j1 clean"
# Placing the DKMS generated module in a different location than the standard install prevents conflicts when PKGBUILD _opt_DKMS is toggled
DEST_MODULE_LOCATION[0]="/kernel/drivers/misc"
EOF
    ) "${_dkms}/dkms.conf"

    install -d "${_dkms}/driver/"
    cp -pr driver/* "${_dkms}/driver/"
    make -C "${_dkms}/driver/" clean
    rm "${_dkms}/driver/dkms.conf"
    sed -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple' \
        -e 's:$(shell uname -r):$(KERNELRELEASE):g' \
        -e 's:`uname -r`:$(KERNELRELEASE):g' \
        -e '# DKMS sets KERNELRELEASE which accidentally launches phase 2 of this Makefile' \
        -e '# Fix by changing the detection var.' \
        -e 's:^ifneq ($(KERNELRELEASE),):ifneq ($(ARCHLINUX),):g' \
        -e '# Put the detection var in' \
        -e 's:^\s\+\$(MAKE)\s-C\s\$(KERNELDIR):& ARCHLINUX=1:g' \
       -i "${_dkms}/driver/Makefile"
  fi
  set +u
}

set +u
