# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

_opt_DKMS=1            # This can be toggled between installs
_opt_defaultmode='660' # default: 620

# Todo: Test secure mode

# Todo: python tools should be updated to python3
# Todo: nslinktool Config Driver needs an up down button to reorder entries
# Todo: TUI firmware updater.
# Todo: Firmware updater can't update unit set to DHCP.
# Todo: Firmware updater errors out on old versions: Expected to connect to bootloader after reboot but found DeviceMaster Boot Version 1.20
# Todo: Comtrol icons for nslinktool and the firmware updater
# Todo: nslinktool set the mouse pointer to a spinning circle far too long after startup
# Todo: rm /dev/ttySI* on rmmod nslink
# Todo: When characters are held by RTS low, opening ttySI* raises RTS too soon and some characters are lost

# Todo: nslinktool, HUB IP Admin, [Get] with SocketServer, error getting IP info, did not get ip6info reply

# Uninstall cleanup: sudo rm -f /etc/nslink.conf*

# Configure with the NS-Link Manager GUI, Config Driver
# Ports are /dev/ttySI0 through /dev/ttySI31

set -u
pkgname='nslink'
pkgver='8.00'
pkgrel='6'
pkgdesc='tty driver and firmware update for Comtrol DeviceMaster, RTS, LT, PRO, 500, UP, RPSH-SI, RPSH, and Serial port Hub console terminal device server'
# UP is not explicitly supported by NS-Link, only by the firmware updater.
_pkgdescshort="Comtrol DeviceMaster ${pkgname} TTY driver"
arch=('i686' 'x86_64')
url='http://www.comtrol.com/'
license=('GPL')
depends=('glibc' 'openssl' 'python3' 'sed' 'groff' 'tcl' 'tk' 'util-linux') # python is also needed for the firmware updater
optdepends=(
  'gksu: NS-Link Manager GUI'
)
backup=('etc/nslink.conf')
options=('!zipman' '!strip')
install="${pkgname}-install.sh"
_verwatch=('http://downloads.comtrol.com/html/DM_PRO_RTS_SERIALHUB_drivers.htm' '.*/devicemaster-linux-\([0-9\.]\+\)\.tar\.gz' 'l')
_srcdir="devicemaster-linux-${pkgver}"
_srcdir2='DM-Firmware-Updater-1.06' # http://downloads.comtrol.com/html/DM_PRO_RTS_SERIALHUB_pvdx2.htm
source=(
  #"ftp://ftp.comtrol.com/dev_mstr/rts/drivers/linux/devicemaster-linux-${pkgver}.tar.gz"
  "https://downloads.comtrol.com/dev_mstr/rts/drivers/linux/devicemaster-linux-${pkgver}.tar.gz"
  #'ftp://ftp.comtrol.com/dev_mstr/rts/utility/linux_firmware_uploader/DM-Firmware-Updater-1.06.tar.gz'
  'https://downloads.comtrol.com/dev_mstr/rts/utility/linux_firmware_uploader/DM-Firmware-Updater-1.06.tar.gz'
  'dmupdate.py.usage.patch'
  '0002-kernel-5.6-proc_dir_entry-proc_ops.patch'
  '0003-tty_unregister_driver-void.patch'
  '0004-kernel-5.12-tty-low_latency.patch'
  '0005-kernel-5.14-unsigned-tty-flow-tty.patch'
  '0006-kernel-5.15-alloc_tty_driver-put_tty_driver.patch'
  '0007-service-priority.patch'
  '0008-python3-firmware.patch'
  '0009-python3-nslink.patch'
  '0010-kernel-6.1-TTY_DRIVER_MAGIC-remove-dead-code.patch'
  '0011-kernel-6.0-set_termios-const-ktermios.patch'
)
md5sums=('b59906d80268e69a24c211b398ffd10c'
         'e3ffb36acfdd321c919e44d477f0774a'
         '581cd5f582ed20c7cf85a4df23a9f78a'
         '36fcfa504772df4aabbde9f23d5459d5'
         '7e0659716e30c6e2ff5c16f20aac07be'
         '4e0c61dc0c5da4c3125db7ac1e481aac'
         '93e85c98fd375285887b78f2df44ce01'
         'f85645dfe886b57273b475d3c6cd0964'
         'e5692035f047cdec52658f67954c6f4d'
         '8c329cf0f9c90cfd07ba86a4027eec48'
         'e21d8211b2f209ace648340cb5583805'
         '2774e3aa64717a7613e96fd86f649ea1'
         '98788ff1378604e9fda43eb6ef9e9e3d')
