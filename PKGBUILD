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

_opt_Debug=0          # 0 for no symbols, 1 for symbols

# The following two must be different and exactly two letters, and likely
# lowercase.
# This is experimental and changed at your own risk!
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
_dlver='6.10.0-1'
pkgver="${_dlver//-/.}"
#_dlver='6.8.0-2' # only use this with a version change patch set
_srcdir="${pkgname}-${_dlver%%-*}"
pkgrel='1'
pkgdesc='tty driver for Perle IOLan+ DS TS SDS STS SCS JetStream LanStream LinkStream and 3rd party serial console terminal device servers'
_pkgdescshort='Perle TruePort driver for Ethernet serial servers'
arch=('i686' 'x86_64')
url='https://www.perle.com/'
license=('GPL' 'custom')
depends=('glibc' 'systemd')
if [ "${_opt_SSL}" -ne 0 ]; then
  depends+=('openssl')
fi
makedepends=('awk' 'sed' 'diffutils' 'patch')
backup=(etc/trueport/{config.tp,pktfwdcfg.tp,sslcfg.tp})
options=('!docs' '!emptydirs' '!strip')
install="${pkgname}-install.sh"
_verwatch=('https://www.perle.com/downloads/server_ds_ts.shtml' '\s\+<a.*trueport-linux-tgz">\([^<]\+\)<.*' 'f')
source=(
  "https://www.perle.com/downloads/drivers/trueport/linux/${pkgname}-${_dlver}.tgz"
  'tty_default_permissions.patch'
  #'trueport-patch-6.8.0-6.8.5.patch'
  # http://dpdk.org/dev/patchwork/patch/22003/ [dpdk-dev] kni: fix build with kernel 4.11 lib/librte_eal/linuxapp/kni/compat.h lib/librte_eal/linuxapp/kni/kni_dev.h
  # http://dpdk.org/dev/patchwork/patch/22037/
  # http://rglinuxtech.com/?p=1930
  # https://forum.manjaro.org/t/error-with-rtl8812au/24066
  #'trueport-patch-signal_pending-kernel-4-11.patch'
)
md5sums=('5a529676de30706133255ba4e8dae5b0'
         '56444e2f404aa2e6a2c9e8e2bd919fcf')
sha256sums=('c21340a7523593da3e229b79cfbcf9e656772b2039e972dbca3947d138d55ffa'
            '28863731fd99e447dc456312ef33e40f93623b56da0d345e45f40e238ca49639')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

