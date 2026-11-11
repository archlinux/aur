# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

_opt_AutoRestart=1    # 0=only restart manually with needrestart or on reboot; 1=automatically restart asap
_opt_DKMS=1           # This can be toggled between installs
_opt_MAXINSTPORTS=16  # Maximum install ports.
                      # Default=256 which is plenty for normal size installations.
                      # It's best to use a small number. Nodes are created for
                      # /dev/ttyADV{0..n-1}
#_opt_defaultmode='666' # default: 666

#export KERNELRELEASE="$(basename $(dirname /usr/lib/modules/6.12.*/vmlinuz))"

# Products, Intelligent Connectivity, Industrial Communication, Serial Device Servers

# Todo: misspellings all over
# Todo: what does vcinot do?
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
pkgname='advantech-vcom'
#pkgver='2.0.0'; _dl='4/1-X92NP4'; _dt='.tar.bz2'
#pkgver='2.1.0'; _dl='4/1-15OSOW4'; _dt='.tar.bz2'
#pkgver='2.2.0'; _dl='4/1-1LPJPGD'; _dt='.tar.bz2' # also .rar
#pkgver='2.2.1'; _dl='5/1-1NOKMCV'; _dt='.rar' # also .rar' # not compatible with Linux 3.16, a RAR file
#pkgver='2.2.3'; _dl='5/1-1Y9Q0Z6'; _dt='.tar.bz2'
#pkgver='2.2.5'; _dl='4/1-23X5L51'; _dt='.tar.bz2'
#pkgver='2.3.0'; _dl='3/1-250ZNM3'; _dt='.tar.bz2'
#pkgver='2.3.4'; _dl='2/1-2HNI41Q'; _dt='.zip'
#pkgver='2.3.5'; _dl='4/1-2LHR0GS'; _dt='.zip'
pkgver='2.3.7'; _dl='3/1-33684SV'; _dt='.tar.gz'
pkgrel='1'
pkgdesc='tty driver for Advantech Adam EKI serial console terminal servers'
_pkgdescshort="Advantech ${pkgname} TTY driver"
arch=('i686' 'x86_64')
url='https://www.advantech.com/intelligent-connectivity/' # Serial Device Servers
license=('GPL')
depends=('glibc' 'gawk' 'psmisc' 'sed' 'grep')
backup=('etc/advttyd.conf')
install="${pkgname}-install.sh"
_srcdir="Advantech-VCOM-Linux-Driver-${pkgver}${_dt}"
#_srcdir="vcom_linux_${pkgver}${_dt}"
#_srcdir="${_srcdir,,}"
source=("${_srcdir}::https://advdownload.advantech.com/productfile/Downloadfile${_dl}/${_srcdir}")
if [ "${_dt}" = '.rar' ]; then
  _srcrar="${_srcdir}"
  noextract=("${_srcrar}") # the RAR crashes bsdtar. Parsing filters is unsupported.
  makedepends+=('unrar')
fi
#source=("${_srcdir,,}::http://downloadt.advantech.com/download/downloadsr.aspx?File_Id=${_dl}") # redirect works sooner but can be changed arbitrairly
_srcdir="${_srcdir%${_dt}}"
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
  '0007-gcc-15-header-guard-advioctl.h.patch'
  '0008-gcc-15-header-guard-vc_client_idle.h.patch'
)
md5sums=('de0a303cf5ee91fa332453438d73f034'
         '280829daaad2bacd9e3b5fa2d042e552'
         '8d257b4058171502e0934a08123eb52c'
         '787c718e31b43d5dd8959f5eb5fe7e57'
         '4416b57cf4165a3bb78cc06400e89985'
         'e57019da1f9a394fd34c930385ac5bbd'
         'fd77eb9272ef5f21248efa91f276d313'
         '4907379f95d10846734eed0b071ba511'
         '2cf8ab9c5541c38eba5fb9687142d94d'
         '709e2f632a8d47aeaad1a22c80b623dd'
         '32f3a081b5926d6ea7f1cd2a22655d95'
         'b005fdd5de28f835b7b37ecd74453785'
         '68bb1995832eb06644da4bf390a11f48'
         'b846716607ccc827428c6bbc9401f997')