sha256sums=('092859a3c198f8e3f5083a752eab0af74ef71dce59ed503d120792be13cc5fa3'
            'd21c5eeefdbf08a202a230454f0bf702221686ba3e663eb41852719bb20b75fb'
            '5a4e2713a8d1fe0eebd94fc843839ce5daa647f9fa7d88f62507e660ae111073'
            'cbaa55f16357688b992a7d7c0f2fb56225edda286d97595918c50e05005d1318'
            '7b7718789a4a23c3f16094f93b9fc0d8a5915e67e6a0aedef17cdb6adb22a1ac'
            'a48cdf948f907b00919c3a2dadbaa2c41c28891d689195e072765c39b0b4af49'
            '12c55d7b898b5cdcd09d6927fef1585a702fde356e8e039e7e85bbce64f3eed8'
            '364a4fb9d8695067ee8d235d7763c59f6df417937b901a1810e00d397db21aee'
            'bfa34783131c52e0bc0645c76469aaf504b13ac16d57b02d5ea9002603fb583e'
            '1353bc403b56ef0b00f4b87826991812ee24bcc9a0b2612c0027317a7aa86736'
            'a84e1a9884580917afe55816b4ec9b44ec0f4977144e7f4325647ff58642ecd6'
            '2b909997f0662ae9a49463be4c1ef2af718882924071e0d74b9c04d9d1198691'
            '7f181d1542b542989b319caf85621725389d7681cf2d5c3bb57dc774d14f1b76')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

