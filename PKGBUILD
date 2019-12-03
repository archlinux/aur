# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

_opt_DKMS=1            # This can be toggled between installs
_opt_ttymajor=33       # default 33
_opt_calloutmajor=38   # default 38
_opt_defaultmode='666' # default: 666

# Some items are fixed as of 1.19 according to Moxa. I haven't tested them yet.

# Fixed? Fix mxinst to allow polling option
# Todo: Can we have a github release?
# Todo: License file?
# Todo: Most executables would be shorter and cleaner redone as bash scripts.
# Todo: mx utilities should always produce rc.local lines in the right order
# Fixed? improve mx utilities to allow DNS name instead of just IP
# Todo: maybe add build number to version?
# Todo: #ifdef _DEBUG_PRINT is probably wrong
# Todo: Adding more ports should not reset existing ports or launch daemons outside of systemd.
#       It should consist of modifying the configuration and systemd reload
# Todo: All mx utilities should check for root UID
# Todo: many utilities have arbitrary port limits
# Todo: daemons should terminate on SIGTERM
# Todo: SSL connections should auto reconnect on Moxa restart
# Todo: The default mode should be changed to 660
# Todo: mknod should be chgrp uucp
# Todo: When characters are held upstream by a low RTS, connecting to /dev/ttyr* brings RTS high too soon. The held characters are released but never come through to ttyr*. This does not happen with a TCP connection.

# Enable and start service
#   systemctl enable --now 'npreal2.service'

# Add a serial server. Here we use a 1 port Moxa NPort 5110, non SSL
# Log into the Moxa web interface and configure the Operating Settings, Port 1, Device Control, RealCOM mode
# Allow driver control (*) No: baud rate is locked in the Moxa NPort web interface
# Allow driver control (*) Yes: allow Linux to set the baud rate, bits, and parity
#   mxaddsvr 192.168.1.11 1

# Are the daemons and kernel module running?
#   pgrep -a npreal2
#   lsmod | grep npreal2

# Let's see what ports are running?
#   mxdelsvr
#   mxsetsec
# Just quit. Don't delete or change any ports.

# Connect. The baud rate request will be ignored unless: Allow driver control (*) Yes
#   minicom -p /dev/ttyr00 -b 9600
# Are we connected? Moxa web interface, Monitor, Line.
# Port OP Mode       IP1         IP2    IP3    IP4
#  1   Real COM Mode 192.168.1.4 Listen Listen Listen

# You can watch the changes live in the Moxa telnet interface, Monitor or the Moxa 6xxx web interface.

# What is the baud rate? Moxa, Monitor, Async-Setting
#   1 9600 8 1 None
# If you allow driver control, test baud change. minicom, ^AP, change baud rate.
# Did the baud rate change? Moxa, Monitor, Async-Setting
#   1 38400 8 1 None

# Robustness check. Restart the Moxa NPort. Ensure that minicom connectivity is quickly and automatically restored.
# minicom exit, ^AX

# You can enable SSL per port for the secure Moxa.
#   mxsetsec
# SSL connections require tty reopen to restore connectivity after a Moxa reboot.

# Remove port
#   mxdelsvr 192.168.1.11
# Remove port by menu
#   mxdelsvr

# Did the daemons stop running?
#   pgrep -a npreal2

# For more information, redundant connections, and additional commands.
#   less -S '/usr/lib/npreal2/README.TXT'

# Uninstall cleanup: sudo rm -rf /etc/npreal2 /var/log/npreal2d.log

set -u
pkgname='npreal2'
#pkgver='1.18.49'; _commit='6d9ef0dbafd487595c4f5e4e5e64c1faba98d060'
pkgver='1.19'; _build='17110917'
pkgrel='2'
pkgdesc='real tty driver for Moxa NPort serial console terminal server'
_pkgdescshort="Moxa NPort ${pkgname} TTY driver"
arch=('i686' 'x86_64')
url='https://www.moxa.com/support/sarch_result.aspx?type=soft&prod_id=237&type_id=9' # Moxa NPort 5110
#url="https://github.com/rchovan/${pkgname}"
license=('GPL' 'custom')
depends=('glibc' 'gawk' 'perl' 'psmisc' 'openssl')
#makedepends=('git')
backup=("etc/npreal2/npreal2d.cf")
install="${pkgname}-install.sh"
_srcdir='moxa'
source=("https://www.moxa.com/drivers/IDC_SW/DeviceServer/Driver/NPort%20Real%20TTY%20Driver%20for%20Linux/Mainline/ver${pkgver}/npreal2_mainline_v${pkgver}_build_${_build}.tgz")
#_srcdir="${pkgname}"
#source=("git+${url}.git#commit=${_commit}")
#_srcdir="${pkgname}-${_commit}"
#source=("${pkgname}-${pkgver}.tgz::${url}/archive/${_commit}.tar.gz")
source+=('npreal2.sh')
_patches=(
  #'0000-SSL-destroy-cf-configuration.patch'
  '0001-mxmknod-folder-fix-and-chgrp-uucp.patch'
  '0002-kernel-5.0.0-access_ok.patch' # https://lkml.org/lkml/2019/1/4/418
)
source+=("${_patches[@]}")
sha256sums=('f99f38ef5618469a1d6f4824e41856616ee65ab8359069daa70d8d481f364462'
            '7241767fa8dead2dbe4cf4db32d39f5cf9d95b08f60daf79822ae306727af372'
            '7039ca0740be34a641424e3f57b896902f61fdfd2bfcc26e8e954035849e9605'
            '211f3b0ba50452bfe6d39076eb1a60a7557dd038288fb8dcd4374886f4c2844e')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

