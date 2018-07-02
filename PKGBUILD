# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

# The VM patch is not expected to work but it's working so far.

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

set -u
# Earlier versions of Advantech TTY were called ICOM
# http://advdownload.advantech.com/productfile/Downloadfile1/1-NZ17GY/ICOM_LINUX_PSEUDO_TTY_DRIVER_V1.4.1.ZIP
pkgname='advtty-vcom'
#pkgver='2.1.0'; _dl='1-15OSOW4'
pkgver='2.2.0'; _dl='1-1LPJPGD'
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
source=("${_srcdir,,}::http://downloadt.advantech.com/download/downloadsr.aspx?File_Id=${_dl}")
_srcdir="${_srcdir%\.tar*}"
source+=('advman.systemd.patch')
sha256sums=('e06520654165888f1ef1f9409074482830e839d7fd55c09aba6a9a8a9ea9a9c8'
            '02f504a23fbef07f666aaa595faba0513d9ffec5e99ebca7b7fe2299a0179e32')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

prepare() {
  set -u
  cd "${_srcdir}"

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
  sed -e 's:\s\+$::g' -i 'readme.txt' script/* inotify/* initd/adv* driver/adv* daemon/*

  # Add device table to config
  sed -n -e '/Device-Type Table/,/install/ p' 'readme.txt' | \
    expand | head --lines=-1 | tail --lines=+2 | \
    sed -e 's:^:#:' -e 's:\(Device Name\) : \1:' >> 'config/advttyd.conf'

  # Convert the live config entries to samples. This eliminates
  # special handling for detecting a blank configuration.
  sed -e 's:^[0-9]:# Sample  &:g' \
      -e '/Minor/ s:^#:&00:g' \
    'config/advttyd.conf' > 'config/advttyd.conf.Arch'
  sort -g 'config/advttyd.conf.Arch' > 'config/advttyd.conf'
  rm 'config/advttyd.conf.Arch'

  # Make a less noisy start/stop to not clog up the systemd logs
  sed -e 's@^\(\s*\)echo@\1: # echo@g' 'script/advman' > 'script/advman.quiet'

  # Change original advman to systemd
  #cp -p script/advman{,.orig}; false
  #diff -pNau10 script/advman{.orig,} > '../advman.systemd.patch'
  patch -Nbup0 < "${srcdir}/advman.systemd.patch"

  # Tame the port count
  sed -e 's:^\(#define VCOM_PORTS\)\s.*$:'"\1 ${_opt_MAXINSTPORTS}:g" -i 'driver/advconf.h'

  # The compiled files should not have been included
  'ma'ke -s -j1 clean # keep git-aurcheck quiet
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
  ) "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

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

    install -Dm644 driver/* -t "${_dkms}/driver/"
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
