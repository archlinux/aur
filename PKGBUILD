# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

# Todo: Update addlogins and rmlogins for systemd* getty
# Todo: Console utility like drpadmin: trueportadmin or ptyxadmin or ???

# Bugs:
# The Statistics/Serial Screen on an SDS does not show the proper baud rate when a TruePort is set by stty -F.
# tpadm -d removes the config entry but does not kill the daemon.

_opt_DKMS=1           # This can be toggled between installs
_opt_MAXINSTPORTS=16  # Maximum install ports. Ranges from 1 to 255999.
                      # See instructions in release notes for more than a few thousand.
                      # Default=256 which is plenty for normal size installations.
                      # It's best to use a small number. Nodes are created for
                      # /dev/{tps,txc,txm}{0..n-1}
_opt_SSL=1            # 1 for SSL support, 0 for no SSL support
                      # Each device is independantly configured with or without SSL
_opt_defaultmode='666' # default: 660

# The following two must be different and exactly two letters, and likely
# lowercase.
# This is experimental and to be used at your own risk!
_opt_slavettypfx='tx'  # default tx
_opt_masterttypfx='px' # default px (this isn't very useful to users)

# Once installed you need to enable and start the service. Starting the service
# loads the kernel driver (ptyx) and loads a daemon (trueportd) for each
# configured device.

# systemctl enable trueport.service
# systemctl start trueport.service

# As long as the service is enabled, subsequent installs and upgrades will 
# start the service automatically.

# There are no man pages. For instructions download the 
# "TruePort Linux User Guide" linux_ug-6_2.pdf from Perle.
# Ignore the sections on install and remove. These functions are handled by 
# this PKGBUILD.

# 4 port IOLan STS 4D example
# Log into the STS 4D and switch all ports to TruePort
# addports -hup -k 2500 -opmode optimize_lan -client 192.168.10.229 0 3

# Is the kernel module loaded?
# lsmod | grep ptyx
# ptyx                   24576  14

# Are the daemons running?
# ps -e | grep trueportd
# 8534 tpc0     00:00:00 trueportd
# 8535 tpm1     00:00:00 trueportd
# 8536 tpm2     00:00:00 trueportd
# 8537 tpm3     00:00:00 trueportd

# Were the tty's created?
# ls /dev/[pt]x[0-9]*
# /dev/tx0000  /dev/tx0001  /dev/tx0002  /dev/tx0003

# Set baud rate.
# stty -F /dev/tx0000 57600
# Default baud rate at boot should be set in the IOLan web interface.

# Watch the RX/TX leds on the terminal server
# echo "Hello" > /dev/tx0000
# echo "Hello" > /dev/tx0001
# echo "Hello" > /dev/tx0002
# echo "Hello" > /dev/tx0003

# What ports are running?
# tpadm -l ALL

# Deactivate all ports
# tpadm -d 192.168.10.229:10001
# tpadm -d 192.168.10.229:10002
# tpadm -d 192.168.10.229:10003
# tpadm -d 192.168.10.229:10004

# Remove orphaned tty nodes. These disappear on the next reboot.
# rm -f /dev/tx[0-9]*

# 1 port IOlan DS1 as Trueport example
# Log into the DS1 and switch the port profile to TruePort
# addports -hup -k 2500 -opmode optimize_lan -client 192.168.10.229:10001 0 0

# 1 port IOlan DS1 or 3rd party brand as TCP Socket example
# Log into the DS1 and switch the port profile to TCP Sockets
# addports -l -hup -k 2500 -io mb_ascii -opmode optimize_lan -client 192.168.10.229:10001 0 0

# Uninstall cleanup: rm -rf /etc/trueport