prepare() {
  set -u
  cd "${_srcdir}"

  # Fix permissions
  find -type 'f' -perm '/111' -exec chmod 644 '{}' '+'
  chmod 755 *.sh *.py 'nslinktool'

  # Version check
  local _ver
  _ver="$(sed -n -e 's:^#define\sSI_VERSION\s"\([^"]\+\).*$:\1:p' 'version.h')"
  if [ "${pkgver}" != "${_ver}" ]; then
    echo "Version mismatch ${pkgver} != ${_ver}"
    set +u
    false
  fi
  unset _ver

  #cp -p nslink.c{,.orig}; false
  #diff -pNau5 nslink.c{.orig,} > '0002-kernel-5.6-proc_dir_entry-proc_ops.patch'
  #patch -Nup0 -i "${srcdir}/0002-kernel-5.6-proc_dir_entry-proc_ops.patch"

  #cp -p nslink.c{,.orig}; false
  #diff -pNau5 nslink.c{.orig,} > '0003-tty_unregister_driver-void.patch'
  patch -Nup0 -i "${srcdir}/0003-tty_unregister_driver-void.patch"

  #cp -p nslink.c{,.orig}; false
  #diff -pNau5 nslink.c{.orig,} > '0004-kernel-5.12-tty-low_latency.patch'
  patch -Nup0 -i "${srcdir}/0004-kernel-5.12-tty-low_latency.patch"

  # tty.stopped https://lore.kernel.org/lkml/20210505091928.22010-13-jslaby@suse.cz/
  # unsigned write_room https://www.spinics.net/lists/linux-serial/msg42297.html
  # unsigned chars_in_buffer https://www.spinics.net/lists/linux-serial/msg42299.html
  #cp -p nslink.c{,.orig}; false
  #diff -pNau5 nslink.c{.orig,} > '0005-kernel-5.14-unsigned-tty-flow-tty.patch'
  patch -Nup0 -i "${srcdir}/0005-kernel-5.14-unsigned-tty-flow-tty.patch"

  # http://lkml.iu.edu/hypermail/linux/kernel/2107.2/08799.html [PATCH 5/8] tty: drop alloc_tty_driver
  # http://lkml.iu.edu/hypermail/linux/kernel/2107.2/08801.html [PATCH 7/8] tty: drop put_tty_driver
  #rm -f *.orig; cp -p nslink.c{,.orig}; false
  #diff -pNau5 nslink.c{.orig,} > '0006-kernel-5.15-alloc_tty_driver-put_tty_driver.patch'
  patch -Nup0 -i "${srcdir}/0006-kernel-5.15-alloc_tty_driver-put_tty_driver.patch"

  #rm -f *.orig; cp -p nslink.service{,.orig}; false
  #diff -pNau5 nslink.service{.orig,} > '0007-service-priority.patch'
  #patch -Nup0 -i "${srcdir}/0007-service-priority.patch"

  #rm -f *.orig; cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0007-service-priority.patch'
  patch -Nup1 -i "${srcdir}/0007-service-priority.patch"

  #rm -f *.orig; cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0009-python3-nslink.patch'
  patch -Nup1 -i "${srcdir}/0009-python3-nslink.patch"

  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0010-kernel-6.1-TTY_DRIVER_MAGIC-remove-dead-code.patch'
  patch -Nup1 -i "${srcdir}/0010-kernel-6.1-TTY_DRIVER_MAGIC-remove-dead-code.patch"

  # https://lore.kernel.org/linux-arm-kernel/20220816115739.10928-9-ilpo.jarvinen@linux.intel.com/T/
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0011-kernel-6.0-set_termios-const-ktermios.patch'
  patch -Nup1 -i "${srcdir}/0011-kernel-6.0-set_termios-const-ktermios.patch"

  # Make package compatible
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
  test ! -s 'install.sh.Arch' || echo "${}"

  # Fix /var/run
  sed -e 's:/var/run/:/run/:g' -i 'nslink.service'

  # Switch to python2
  sed -e '# Why using local on just this one?' \
      -e '#s:/usr/local/bin/python:/usr/bin/python:g' \
      -e '#s:/usr/bin/python:&2:g' \
    -i *.py 'nslinktool'

  # Branding in dmesg
  sed -e '/^int nrp_init(/,/^}/ s:version %s %s:& Arch Linux:g' -i 'nslink.c'
  grep -qFe 'Arch Linux' 'nslink.c' || echo "${}"

  # Fix nslinktool. We'll get rid of the tabs while we're here.
  expand -i 'nslinktool' | sed -e 's:\s\+$::g' > 'nslinktool.orig'
  sed -e 's:/usr/local/man:/usr/share/man:g' 'nslinktool.orig' > 'nslinktool'
  rm 'nslinktool.orig'

  # Convert the live config entries to samples. This eliminates
  # special handling for detecting a blank configuration.
  sed -e 's:^[^#]:#&:g' -i 'nslink.conf'

  # Fix makefile
  sed -e 's:=/lib/modules:=/usr/lib/modules:g' \
      -e '# Switch SUBDIRS= to M= for Kernel 5.4' \
      -e 's:SUBDIRS=:M=:g' \
    -i 'Makefile'

  # Correct group and chmod for serial
  sed -e '/getgrnam/ s:"tty":"uucp":g' \
      -e '# This method results in 666' \
      -e '#s:\(mode_t mode\) = [0-9]\+\(.*;\)'":\1 = ${_opt_defaultmode}\2:g" \
      -e "/mknod/ s:mode:0${_opt_defaultmode}:g" \
    -i 'nslinkd.c'

  # Fix up the firmware downloaders
  cd "${srcdir}/${_srcdir2}"

  # Fix permissions
  find -type 'f' -perm '/111' -exec chmod 644 '{}' '+'
  chmod 755 *.py

  sed -e '# Cosmetic cleanup for simpler patch editing, trim space at eol' \
      -e 's:\s\+$::g' \
      -e '# Switch to python2' \
      -e '#s:/usr/bin/python:&2:g' \
    -i *.py

  #rm -f *.orig; cd '..'; cp -pr 'DM-Firmware-Updater-1.06' 'a'; ln -s 'DM-Firmware-Updater-1.06' 'b'; false
  #diff -pNaru5 'a' 'b' > '0008-python3-firmware.patch'
  patch -Nup1 -i "${srcdir}/0008-python3-firmware.patch"

  # Patch usage and help into command line tool
  #diff -pNau5 dmupdate.py{.orig,} > '../dmupdate.py.usage.patch'
  patch -Nup0 -i "${srcdir}/dmupdate.py.usage.patch"
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  set +u
  if ! make -s -j1 QUIET=0; then
    warning 'a no such file or directory error means you need to reboot to load the updated kernel'
    false
  fi
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

  # This installer expects the system folders to already exist
  install -dm755 "${pkgdir}"{'/usr/bin','/etc',"/usr/lib/modules/$(uname -r)/misc",'/usr/lib/systemd/system'}

  DESTDIR="${pkgdir}" \
  INIT='systemd' \
  sh -e -u 'install.sh' "$(uname -r)" install | \
  sed -e "s:${pkgdir}::g" # cleaner display

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

  # DKMS
  if [ "${_opt_DKMS}" -ne 0 ]; then
    rm -r "${pkgdir}/usr/lib/modules/"
    local _dkms="${pkgdir}/usr/src/${pkgname}-${pkgver}"
    #install -d "${_dkms}"

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
    install -Dpm644 'nslink.h' 'nslink_int.h' 'version.h' 'nslink.c' 'Makefile' -t "${_dkms}"
    #make -C "${_dkms}" clean
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