sha256sums=('5b68bf08b9f15fb742f4a9cbf83507551c509393cd3723f4ff8783f21aa4f1e5'
            'be9a013d65949cfae67d05cd8b7ca56937c21e76f8ecffd0626c75449eeeeea6'
            'de6a248a063b26dc43ec29283b868c656531fa5e6fa369cb47247fb776c66d0d'
            '810f98783ae50f053ff66dea01ab9289d82690be8959ddf6fb33ea37be38acc0'
            '140b51124cd0c154f971201bf57a1705abc8a2524c82131639d2a985b8d1fcce'
            '554b9840d9e23fe18fc595f01181df28c141f3b4419c82c5f3e294b9b1a5946e'
            '79746e296db2d2609f594c2a1209b4d7c957e7b8e52526a7f164e883b8009320'
            'ab25f8ccbf8383891bdafdd6bbe421d621f21c72c870c93df2b77a73550aea23'
            'de3477551219d9fc5b1924775a4456155ef5beb5bd702fbc114ca0c956607953'
            '26f29ab86677f9a764d2284d1b8d9e7825e3408d7e18d145c6a1981d513bd119'
            'b65adbcbb83a21cf0a1c17b9bc2a039ad5c633021ecd90d88d5d978a03a59c23'
            '99b7b7a2c84d8b82a3e79b2a7abe99d1696a7ff3df350560d96ce7f049e8cb27'
            'c0dbdc448f9b0a394835616588d8306b638597dce48274919aa9fa26dbd802e4'
            'c5484c827722352cfb9097bf2eadb487eb99cdfc51e7bff3b6e74046361abee7')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

#if [ "${pkgver}" = '2.3.0' ] || [ "${pkgver}" = '2.3.4' ]; then
#  _altver='2.2.5'; _altdl='4/1-23X5L51'
#  _altdir="VCOM_LINUX_${_altver}.TAR.BZ2"
#  _altdir="${_altdir,,}"
#  source+=("${_altdir}::https://advdownload.advantech.com/productfile/Downloadfile${_altdl}/${_altdir}")
#  _altdir="${_altdir%\.tar*}"
#fi

