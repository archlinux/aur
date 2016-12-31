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

# Enable at boot
#   systemctl status 'advtty-vcom.service'

# Add a 1 port Adam-4571L-CE
# See README.txt for table of device codes.
#   advadd -t 'B571' -a '192.168.50.222' -p 1 -m 6
#   advman -o restart
# or
#   systemctl restart 'advtty-vcom.service'

# Show the config
#   advls

# Show the running module
#   lsmod | grep 'advvcom'

# Show the running driver
#  ps -ef | grep advttyd

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
pkgver=2.1.0
pkgrel=1
pkgdesc='TTY driver for Advantech Adam EKI serial console terminal servers'
_pkgdescshort="Advantech ${pkgname} TTY driver"
arch=('i686' 'x86_64')
url='http://www.advantech.com/intelligent-connectivity/'
license=('GPL')
depends=('glibc' 'gawk' 'psmisc' 'sed' 'grep')
backup=('etc/advttyd.conf')
install="${pkgname}-install.sh"
_srcdir="VCOM_LINUX_${pkgver}.TAR.BZ2"
source=("${_srcdir,,}::http://advdownload.advantech.com/productfile/Downloadfile1/1-15OSOW4/${_srcdir}")
_srcdir="${_srcdir,,}"
_srcdir="${_srcdir%\.tar*}"
source+=('advman.systemd.patch')
sha256sums=('15156f815bb8c3ef151c76bf09a0c352f0847fc8b03c6c9f7e285a7d6122e918'
            'a5097dbed76b372584d90910527858034c898117be1b3375da23a380d44ba18e')

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
  #diff -c10 script/advman{.orig,} > ../../advman.systemd.patch
  patch -b -c -p0 < "${srcdir}/advman.systemd.patch"

  # Tame the port count
  sed -e 's:^\(#define VCOM_PORTS\)\s.*$:'"\1 ${_opt_MAXINSTPORTS}:g" -i 'driver/advconf.h'

  # The compiled files should not have been included
  sh -c 'ma''ke clean'

  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s -j1
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  if [ "${_opt_DKMS}" -eq 0 ]; then
    # I don't want Linux version info showing on AUR web. After a few months 'linux<0.0.0' makes it look like an out of date package.
    local _kernelversionsmall="$(pacman -Q linux)" # this differs from uname -r. pacman: 4.0, uname: 4.0.0
    _kernelversionsmall="${_kernelversionsmall#* }"
    _kernelversionsmall="${_kernelversionsmall%-*}"
    # prevent the mksrcinfo bash emulator from getting these vars!
    eval 'conf''licts=("linux>${_kernelversionsmall}" "linux<${_kernelversionsmall}")'
    eval 'dep''ends+=("linux=${_kernelversionsmall}")'
  fi

  # This install expects the system folders to exist
  install -d "${pkgdir}"{'/usr/bin','/etc','/var/log'}

  make DESTDIR="${pkgdir}" INSTALL_PATH="/usr/share/advtty/" install_daemon

  # Most utils are fixed to terminate on non root.
  find "${pkgdir}/usr/share/advtty/" -type 'f' -perm /111 -exec chmod 755 '{}' '+'
  # Root only permissions that don't block non root
  chmod 744 "${pkgdir}/usr/share/advtty/advttyd"

  # The makefile installed the module into the wrong place so we disabled it
  install -Dpm644 'driver/advvcom.ko' -t "${pkgdir}/usr/lib/modules/$(uname -r)/extra/char/"

  install -Dpm755 'script/advman.quiet' -t "${pkgdir}/usr/share/advtty/"
  install -Dpm644 'readme.txt' -t "${pkgdir}/usr/share/advtty/"

  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# http://aur.archlinux.org/

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
    rm -rf "${pkgdir}/usr/lib/modules/"

    # It's easier to make my own config than fix theirs
    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# http://aur.archlinux.org/

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
    ) "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"

    install -Dm644 driver/* -t "${pkgdir}/usr/src/${pkgname}-${pkgver}/driver/"
    make -C "${pkgdir}/usr/src/${pkgname}-${pkgver}/driver/" clean
    rm "${pkgdir}/usr/src/${pkgname}-${pkgver}/driver/dkms.conf"
    sed -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple' \
        -e 's:$(shell uname -r):$(KERNELRELEASE):g' \
        -e 's:`uname -r`:$(KERNELRELEASE):g' \
        -e '# DKMS sets KERNELRELEASE which accidentally launches phase 2 of this Makefile' \
        -e '# Fix by changing the detection var.' \
        -e 's:^ifneq ($(KERNELRELEASE),):ifneq ($(ARCHLINUX),):g' \
        -e '# Put the detection var in' \
        -e 's:^\s\+\$(MAKE)\s-C\s\$(KERNELDIR):& ARCHLINUX=1:g' \
       -i "${pkgdir}/usr/src/${pkgname}-${pkgver}/driver/Makefile"
  fi
  set +u
}

set +u
