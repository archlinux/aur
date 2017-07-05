# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

_opt_DKMS=1            # This can be toggled between installs
#_opt_defaultmode='666' # default: 660

# Todo: Implement defaultmode
# Todo: Test secure mode

# Todo: python tools should be updated to python3
# Todo: nslinkadmin ethdevname needs to be adjustable when launched from command line, not "eth0".
# Todo: nslinktool add systemd support
# Todo: nslinktool needs an eth selector
# Todo: nslinktool what does the "Load" button do?
# Todo: nslinktool Config Driver needs an up down button to reorder entries
# Todo: separate firmware updater
# Todo: Comtrol icons for nslinktool and the firmware updater
# Todo: The IP is backwards in /proc/driver/nslink/status
# Todo: nslinktool set the mouse pointer to a spinning circle far too long after startup

# Uninstall cleanup: sudo rm -f /etc/nslink.conf*

set -u
pkgname='nslink'
pkgver='7.15'
pkgrel='2'
pkgdesc='tty driver and firmware update for Comtrol DeviceMaster, RTS, LT, PRO, 500, UP, RPSH-SI, RPSH, and Serial Hub console terminal device server'
# UP is not explicitly supported by NS-Link, only by the firmware updater.
_pkgdescshort="Comtrol DeviceMaster ${pkgname} TTY driver"
arch=('i686' 'x86_64')
url='http://www.comtrol.com/'
license=('GPL')
depends=('glibc' 'openssl' 'python2' 'sed' 'groff' 'tcl' 'tk' 'util-linux') # python is also needed for the firmware updater
optdepends=(
  'gksu: Digi RealPort Manager GUI'
)
makedepends=()
backup=("etc/nslink.conf")
options=('!zipman')
install="${pkgname}-install.sh"
_verwatch=('http://downloads.comtrol.com/html/DM_PRO_RTS_SERIALHUB_drivers.htm' '.*/devicemaster-linux-\([0-9\.]\+\)\.tar\.gz' 'l')
_srcdir="devicemaster-linux-${pkgver}"
_srcdir2="DM-Firmware-Updater-1.06"
#source=("ftp://ftp.comtrol.com/dev_mstr/rts/drivers/linux/devicemaster-linux-${pkgver}.tar.gz")
source=("http://downloads.comtrol.com/dev_mstr/rts/drivers/linux/devicemaster-linux-${pkgver}.tar.gz")
#source+=('ftp://ftp.comtrol.com/dev_mstr/rts/utility/linux_firmware_uploader/DM-Firmware-Updater-1.06.tar.gz')
source+=('http://downloads.comtrol.com/dev_mstr/rts/utility/linux_firmware_uploader/DM-Firmware-Updater-1.06.tar.gz')
source+=('dmupdate.py.usage.patch' 'nslinktool.systemd.patch' 'nslink-patch-signal_pending-kernel-4-11.patch')
sha256sums=('f166dc53d53c856a790b4c21f40f3f9df66684aa687fa84b502a795a8130dafc'
            'd21c5eeefdbf08a202a230454f0bf702221686ba3e663eb41852719bb20b75fb'
            '5a4e2713a8d1fe0eebd94fc843839ce5daa647f9fa7d88f62507e660ae111073'
            'c6e4b4c3ee31cbad8f18db5973d0b0c677443ce9d55f86326557e51e94752097'
            '20c01753d9d32fdc88853a42ead7c5e8cffb1f4c9ab1c2ba028b3c5e89e1d711')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

_opt_ethernet_data='eno_____________________________'
_opt_ethernet_keystring='<-<-<-ArchLinux_ethernet_keystring->->->'