prepare() {
  local -; set -u

  if [ ! -z "${_srcrar:-}" ]; then
    unrar x "${_srcrar}"
  fi

  if [ ! -z "${_altdir:-}" ]; then
    rm -rf "${_srcdir}/initd"
    cp -pr "${_altdir}/initd" "${_srcdir}"
  fi

  cd "${_srcdir}"

  local _patches=()
  if [ "$(vercmp "${pkgver}" "2.2.1")" -le 0 ]; then
    if [ "${pkgver}" = '2.2.1' ]; then
      _patches+=('0000-advman.systemd.patch') # Change original advman to systemd
    fi
    _patches+=('0001-adv_main-access_ok_kernel-5-0.patch')
    _patches+=('0002-adv_mmap-vm_fault_t-5-1.patch')
  fi
  if [ "$(vercmp "${pkgver}" "2.2.5")" -le 0 ]; then
    if [ "${pkgver}" = '2.2.5' ]; then
      _patches+=('0000b-advman.systemd.patch')
    fi
    _patches+=('0003-gcc-10-duplicate-variables-vc_mon-stk_mon.patch')
  elif [ "$(vercmp "${pkgver}" "2.3.0")" -le 0 ]; then
    _patches+=('0003a-gcc-10-duplicate-variables-vc_mon-stk_mon.patch')
  fi
  if [ "$(vercmp "${pkgver}" "2.2.3")" -le 0 ]; then
    if [ "${pkgver}" = '2.2.3' ]; then
      _patches+=('0000a-advman.systemd.patch')
    fi
    _patches+=('0004-adv_main-proc_create_data-kernel-5.6.patch')
  fi

  if [ "$(vercmp "${pkgver}" "2.3.0")" -le 0 ]; then
    if [ "${pkgver}" = '2.3.0' ]; then
      _patches+=('0000c-advman.systemd.patch')
    fi
    _patches+=('0005-kernel-5.17-change-PDE_DATA.patch')
    _patches+=('0006-kernel-6.0-set_termios-const-ktermios.patch')
  fi

  if [ "$(vercmp "${pkgver}" "2.3.4")" -ge 0 ]; then
    _patches+=('0007-gcc-15-header-guard-advioctl.h.patch')
    _patches+=('0008-gcc-15-header-guard-vc_client_idle.h.patch')
  fi

  local _pt _ptf=() _pts=()
  for _pt in "${_patches[@]}"; do
    set +u; msg2 "Patch ${_pt}"; set -u
    if patch -Nup1 --no-backup-if-mismatch -i "${srcdir}/${_pt}"; then
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
  #diff -pNaru5 'a' 'b' > "0000-$RANDOM.patch"
  #diff -pNaru10 'a' 'b' > "0000-$RANDOM.patch"

  # Cosmetic correction of CRLF for Linux
  sed -e 's:\r$::g' -i 'readme.txt'

  local _seds=()
  # Fix umbrella Makefile
  #cp -p Makefile{,.Arch}
  _seds=(
    -e '# Cosmetic correction of spaces'
    -e 's:\s\+$::g'
    -e '# Make package compatible'
    -e '/ln -s/ ! s:$(INSTALL_PATH):$(DESTDIR)/&:g'
    -e '# fix paths and more for package'
    -e 's: /sbin/: $(DESTDIR)/usr/bin/:g'
    -e '# Dont want the Makefile. Probably there for uninstall'
    -e 's:^\s\+cp ./Makefile:#&:g'
    -e '# Move config to /etc'
    -e '/advttyd.conf/ s:\$(INSTALL_PATH):etc/:g'
  )
  sed "${_seds[@]}" -i 'Makefile'
  test ! -s 'Makefile.Arch' || echo "${}"

  # Fix driver Makefile
  #cp -p 'driver/Makefile'{,.Arch}
  _seds=(
    -e '# Cosmetic correction of spaces'
    -e 's:\s\+$::g'
    -e '# Clean missed some files'
    -e 's:^\s\+rm -.*$:& *.order *.symvers:g'
    -e '# Adding the current dir (.) to the include path seems unnecessary'
    -e 's:^ccflags-y += -I:#&:g'
    -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple'
    -e 's:$(shell uname -r):$(KERNELRELEASE):g'
    -e 's:`uname -r`:$(KERNELRELEASE):g'
    -e '# DKMS sets KERNELRELEASE which accidentally launches phase 2 of this Makefile'
    -e '# Fix by changing the detection var.'
    -e 's:^ifneq ($(KERNELRELEASE),):ifneq ($(ARCHLINUX),):g'
    -e '# Put the detection var in'
    -e 's:^\s\+\$(MAKE)\s-C\s\$(KERNELDIR):& ARCHLINUX=1:g'
    -e '1i KERNELRELEASE?=$(shell uname -r)'
  )
  sed "${_seds[@]}" -i 'driver/Makefile'
  test ! -s 'driver/Makefile.Arch' || echo "${}"

  # Fix the scripts
  local _f
  for _f in script/*; do
    local _lines='
set -u
'
    # Allow non root to run advls
    if [ "${_f}" != 'script/advls' ]; then
    _lines+='
if [ "${EUID}" -ne 0 ]; then
  echo "Must be root"
  exit 1
fi
'
    fi
    _seds=(
      -e '#Get rid of some UTF-8 quotes, even though they seem to work'
      -e "s:\xE2\x80\x9C:':g"
      -e "s:\xE2\x80\x9D:':g"
      -e '#Get rid of repeat hash bang'
      -e '2,$ s:#!/bin.*$::g'
      -e '# Catch misspellings that are code errors and root trap'
      -e "1 a\\${_lines//$'\n'/\\\n}" -e '# 2 i also works'
      -e '# misspelled variable, caught with set -u'
      -e 's:INSTALLPTATH:INSTALLPATH:g'
      -e '#Fix /usr/local'
      -e 's:/usr/local/:/usr/share/:g'
      -e '#Move config to /etc'
      -e 's:$INSTALLPATH/advttyd.conf:/etc/advttyd.conf:g'
      -e '#New for version 2.3.0'
      -e '/ -w / s:${INSTALLPATH}:/etc:g'
      -e '#Move sort tmp to secure location in /tmp'
      -e '/advttyd.tmp/ s:$INSTALLPATH/:/tmp/advmon/:g'
      -e '#Create secure tmp folder.'
      -e '/^cleanUp()/,/^}/ s:^sed :install -dm700 -oroot -groot "/tmp/advmon/"\nrm -f "/tmp/advmon/advttyd.tmp"\n&:g'
      -e '#Clean up code'
      -e 's:^HASARG=$:&0:g'
      -e '# The ADDRESS regex to match ipv4 and ipv6 is unnecessairly complex'
      -e "s:^ADDRESS='.*\$:ADDRESS='[^ ]+':g"
    )
    if [ "${_f}" = 'script/advls' ]; then
      _seds+=(
        -e '# Prevent samples from showing'
        -e 's:^PATERN="\$MINOR:PATERN="^$MINOR:g'
        -e '#Allow non root to run advls'
        -e 's:^cleanUp\s*$:if [ "${EUID}" -eq 0 ]; then\n  &\nfi:g'
      )
    fi
    #cp -p "${_f}"{,.Arch}
    sed "${_seds[@]}" -i "${_f}"
  done
  test ! -s 'script/advman.Arch' || echo "${}"
  # Fix daemon
  #cp -p initd/advttyd.c{,.Arch}
  _seds=(
    -e '#Move config to /etc'
    -e '/CF_CONFNAME/ s:work_path:"/etc":g'
    -e '#Move log to /var'
    -e '/CF_LOGNAME/ s:work_path:"/var/log":g'
  )
  #sed "${_seds[@]}" -i 'initd/advttyd.c'
  test ! -s 'initd/advttyd.c.Arch' || echo "${}"

  # Cosmetic correction of spaces
  sed -e 's:\s\+$::g' -i 'readme.txt' #script/* initd/adv* driver/adv* daemon/* inotify/* || :

  # Add device table to config
  sed -n -e '/Device-Type Table/,/install/ p' 'readme.txt' | \
    expand | head --lines=-1 | tail --lines=+2 | \
    sed -e 's:^:#:' -e 's:\(Device Name\) : \1:' >> 'config/advttyd.conf'

  # Convert the live config entries to samples. This eliminates
  # special handling for detecting a blank configuration.
  _seds=(
    -e 's:^[0-9]:# Sample  &:g'
    -e '/Minor/ s:^#:&00:g'
  )
  sed "${_seds[@]}" 'config/advttyd.conf' > 'config/advttyd.conf.Arch'
  cat <(tail +4 'config/advttyd.conf.Arch') <(head -3 'config/advttyd.conf.Arch') > 'config/advttyd.conf'
  rm 'config/advttyd.conf.Arch'

  # Make a less noisy start/stop to not clog up the systemd logs
  sed -e 's@^\(\s*\)echo@\1: # echo@g' 'script/advman' > 'script/advman.quiet'

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
}

build() {
  local -; set -u
  cd "${_srcdir}"
  make -j1
}

package() {
  local -; set -u
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

  # Generate amended install
  ln -sf '/tmp' "${startdir}/tmp"
  local _installnew="tmp/install-${USER}-${RANDOM}-${install}"
  bash -n "${startdir}/${install}" || echo "${}"
  rm -f "${startdir}/${_installnew}"
  cat - <<<"
# Do not modify this copy

_opt_DKMS='${_opt_DKMS}'
_opt_AutoRestart='${_opt_AutoRestart}'

" "${startdir}/${install}" > "${startdir}/${_installnew}"
  true && install="${_installnew}"
  bash -n "${startdir}/${install}" || echo "${}"

  if [ "${_opt_DKMS}" -ne 0 ]; then
    if [ "${_opt_AutoRestart}" -ne 0 ]; then
      # pacman hook to restart service after dkms rebuild
      install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Trigger]
Operation = Install
Operation = Upgrade
Type = Package
Target = ${pkgname}

[Action]
Description = ${pkgname}: restart service
When = PostTransaction
Exec = /usr/share/libalpm/scripts/restart-${pkgname}-dkms-service.sh
EOF
      ) "${pkgdir}/usr/share/libalpm/hooks/restart-${pkgname}-dkms-service.hook"
      install -Dm744 <(cat << EOF
#!/usr/bin/bash

# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

set -e
set -u

if [ "\${EUID}" -eq 0 ]; then
  if systemctl -q is-enabled 'advtty-vcom.service'; then
    systemctl restart 'advtty-vcom.service'
  fi
fi
EOF
      ) "${pkgdir}/usr/share/libalpm/scripts/restart-${pkgname}-dkms-service.sh"
      bash -n "${pkgdir}/usr/share/libalpm/scripts/restart-${pkgname}-dkms-service.sh" || echo "${}"
    fi

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
#CLEAN[0]="make -C 'driver' -j1 clean"
# Placing the DKMS generated module in a different location than the standard install prevents conflicts when PKGBUILD _opt_DKMS is toggled
DEST_MODULE_LOCATION[0]="/kernel/drivers/misc"
EOF
    ) "${_dkms}/dkms.conf"

    install -d "${_dkms}/driver/"
    cp -pr driver/* "${_dkms}/driver/"
    make -C "${_dkms}/driver/" clean
    rm "${_dkms}/driver/dkms.conf"
  fi
}

set +u