set -u
pkgname='trueport'
pkgver='6.8.0'
_pkgverrel='2'
pkgrel='1'
pkgdesc='tty driver for Perle IOLan+ DS TS SDS STS SCS JetStream LanStream LinkStream and 3rd party serial servers'
_pkgdescshort='Perle TruePort driver for Ethernet serial servers'
arch=('i686' 'x86_64')
url='http://www.perle.com/'
license=('GPL' 'custom')
depends=('openssl' 'systemd')
makedepends=('awk')
backup=(etc/trueport/{config.tp,pktfwdcfg.tp,sslcfg.tp})
options=('!docs' '!emptydirs')
install="${pkgname}-install.sh"
_verwatch=('https://www.perle.com/downloads/server_ds1.shtml' '\s\+<a.*trueport-linux-tgz">\([^<]\+\)<.*' 'f')
source=(
  "https://www.perle.com/downloads/drivers/trueport/linux2.6/${pkgname}-${pkgver}-${_pkgverrel}.tgz"
  'tty_default_permissions.patch'
)
sha256sums=('c03dc972166fb693411cafcc7fb01478022dbc5da19d4db0f505591df819a72e'
            '83eddfb8616aa27c2fbf6924bb91fdb0ba366b22668f72c51219779cd1ec258b')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  # insert parameters and make install script non interactive.
  sed -e 's:^\(DONE\)=.*$:'"\1='done';SSL='${_opt_SSL}':g" \
      -e 's:^\(MAXINSTPORTS\)=.*$:'"DONE='done';MAXINSTPORTS='${_opt_MAXINSTPORTS}':g" \
    'tar_install.sh' | \
  NEED_SSL= \
  sh -e -u -s -- 'rpm_build'

  # make clean for ptyx forgets a few things
  sed -i -e 's:rm -f ptymod\.o:rm -f ptyx.mod.o ptyx.o ptymod.o:g' 'ptyx/Makefile'

  # Remove CRLF line endings from some files
  sed -i -e 's:\r$::g' 'tp_ver.h' 'ptyx/ptyx.h'

  # Change the default ttys from tx and px (experimental)
  sed -i -e 's:\( fixed_ttyname,"\)px\(" \):'"\1${_opt_masterttypfx}\2:g" \
         -e 's:\( slave_ttyname, "/dev/\%s\%04d","\)tx\(",\):'"\1${_opt_slavettypfx}\2:g" \
    'trueportd.c'
  sed -i -e 's:^\(FORMAT\)=tx:'"\1=${_opt_slavettypfx}:g" 'addports'
  sed -i -e 's:^\(FULLTTYNAME\="\)tx:'"\1${_opt_slavettypfx}:g" \
         -e 's:\(grep "\)tx:'"\1${_opt_slavettypfx}:g" \
    'tplogin'

  # Add code for default permissions and chown group to uucp
  # I tried to change system("mknod") to mknod() but the permissions
  # wouldn't stick without a separate call to chmod()
  sed -e "s:@TRUEPORT_TTY_PERMISSIONS@:${_opt_defaultmode}:g" \
      -e "s:@TRUEPORT_TTY_GROUP@:uucp:g" \
    "${srcdir}/tty_default_permissions.patch" | \
  patch -b -c -p0
  # diff -c5 'trueportd.c.orig' 'trueportd.c' > '../../tty_default_permissions.patch'

  make -j1 clean
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  make -s -j1 # Too small to benefit from multi processor compile
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"

  if [ "${_opt_DKMS}" -eq 0 ]; then
    # I don't want Linux version info showing on AUR web. After a few months 'linux<0.0.0' makes it look like an out of date package.
    local _kernelversionsmall="$(pacman -Q linux)" # this differs from uname -r. pacman: 4.0, uname: 4.0.0
    _kernelversionsmall="${_kernelversionsmall#* }"
    _kernelversionsmall="${_kernelversionsmall%-*}"
    # prevent the mksrcinfo bash emulator from getting these vars!
    eval 'conf''licts=("linux>${_kernelversionsmall}" "linux<${_kernelversionsmall}")'
    eval 'dep''ends+=("linux=${_kernelversionsmall}")'
  fi

  make DESTDIR="${pkgdir}" install
  rm -f '/tmp/files' # Not used by postinstall. Probably used in the rpm_build.

  # Fix postinstall to generate modprobe.conf. Stop after the first section.
  install -dm755 "${pkgdir}/etc/modprobe.d"
  sed -e 's:/etc/modprobe:${DESTDIR}&:g' \
      -e 's:^if \[ -x /sbin/depmod:exit 0\n&:g' \
      -e '#s:-x /sbin/depmod:-x "/sbin/depmod":g' \
      -e '#s:/sbin/depmod -a:true:g' \
      -e '#s:^CHKCONFIG_BIN=""$:exit 0:g' \
    'postinstall.sh' | \
  MAXINSTPORTS="${_opt_MAXINSTPORTS}" \
  DESTDIR="${pkgdir}" \
  sh -e -u -s --

  # Postinstall functions are either handled by our install or not valid with systemd
  rm -f "${pkgdir}/etc/trueport"/{postinstall.sh,uninstall.sh}

  # We use the SysV init script but we don't want it in init.d where 
  # systemd SysV compatibility might try to run it.
  mv -f "${pkgdir}/etc/init.d/trueport" "${pkgdir}/etc/trueport/trueport"
  rmdir "${pkgdir}/etc/init.d"

  # systemctl start loads the kernel module and any number of daemons. No daemon
  # is loaded if no ports are configured. systemd stops the service if nothing forks.
  # Notify was the only way I could find to keep the service running.
  sed -i -e 's/[^a-z];;/systemd-notify --ready;;/' "${pkgdir}/etc/trueport/trueport"

  # /lib is deprecated in Arch Linux
  mv -f "${pkgdir}/lib" "${pkgdir}/usr/lib/"

  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# http://aur.archlinux.org/