prepare() {
  set -u
  cd "${_srcdir}"

  # diff -pNaru5 'trueport-6.8.0' 'trueport-6.8.3' > 'trueport-patch-6.8.0-6.8.3-stack-smashing.patch'
  #patch -Nup1 < '../trueport-patch-6.8.0-6.8.3-stack-smashing.patch'
  # diff -pNau5 ptyx/ptys.c{.orig,} > '../trueport-patch-signal_pending-kernel-4-11.patch'
  #patch -Nup0 < '../trueport-patch-signal_pending-kernel-4-11.patch'
  # diff -pNaru5 'trueport-6.8.0' 'trueport-6.8.5' > 'trueport-patch-6.8.0-6.8.5.patch'
  #patch -Nup1 -i '../trueport-patch-6.8.0-6.8.5.patch'

  # insert parameters and make install script non interactive.
  set +u; msg2 'Checking SSL with rpm_build'; set -u
  sed -e 's:^\(DONE\)=.*$:'"\1='done';SSL='${_opt_SSL}':g" \
      -e 's:^\(MAXINSTPORTS\)=.*$:'"DONE='done';MAXINSTPORTS='${_opt_MAXINSTPORTS}':g" \
    'tar_install.sh' | \
  NEED_SSL= \
  sh -e -u -s -- 'rpm_build'

  sed -e '# Stripping symbols is the job of PKGBUILD. We need these for crash analysis.' \
      -e '/install/ s:-s:  :g' \
      -e '# Try clang' \
      -e '#s:^CC=.*$:CC=clang:g' \
    -i 'Makefile'

  # switch to kernel clean
  sed -e 's/^clean:.*$/clean:\n\t$(MAKE) -C $(KDIR) M=$$PWD clean\n\nold_&/g' \
      -e '# Switch SUBDIRS= to M= for Kernel 5.4' \
      -e '#s:SUBDIRS=:M=$(PWD) &:g' \
      -e '# Add back SUBDIRS for our detection' \
      -e 's:M=\([^ ]\+\):& SUBDIRS=\1 :g' \
      -e '# Remove cruft' \
      -e 's:^bindir=:#&:g' \
      -e '# Fix /lib' \
      -e 's:/lib/modules:/usr&:g' \
    -i 'ptyx/Makefile'

  # Remove CRLF line endings from some files
  sed -e 's:\r$::g' -i 'tp_ver.h' 'ptyx/ptyx.h' 'README'

  # Change the default ttys from tx and px (experimental)
  sed -e 's:\( fixed_ttyname,"\)px\(" \):'"\1${_opt_masterttypfx}\2:g" \
      -e 's:\( slave_ttyname, "/dev/\%s\%04d","\)tx\(",\):'"\1${_opt_slavettypfx}\2:g" \
    -i 'trueportd.c'
  sed -e 's:^\(FORMAT\)=tx:'"\1=${_opt_slavettypfx}:g" -i 'addports'
  sed -e 's:^\(FULLTTYNAME\="\)tx:'"\1${_opt_slavettypfx}:g" \
      -e 's:\(grep "\)tx:'"\1${_opt_slavettypfx}:g" \
    -i 'tplogin'

  # Add code for default permissions and chown group to uucp
  # I tried to change system("mknod") to mknod() but the permissions
  # wouldn't stick without a separate call to chmod()
  sed -e "s:@TRUEPORT_TTY_PERMISSIONS@:${_opt_defaultmode}:g" \
      -e "s:@TRUEPORT_TTY_GROUP@:uucp:g" \
    "${srcdir}/tty_default_permissions.patch" | \
  patch -Nbup0
  # diff -pNau5 trueportd.c{.orig,} > '../tty_default_permissions.patch' # Then change the two @@ items above

  'ma'ke -s -j1 clean # keep git-aurcheck quiet
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  local _cflags=('-s' '-g -rdynamic')
  #_cflags[0]+=' -fno-stack-protector'
  local _makeflags=('-s' '')
  CFLAGS="${CFLAGS} ${_cflags[${_opt_Debug}]}" \
  make ${_makeflags[${_opt_Debug}]} -j1 # Too small to benefit from multi processor compile
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

  make -s -j1 DESTDIR="${pkgdir}" install
  rm -f '/tmp/files' # Not used by postinstall. Probably used in the rpm_build.

  # Fix postinstall to generate modprobe.conf. Stop after the first section.
  install -dm755 "${pkgdir}/etc/modprobe.d"
  sed -e 's:/etc/modprobe:"${DESTDIR}"&:g' \
      -e 's:^if \[ -x /sbin/depmod:exit 0\n&:g' \
      -e '#s:-x /sbin/depmod:-x "/sbin/depmod":g' \
      -e '#s:/sbin/depmod -a:true:g' \
      -e '#s:^CHKCONFIG_BIN=""$:exit 0:g' \
    'postinstall.sh' > 'postinstall.sh.Arch'
  MAXINSTPORTS="${_opt_MAXINSTPORTS}" \
  DESTDIR="${pkgdir}" \
  sh -e -u 'postinstall.sh.Arch'
  rm 'postinstall.sh.Arch'

  # Postinstall functions are either handled by our install or not valid with systemd
  rm -f "${pkgdir}/etc/trueport"/{postinstall.sh,uninstall.sh}

  # We use the SysV init script but we don't want it in init.d where 
  # systemd SysV compatibility might try to run it.
  mv -f "${pkgdir}/etc/init.d/trueport" "${pkgdir}/etc/trueport/trueport"
  rmdir "${pkgdir}/etc/init.d"

  # systemctl start loads the kernel module and any number of daemons. No daemon
  # is loaded if no ports are configured. systemd stops the service if nothing forks.
  # Notify was the only way I could find to keep the service running.
  sed -e 's/[^a-z];;/systemd-notify --ready;;/' -i "${pkgdir}/etc/trueport/trueport"

  # systemd service
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=${_pkgdescshort}
After=network.target

[Service]
Type=notify
ExecStart=/etc/trueport/trueport start
ExecStop=/etc/trueport/trueport stop
ExecReload=/etc/trueport/trueport restart
RemainAfterExit=yes
TimeoutStopSec=15

[Install]
WantedBy=multi-user.target
EOF
  ) "${pkgdir}/usr/lib/systemd/system/trueport.service"

  if [ "${_opt_DKMS}" -ne 0 ]; then
    rm -rf "${pkgdir}/usr/lib/modules/"
    local _dkms="${pkgdir}/usr/src/${pkgname}-${pkgver}"
    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

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
    ) "${_dkms}/dkms.conf"
    install -Dpm644 ptyx/* -t "${_dkms}/ptyx/"
    rm "${_dkms}/ptyx/modules.order"
    install -pm644 'tp_ver.h' 'tp.h' -t "${_dkms}/"
    sed -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple' \
        -e 's:$(shell uname -r):$(KERNELRELEASE):g' \
        -e 's:`uname -r`:$(KERNELRELEASE):g' \
        -e '# DKMS sets KERNELRELEASE which accidentally launches phase 2 of this Makefile' \
        -e '# Fix by changing the detection var.' \
        -e '# SUBDIRS makes more sense to me because I can see it in the Makefile!' \
        -e 's:^ifeq ($(KERNELRELEASE):ifeq ($(SUBDIRS):g' \
       -i "${_dkms}/ptyx/Makefile"
    make -s -C "${_dkms}/ptyx/" KERNELRELEASE="$(uname -r)" clean
  fi
  set +u
}

set +u