prepare() {
  set -u
  cd "${_srcdir}"

  # Fix permissions
  find -type 'f' -perm '/111' -exec chmod 644 '{}' '+'
  chmod 755 *.sh *.py 'nslinktool'
  local _ver="$(sed -n -e 's:^#define\sSI_VERSION\s"\([^"]\+\).*$:\1:p' 'version.h')"
  if [ "${pkgver}" != "${_ver}" ]; then
    echo "Version mismatch ${pkgver} != ${_ver}"
    set +u
    false
  fi
  unset _ver

  # Minor fixes to Makefile
  sed -e '# Fix a path' \
      -e 's:/lib/:/usr/lib/:g' \
      -e '# These lines look dangerous so well disable them' \
      -e 's:^ifneq "$(wildcard /usr/src/.*$:ifneq "ArchLinux" "ArchLinux":g' \
      -e '# We can force this one true' \
      -e 's:^ifneq "$(wildcard /usr/lib/.*$:ifneq "ArchLinux" "0":g' \
    -i 'Makefile'

  #cp -p 'install.sh' 'install.sh.Arch' # testmode for diff comparison
  sed -e '# Fix some paths' \
      -e 's: /lib/: /usr/lib/:g' \
      -e 's: /sbin: /usr/bin:g' \
      -e 's:"/sbin:"/usr/bin:g' \
      -e 's:/usr/sbin:/usr/bin:g' \
      -e 's:/usr/local/man:/usr/share/man:g' \
      -e '# I suspect this folder for systemd is wrong even on RedHat' \
      -e 's:/etc/systemd/system:/usr/lib/systemd/system:g' \
      -e '# make package compatible' \
      -e 's:"/etc/:"${DESTDIR}/etc/:g' \
      -e 's: /etc/: "${DESTDIR}"/etc/:g' \
      -e 's:"/usr/:"${DESTDIR}/usr/:g' \
      -e 's: /usr/: "${DESTDIR}"/usr/:g' \
      -e '# Disable module management and message' \
      -e 's:^\s\+echo\s-n\s"Rebuilding:# &:g' \
      -e 's:^.*depmod -a:# &:g' \
      -e '# Disable systemd management' \
      -e 's:^\s\+systemctl:# &:g' \
      -e '# Get rid of the start messages lest someone believes them' \
      -e 's:^\s\+if\s\[\s"$WillStart"\s=\syes\s\]:return\n&:g' \
    -i 'install.sh'
  if [ -s 'install.sh.Arch' ]; then
    echo 'Disable testmode to build'
    set +u
    false
  fi

  # Switch to python2
  sed -e '# Why using local on just this one?' \
      -e 's:/usr/local/bin/python:/usr/bin/python:g' \
      -e 's:/usr/bin/python:&2:g' \
    -i *.py 'nslinktool'

  # The command line tool is unusable without the proper ethernet card in it.
  # There's a parameter but who would know! We'll add a searchable string
  # that a launcher can modify.
  sed -e 's:"eth0":"'"${_opt_ethernet_data}${_opt_ethernet_keystring}"'":g' -i 'nslinkadmin.c'

  # nslinktool has the same problem but it's a GUI app. The best we can
  # do is start with the right network card. It really needs to become
  # a dropdown.
  local _neweth
  local _neweths=($(ip addr | grep ' UP ' | cut -d':' -f2))
  if [ "${#_neweths[@]}" -ne 0 ]; then
    _neweth="s:eth0:${_neweths[0]}:g"
  else
    _neweth='#'
  fi

  # Fix nslinktool. We'll get rid of the tabs while we're here.
  cp -p 'nslinktool' 'nslinktool.orig'
  sed -e '# Fix paths and enable our fixed admin tool:g' \
      -e 's:/usr/sbin/nslinkadmin:/usr/bin/nslinkadmin.exec:g' \
      -e 's:/usr/local/man:/usr/share/man:g' \
      -e '# Cosmetic cleanup for simpler patch editing' \
      -e 's:\s\+$::g' \
      -e '# Ethernet fix from above' \
      -e "${_neweth}" \
    'nslinktool.orig' | expand -i > 'nslinktool'
  rm 'nslinktool.orig'
  unset _neweth _neweths

  # Patch systemd code into the GUI tool
  #diff -pNau5 nslinktool{.orig,} > '../nslinktool.systemd.patch'
  patch -Nbup0 < "${srcdir}/nslinktool.systemd.patch"

  # Convert the live config entries to samples. This eliminates
  # special handling for detecting a blank configuration.
  sed -e 's:^:#&:g' -i 'nslink.conf'

  #diff -pNau5 nslink.c{.orig,} > '../nslink-patch-signal_pending-kernel-4-11.patch'
  patch -Nbup0 < "${srcdir}/nslink-patch-signal_pending-kernel-4-11.patch"

  # Fix up the firmware downloaders
  cd "${srcdir}/${_srcdir2}"

  # Fix permissions
  find -type 'f' -perm '/111' -exec chmod 644 '{}' '+'
  chmod 755 *.py

  sed -e '# Cosmetic cleanup for simpler patch editing' \
      -e 's:\s\+$::g' \
      -e '# Switch to python2' \
      -e 's:/usr/bin/python:&2:g' \
    -i *.py

  # Patch usage and help into command line tool
  #diff -pNau5 dmupdate.py{.orig,} > '../dmupdate.py.usage.patch'
  patch -Nbup0 < "${srcdir}/dmupdate.py.usage.patch"

  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s -j1 QUIET=0
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  if [ "${_opt_DKMS}" -eq 0 ]; then
    # I don't want Linux version info showing on AUR web. After a few months 'linux<0.0.0' makes it look like an out of date package.
    local _kernelversionsmall="$(uname -r)"
    _kernelversionsmall="${_kernelversionsmall%%-*}"
    if [ "${_kernelversionsmall%\.0\.0}" != "${_kernelversionsmall}" ]; then # trim 4.0.0 -> 4.0
      _kernelversionsmall="${_kernelversionsmall%\.0}"
    fi
    # prevent the mksrcinfo bash emulator from getting these vars!
    eval 'conf''licts=("linux>${_kernelversionsmall}" "linux<${_kernelversionsmall}")'
    eval 'dep''ends+=("linux=${_kernelversionsmall}")'
  fi

  # This installer expects the system folders to already exist
  install -dm755 "${pkgdir}"{'/usr/bin','/etc',"/usr/lib/modules/$(uname -r)/misc",'/usr/lib/systemd/system'}

  DESTDIR="${pkgdir}" \
  INIT='systemd' \
  sh -e -u 'install.sh' "$(uname -r)" install

  # Fix paths in the service file
  sed -e 's:/sbin/:/usr/bin/:g' -i "${pkgdir}/usr/lib/systemd/system/nslink.service"

  # Root only permissions on executables. Easier than hacking UID 0 into them.
  find "${pkgdir}/usr/bin/" -type 'f' -perm /111 -exec chmod 744 '{}' '+'

  # Preserve an original copy of the config file
  install -Dpm644 "${pkgdir}/etc/nslink.conf" "${pkgdir}/usr/share/nslink/nslink.conf.orig"

  # Desktop file for NS-Link
  install -Dm644 <(cat << EOF
[Desktop Entry]
Name=Comtrol NS-Link Administration
GenericName=Device Server Manager
Comment=DeviceMaster NS-Link for Comtrol Device Servers
Exec=gksudo -k -u root nslinktool
Terminal=false
Type=Application
#Icon=
Categories=Application;Utilities;
MimeType=application/x-executable
EOF
  ) "${pkgdir}/usr/share/applications/nslinktool.desktop"

  # Generate launcher
  mv "${pkgdir}/usr/bin"/{'nslinkadmin','nslinkadmin.exec'}
  install -Dm755 <(cat << EOF
#!/bin/bash
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

# A launcher to detect UP ethernet interfaces and sed the selected on into a temp executable.
# The executable has been compiled with a special string that we can replace.

set -e
set -u

neweths=(\$(ip addr | grep ' UP ' | cut -d':' -f2))

DEBUG=0
if [ "\${DEBUG}" -ne 0 ]; then
  if [ "\${EUID}" -eq 0 ]; then
    echo 'Must not be root'
    exit 1
  fi
  adminbin='./nslinkadmin.exec'
  admintmp="\${adminbin}.tmp"
  cp -pn "\${adminbin}" "\${adminbin}.bak"
  neweths+=(Arch Linux)
else
  if [ "\${EUID}" -ne 0 ]; then
    echo 'Must be root'
    exit 1
  fi
  adminbin='/usr/bin/nslinkadmin.exec'
  admintmp="/tmp/nslinkadmin.tmp.\$$"
fi

case "\${#neweths[@]}" in
0)
  echo 'No network cards are available in the UP state. Try ip addr'
  exit 2
  ;;
1)
  neweth="\${neweths[0]}"
  #echo "Auto selecting only NIC \${neweth}" # The next program shows this so we don't need to.
  ;;
*)
  echo 'Available UP network cards'
  idx=0
  for neweth in "\${neweths[@]}"; do
    idx=\$((idx+1))
    echo -n "\${idx}-\${neweth}  "
  done
  echo ''
  wantidx=-1
  while [ "\${wantidx}" -lt 0 ]; do
    echo -n "Select network card or 0 to quit:"
    read wantidx
    if [ -z "\${wantidx}" ] || [[ ! "\${wantidx}" =~ ^[0-9]+$ ]] || [ "\${wantidx}" -lt 0 ] || [ "\${wantidx}" -gt "\${idx}" ]; then
      wantidx=-1
    fi
    if [ "\${wantidx}" -eq 0 ]; then
      exit 0
    fi
  done
  neweth="\${neweths[\$((wantidx-1))]}"
esac

if [ "\${DEBUG}" -ne 0 ]; then
  set -x
fi

# These values are compiled into the executable by the PKGBUILD and must not be changed here
neweth="\$(printf "%-${#_opt_ethernet_data}s" "\${neweth}")"
neweth="\${neweth// /\\\\x00}" # binary replace

set +e
(
umask 077
rm -f "\${admintmp}"
sed -e 's:${_opt_ethernet_data}${_opt_ethernet_keystring}:'"\${neweth}${_opt_ethernet_keystring}:" "\${adminbin}" > "\${admintmp}"
)
chmod 700 "\${admintmp}"

rv=0
if [ "\${DEBUG}" -eq 0 ] || [ "\$(stat -c '%s' "\${adminbin}")" -eq "\$(stat -c '%s' "\${adminbin}.bak")" ]; then
  trap "{ rm -f "\${admintmp}"; exit 255; }" SIGINT
  set +e
  "\${admintmp}" "\$@"
  rv="\$?"
  if [ "\${DEBUG}" -eq 0 ]; then
    rm "\${admintmp}"
  fi
fi
exit "\${rv}"
EOF
  ) "${pkgdir}/usr/bin/nslinkadmin"

  # DKMS
  if [ "${_opt_DKMS}" -ne 0 ]; then
    rm -rf "${pkgdir}/usr/lib/modules/"
    local _dkms="${pkgdir}/usr/src/${pkgname}-${pkgver}"
    #install -d "${_dkms}"
    install -Dpm644 'nslink.h' 'nslink_int.h' 'version.h' 'nslink.c' 'Makefile' -t "${_dkms}/"
    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

PACKAGE_NAME="${pkgname}"
PACKAGE_VERSION="${pkgver}"
AUTOINSTALL="yes"

BUILT_MODULE_NAME[0]="nslink"
BUILT_MODULE_LOCATION[0]=""
# Using all processors doesn't compile this tiny module any faster.
MAKE[0]="make -j1 all QUIET=1"
CLEAN[0]="make -j1 clean"
# Placing the DKMS generated module in a different location than the standard install prevents conflicts when PKGBUILD _opt_DKMS is toggled
DEST_MODULE_LOCATION[0]="/kernel/drivers/misc"
EOF
    ) "${_dkms}/dkms.conf"
    #make -C "${_dkms}/" clean
    sed -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple' \
        -e 's:$(shell uname -r):$(KERNELRELEASE):g' \
        -e 's:`uname -r`:$(KERNELRELEASE):g' \
        -e 's:$(KVER):$(KERNELRELEASE):g' \
        -e '# Get rid of make lines so make all makes the module' \
        -e 's:^\s\+make\s:#&:g' \
       -i "${_dkms}/Makefile"
  fi

  # Install firmware updaters
  cd "${srcdir}/${_srcdir2}"
  install -Dpm755 *.py -t "${pkgdir}/usr/bin/"
  install -Dpm644 'README.txt' -t "${pkgdir}/usr/share/nslink/"

  # Desktop file for GUI firmware updater
  install -Dm644 <(cat << EOF
[Desktop Entry]
Name=Comtrol Update Firmware
GenericName=Device Server Manager
Comment=Manage Firmware on Comtrol Device Servers
Exec=DM-Firmware-Updater.py
Terminal=false
Type=Application
#Icon=
Categories=Application;Utilities;
MimeType=application/x-executable
EOF
  ) "${pkgdir}/usr/share/applications/DM-Firmware-Updater.py.desktop"
  set +u
}

set +u