[Unit]
Description=${_pkgdescshort}
After=network.target

[Service]
Type=notify
ExecStart=/etc/trueport/trueport start
ExecStop=/etc/trueport/trueport stop
ExecReload=/etc/trueport/trueport restart
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
  ) "${pkgdir}/usr/lib/systemd/system/trueport.service"

  if [ "${_opt_DKMS}" -ne 0 ]; then
    rm -rf "${pkgdir}/usr/lib/modules/"
    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# http://aur.archlinux.org/

PACKAGE_NAME="${pkgname}"
PACKAGE_VERSION="${pkgver}"
AUTOINSTALL="yes"

BUILT_MODULE_NAME[0]="ptyx"
BUILT_MODULE_LOCATION[0]="ptyx"
# Using all processors doesn't compile this tiny module any faster.
MAKE[0]="make -j1 -C 'ptyx'"
CLEAN[0]="make -j1 -C 'ptyx' clean"
# Placing the DKMS generated module in a different location than the standard install prevents conflicts when PKGBUILD _opt_DKMS is toggled
DEST_MODULE_LOCATION[0]="/kernel/drivers/misc"
EOF
    ) "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
    install -Dpm644 ptyx/* -t "${pkgdir}/usr/src/${pkgname}-${pkgver}/ptyx/"
    make -C "${pkgdir}/usr/src/${pkgname}-${pkgver}/ptyx/" clean
    install -pm644 'tp_ver.h' 'tp.h' -t "${pkgdir}/usr/src/${pkgname}-${pkgver}/"
    sed -i -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple' \
           -e 's:$(shell uname -r):$(KERNELRELEASE):g' \
           -e 's:`uname -r`:$(KERNELRELEASE):g' \
           -e '# DKMS sets KERNELRELEASE which accidentally launches phase 2 of this Makefile' \
           -e '# Fix by changing the detection var.' \
           -e '# SUBDIRS makes more sense to me because I can see it in the Makefile!' \
           -e 's:^ifeq ($(KERNELRELEASE):ifeq ($(SUBDIRS):g' \
       "${pkgdir}/usr/src/${pkgname}-${pkgver}/ptyx/Makefile"
  fi
  set +u
}

set +u