prepare() {
  set -u
  cd "${_srcdir}"
  local _ver
  _ver="$(sed -n -e 's:^#define\tNPREAL_VERSION\t"Ver\([^"]\+\).*$:\1:p' 'np_ver.h')"
  if [ "${pkgver}" != "${_ver}" ]; then
    echo "Version mismatch ${pkgver} != ${_ver}"
    set +u
    false
  fi
  unset _ver

  # Remove supplied OpenSSL headers. Use the system headers.
  rm -rf 'include/'
  # cp -p 'Makefile'{,.Arch} # testmode for diff comparison
  sed -e '# Remove copy and module commands from make' \
      -e 's:^\s\+cp :#&:g' \
      -e 's:^\s\+depmod :#&:g' \
      -e '# strip is either gcc -s or done by makepkg. Lets not waste time running it again' \
      -e 's:^\s\+strip\s:#&:g' \
      -e '# We can remove the include option. It will use the system openssl headers' \
      -e 's: -I$(PATH1)/include::g' \
      -e '# Fix the syntax for libssl.so' \
      -e '#s: libssl.so: -lssl:g' \
      -e '# Fix the module generator' \
      -e 's: /lib/: /usr/lib/:g' \
      -e '# Cut some of the warnings we dont want to fix' \
      -e '#s:^CC+=.*$:& -Wno-misleading-indentation:g' \
      -e '# Switch SUBDIRS= to M= for Kernel 5.4' \
      -e 's:SUBDIRS=:M=$(PWD) &:g' \
    -i 'Makefile'
  ! test -s 'Makefile.Arch' || echo "${}"

  #Add hash bang to scripts, required for syntax highlighting in mc
  sed -e '1 i#!/bin/sh' -i 'killp' 'mxinst' 'mxmknod' 'mxrmnod' 'mxuninst'

  # cp -p 'mxinst' 'mxinst.Arch' # testmode for diff comparison
  sed -e '# make package compatible' \
      -e 's:/etc/:"${DESTDIR}"&:g' \
      -e '#No reason to make these folder and never copy files to them' \
      -e 's:^mkdir -p /lib/modules/:#&:g' \
      -e 's: /lib/: /usr/lib/:g' \
      -e 's:/usr/:"${DESTDIR}"&:g' \
      -e '#A few DESTDIR were already quoted. The dup quoting needs to be removed' \
      -e 's:""${DESTDIR}":"${DESTDIR}:g' \
      -e '#A fully automated run has no need for traps' \
      -e 's:^trap:#&:g' \
      -e '#Files are already unpacked. Not sure how anyone can run mxinst without unpacking first' \
      -e '#s:^tar_files$:#&:g' \
      -e '#Disable SSL check. We know SSL is present' \
      -e '#s:^\s\+chk_libssl:true &:g' \
      -e '#Disable all process killers' \
      -e 's:^ps :true &:g' \
      -e 's:^lsmod :true &:g' \
      -e '#No Moxa release has the files here' \
      -e '#s:NowPath/../:NowPath/:g' \
      -e '#We disabled the copy in Makefile so theres nothing to probe' \
      -e 's:^modprobe :true &:g' \
      -e '#We do this later' \
      -e 's:^./mxloadsvr :#&:g' \
      -e '#We do not move npreal2d.cf here. mxinst does nothing useful with it' \
      -e '# Ensure that all make run at -j1' \
      -e 's:make :&-j1 :g' \
      -e '# var not used for anything, yet' \
      -e 's:^LINUX_DIS=:#&:g' \
      -e '# Enable SSL' \
      -e 's:^read check:check="Y" # &:g' \
    -i 'mxinst'
  ! test -s 'mxinst.Arch' || echo "${}"

  sed -e '# Predetermine OS detection just in case someone has created the Redhat, Debian, SuSE, or Gentoo flag files for reasons' \
      -e 's:os == "linux":1:g' \
      -e '# Move the startup file away from standard folders where init scripts might find it' \
      -e 's:/etc/rc.d/rc.local:/etc/npreal2/rc.local:g' \
      -e '# Its rude to clear screens' \
      -e 's:system("clear");:/* & */:g' \
      -e '# Move config file in mx utils. Another sed will provide this #define' \
      -e '/npreal2d.cf/ s:DRIVERPATH:CONFIGPATH:g' \
    -i mx*.c
  sed -e '# Move config file in mx daemons' \
      -e '/npreal2d.cf/ s:workpath:"/etc/npreal2":g' \
      -e '# Move log file' \
      -e '/npreal2d.log/ s:workpath:"/var/log":g' \
    -i 'npreal2d.c' 'redund_main.c'

  sed -e '# TEMPDIR is not used. Disabling it makes the compiler tell us if is is used' \
      -e 's:^#define\s\+TEMPDIR.*$:/* & */:g ' \
      -e '# NPPATH is not used so we dont fix it.' \
      -e 's:^#define\s\+NPPATH.*$:/* & */:g ' \
      -e '# provide config file path' \
      -e 's:^#define\(\s\+\)DRIVERPATH\(\s\+\)":#define\1CONFIGPATH\2"/etc/npreal2"\n&:g' \
    -i 'nport.h'

  #diff -pNau5 'mxmknod'{.orig,} > '0001-mxmknod-folder-fix-and-chgrp-uucp.patch'
  patch -Nbup0 -i "${srcdir}/0001-mxmknod-folder-fix-and-chgrp-uucp.patch"

  #cp -p 'npreal2.c'{,.orig}; false
  #diff -pNau5 'npreal2.c'{.orig,} > '0002-kernel-5.0.0-access_ok.patch'
  patch -Nbup0 -i "${srcdir}/0002-kernel-5.0.0-access_ok.patch"

  # Apply PKGBUILD options
  sed -e 's:^\(ttymajor\)=.*:'"\1=${_opt_ttymajor}:g" \
      -e 's:^\(calloutmajor\)=.*:'"\1=${_opt_calloutmajor}:g" \
    -i 'npreal2d.cf'
  sed -e 's:-m 666:'"-m ${_opt_defaultmode}:g" -i 'npreal2d.c' 'mxmknod'

  # All mxloadsvr install does is to modify system files, load module, and launch daemons
  # We'll do this on the first systemctl start.
  # Here we modify the installer so we can see the lines it runs for each OS.
  if ! :; then # debug only
    sed -e '# Make the installer package compatible' \
        -e 's:^#define\s\+DRIVERPATH\s\+":'"&${pkgdir}:g" \
      'nport.h' > 'nport_package.h'
    sed -e '# Make rest of installer package compatible ' \
        -e 's:^#include\s\+"nport.h":#include "nport_package.h":g' \
        -e 's:"/etc/:"'"${pkgdir}/etc/:g" \
        -e 's: /etc/: \\"'"${pkgdir}"'\\"/etc/:g' \
        -e '#Here we disable the same stuff disabled in mxinst. No need to kill or load modules here' \
        -e 's:"ps :"true ps :g' \
        -e 's:"rmmod :"true rmmod :g' \
        -e 's:"modprobe :"true modprobe :g' \
        -e '#add debug code so we can see the commands' \
        -e 's:^\(\s\+\)system(:\1systemArchLinux(:g' \
        -e 's:^unsigned\slong\sfilelength:static int systemArchLinux(const char *command) { puts(command); return system(command); }\n\n&:g' \
        -e '#Show the detected OS' \
        -e 's:^\(\s\+\)makenode = LOADNODE;:\1printf("Detected os=%s\\n",os);\n&:g' \
      'mxloadsvr.c' > 'mxloadsvr_package.c'
  fi
  set +u
}

# mxinst would need to be hacked a lot more to get it into two parts
# so we could put build and install in the appropriate places.
# It's easier to let mxinst do it all in package()

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

  # The code at the beginning of mxinst remove parameters SP1 and polling.
  # These options don't work any more and we are prevented from using 'sh -u'
  # We always enable SSL because we make the library always available. It is enabled per port by the admin.
  # Build and install
  DESTDIR="${pkgdir}" \
  sh -e 'mxinst' --use-ssl --replace | \
  sed -e "s:${pkgdir}::g" # prevent bogus folder display

  # Root only permissions on executables. Easier than hacking UID 0 into them.
  find "${pkgdir}/usr/lib/npreal2/driver/" -type 'f' -perm '/111' -exec chmod 744 '{}' '+'

  # This is a debug only section usually disabled up in prepare()
  if [ -s 'mxloadsvr_package.c' ]; then
    gcc -s -o 'mxloadsvr_package' 'mxloadsvr_package.c'
    # Creating these flags lets us see the command sequence for each OS
    #install -d "${pkgdir}/etc/rc.d/"; touch "${pkgdir}/etc/redhat-release" "${pkgdir}/etc/rc.d/rc.local" # detect as linux, same as no file
    #install -d "${pkgdir}/etc/rc.d/"; touch "${pkgdir}/etc/SuSE-release" "${pkgdir}/etc/rc.d/boot.local"
    #install -d "${pkgdir}/etc/init.d/"; touch "${pkgdir}/etc/debian_version" "${pkgdir}/etc/init.d/npreals"
    #install -d "${pkgdir}/etc/conf.d/"; touch "${pkgdir}/etc/gentoo-release" "${pkgdir}/etc/conf.d/local.start"
  fi

  # mxuninst is handled by PKGBUILD. Nothing used killp and if they did, we'd change it to killall.
  rm "${pkgdir}/usr/lib/npreal2/driver"/{'mxuninst','killp'}

  # Module install was disabled in mxinst so we must install it.
  install -Dpm644 'npreal2.ko' -t "${pkgdir}/usr/lib/modules/$(uname -r)/extra/npreal2/"

  # Place start stop scripts
  install -Dpm744 /dev/null "${pkgdir}/etc/npreal2/rc.local" # the mx utils chmod this +x. The 0-length file triggers the configuration on the first start
  install -Dpm744 "${srcdir}/npreal2.sh" -t "${pkgdir}/etc/npreal2/"

  # Move configuration files to /etc
  mv "${pkgdir}/usr/lib/npreal2/driver"/{'npreal2d.cf','config'} "${pkgdir}/etc/npreal2/"

  # Place empty log file.
  install -d "${pkgdir}/var/log"
  #install -Dpm666 /dev/null "${pkgdir}/var/log/npreal2d.log"

  # Expose user tools. The instructions mention mxloadsvr so we'll add that one too
  install -d "${pkgdir}/usr/bin/"
  local _bin
  for _bin in 'mxaddsvr' 'mxdelsvr' 'mxsetsec' 'mxloadsvr'; do
    ln -s "/usr/lib/npreal2/driver/${_bin}" "${pkgdir}/usr/bin/${_bin}"
  done
  unset _bin

  # For now SSL is always enabled. If it were disabled, we don't provide the SSL enable tool
  #rm "${pkgdir}/usr/lib/npreal2/driver/mxsetsec" "${pkgdir}/usr/bin/mxsetsec"

  # systemd service
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=${_pkgdescshort}
After=network.target

[Service]
Type=notify
ExecStart=/etc/npreal2/npreal2.sh start
ExecStop=/etc/npreal2/npreal2.sh stop
ExecReload=/etc/npreal2/npreal2.sh reload
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
  ) "${pkgdir}/usr/lib/systemd/system/npreal2.service"

  if [ "${_opt_DKMS}" -eq 0 ]; then
    pushd "${pkgdir}/usr/lib/npreal2/driver" > /dev/null
    # Not sure why mxinst copied these, unless the Moxa developers were planning on DKMS
    rm -f 'Makefile' *.c *.h
    popd > /dev/null
  else
    rm -rf "${pkgdir}/usr/lib/modules/"
    local _dkms="${pkgdir}/usr/src/${pkgname}-${pkgver}"
    install -d "${_dkms}"
    pushd "${pkgdir}/usr/lib/npreal2/driver" > /dev/null
    cd "${pkgdir}/usr/lib/npreal2/driver"
    rm -f 'npreal2d.c'
    mv 'Makefile' *.c *.h "${_dkms}/"
    popd > /dev/null
    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

PACKAGE_NAME="${pkgname}"
PACKAGE_VERSION="${pkgver}"
AUTOINSTALL="yes"

BUILT_MODULE_NAME[0]="npreal2"
BUILT_MODULE_LOCATION[0]=""
# Using all processors doesn't compile this tiny module any faster.
MAKE[0]="make -j1 module"
CLEAN[0]="make -j1 clean"
# Placing the DKMS generated module in a different location than the standard install prevents conflicts when PKGBUILD _opt_DKMS is toggled
DEST_MODULE_LOCATION[0]="/kernel/drivers/misc"
EOF
    ) "${_dkms}/dkms.conf"
    install -Dpm644 'np_ver.h' -t "${_dkms}/"
    sed -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple' \
        -e 's:$(shell uname -r):$(KERNELRELEASE):g' \
        -e 's:`uname -r`:$(KERNELRELEASE):g' \
        -e '# DKMS sets KERNELRELEASE which accidentally launches phase 2 of this Makefile' \
        -e '# Fix by changing the detection var.' \
        -e '# SUBDIRS makes more sense to me because I can see it in the Makefile!' \
        -e 's:^ifneq ($(KERNELRELEASE),):ifneq ($(SUBDIRS),):g' \
      -i "${_dkms}/Makefile"
    make -s -C "${_dkms}/" clean
  fi
  set +u
}

set +u
