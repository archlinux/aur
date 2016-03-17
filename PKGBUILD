#!/bin/false
# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Category: system

# Todo: add systemd getty support to drpadmin
# Todo: Fix autorebuild for multiple users with sudo chown
# Todo: Fix ttyaa-ttyaa text in drpadmin
# Digi bug: terminal freezes when viewing /proc/dgrp/mon

# Digi Realport driver for Arch Linux. See Digi release notes for supported products.

# Build instructions: (Skip these first two sections)

# This only applies if you installed a long time ago when this driver would still
# compile and haven't upgraded in a while. Now this can't be built on Arch without a
# patch so new users skip to the next section.

# This PKGBUILD does not clean up the slop from the Digi supplied make.
# If you have already installed according to the the instructions
# log on as root and go through the process in reverse from the original
# unmodified Digi tgz. You won't lose your configuration.
# make preuninstall; make uninstall
# To clean up you may want to remove the folders /share/ and /etc/init.d/
# Arch Linux does not use these folders though they may have spurious files from
# other misdirected installs.

# The next section: ... Now onto the real install ...

# Edit PKGBUILD.local after the first run
[ ! -s 'PKGBUILD.local' ] && cat > 'PKGBUILD.local' << EOF
# Set the mode for all created devices.
_opt_defaultmode="0600" # default: 0600
# If you need more granular control.
# See http://www.digi.com/support/kbase/kbaseresultdetl?id=3048
# Once set copy /etc/udev/rules.d/10-dgrp.rules to the PKGBUILD folder
# and it will be made into the package.

_opt_LocktoKernel=1 # Default 1
# 1=Automatic uninstall on every kernel upgrade. Use supplied AutoRebuild to reinstall on next login.
# 0=Allow kernel upgrades without removing dgrp. Use supplied AutoRebuild to update on next login.

# Digi's product name is inconsistent. Here you can choose. RealPort seems the most popular.
_opt_RealPort='RealPort' # Can also be Realport
EOF
source 'PKGBUILD.local'

# Recommended build command: makepkg -sCcfi

# Since the kernel module isn't loaded until you have a device
# configured, these services are automatically enabled and started
# for immediate hardware support. They will be reenabled each time the
# package is installed or upgraded.
# systemctl enable dgrp_daemon.service
# systemctl start dgrp_daemon.service
# systemctl enable dgrp_ditty.service
# systemctl start dgrp_ditty.service

# To stop these services from loading:
# systemctl disable dgrp_daemon.service
# systemctl stop dgrp_daemon.service
# systemctl disable dgrp_ditty.service
# systemctl stop dgrp_ditty.service

# To get started using your Digi products:
# man -Ik "Digi "
# man dgrp_gui
# man dgrp_cfg_node
# man ditty
# man drpadmin

# The man page for dgrp_cfg_node lacks some detail. See this page for more info
# ftp://digiftp.digi.com/support_archive/support/manuals/psts/rp-linux-conf-managing-portservers-with-dgrp-config-node.html

# To get your equipment up faster on servers that don't have X installed
# I've supplied a console shell script "drpadmin".
# It is adapted from Digi's RealPort "drpadmin" for Sun, HP UX, and SCO and has the same
# look and feel.

# For information about using dgrp_ditty.service to maintain your ditty settings
# across reboots see http://www.digi.com/support/kbase/kbaseresultdetl?id=904

# UnInstall cleanup:
# rm /etc/dgrp.backing.store* /usr/bin/dgrp/config/ditty.commands
# rmdir /usr/bin/dgrp/config
# rmdir /usr/bin/dgrp

set -u
pkgname='dgrp'
pkgver='1.9.36'
pkgrel='1'
pkgdesc="tty driver for Digi ${_opt_RealPort} Connect EtherLite Flex One CM PortServer IBM RAN"
#_pkgdescshort="Digi ${_opt_RealPort} driver for Ethernet serial servers" # For when we used to generate the autorebuild from here
arch=('i686' 'x86_64')
url='http://www.digi.com/'
license=('GPL' 'custom') # OpenSSL=Apache. Arch is always new enough to not need their version.
depends=('openssl' 'grep' 'awk' 'systemd')
optdepends=('tcl: Digi config manager in X' 'tk: Digi config manager in X')
makedepends=('linux-headers')
backup=('etc/dgrp.backing.store')
options=('!docs' '!emptydirs')
install="${pkgname}-install.sh"
_verwatch=('http://www.digi.com/support/includes/drivers.aspx?pid=2240&osvid=218' 'Realport Driver for Linux ver\. \([0-9\.]\+\), tgz version' 't')
source=("${pkgname}-${pkgver}-81000137_X.tgz::http://ftp1.digi.com/support/driver/81000137_X.tgz" 'drpadmin' 'drpadmin.1' "autorebuild-${pkgname}.sh")
sha256sums=('a6f39d6034960162a9df8cb979a76daa55559ceb9c4e24a68df74773374a78c0'
            '1ab0ccdc361760ae078f9b69f603e99b40849cdf97ad69bb028ad6af27012634'
            '66f8b106a052b4807513ace92978e5e6347cef08eee39e4b4ae31c60284cc0a3'
            '4d9ae1a36fe044f78c96358e13f8e0ed0dcd49ca056b67f3d6c7e5360408617e')

prepare() {
  set -u
  cd dgrp-*/
  rm -f daemon/openssl-*.tar.gz # I don't want their version to build if OpenSSL version detection fails in the future
  # Standardize name of RealPort
  sed -i -e "s/RealPort/${_opt_RealPort}/gI" $(grep -lrF $'RealPort\nRealport' .)
  # grep -ri realport . | grep -vF $'RealPort\nRealport'
  sed -i -e '# Cosmetic fix for gcc v5' \
         -e 's:\(3.9\*|4.\*\))$:\1|5.*):g' \
         -e "# I can't find any other way to fix the modules dir" \
         -e 's:/lib/modules/:/usr&:g' \
         -e '# Kill a harmless mkdir error. They mkdir the folder then dont use it.' \
         -e 's@^\(\s\+\)\(mkdir -p /usr/lib/modules/${osrel}/misc\)$@\1: #\2@g' \
    'configure'
  # Eradicate sbin before we even get started
  sed -i -e 's:/usr/sbin:/usr/bin:g' -e 's:/sbin/:/usr/bin/:g' 'configure' Makefile* */Makefile scripts/{preun,post}install
  # Fix the installers. We do in PKBGUILD what we can and the just a little in install.
  # cp -p 'scripts/postinstall' 'scripts/postinstall.Arch' # DEBUG for comparison
  sed -i -e '# Some security for root' \
         -e 's:^#!\s*/bin/sh$:&\nif [ "${EUID}" -ne 0 ]; then\n  echo "Must be root!"\n  exit 1\nfi:g' \
         -e '# Remove Install noise' \
         -e 's:^\(\s*\)\(echo "Running\):\1#\2:g' \
         -e '# Block the usage of chkconfig' \
         -e 's:/usr/bin/chkconfig:/usr/bin/true:g' \
         -e '# Remove noise for defunct chkconfig' \
         -e 's:^\(\s\+\)\(echo "Added\):\1#\2:g' \
         -e '# Automatically bring back pacsave file on reinstall' \
         -e 's:^if \[ -f /etc/dgrp:if [ -s "/etc/dgrp.backing.store.pacsave" -a ! -s "/etc/dgrp.backing.store" ]; then\n  mv "/etc/dgrp.backing.store.pacsave" "/etc/dgrp.backing.store"\nfi\n&:g' \
         -e '# No need to upgrade and back up a blank file' \
         -e 's:-f \(/etc/dgrp.backing.store\):-s \1:g' \
         -e '# Why depend on /tmp when we can use the /etc folder which is where admin will be looking to fix their non working hardware' \
         -e 's:/tmp/dgrp/dgrp.backing.store:/etc/dgrp.backing.store:g' \
         -e '# The rest is done in package.' \
         -e 's:^echo "Checking:exit 0\n&:g' \
         -e '# Prepare the links for package to use them' \
         -e 's:^\(\s\+\)ln -s /usr/bin/\([^ ]\+\) \(.\+\)$:\1ln -sf "\2" "${_DESTDIR}\3":g' \
         -e "# All that's left is config conversion" \
    'scripts/postinstall'
  #cp -p 'scripts/preuninstall' 'scripts/preuninstall.Arch' # For comparison
  sed -i -e '# Some security for root' \
         -e 's:^#!\s*/bin/sh$:&\nif [ "${EUID}" -ne 0 ]; then\n  echo "Must be root!"\n  exit 1\nfi:g' \
         -e '# Remove UnInstall noise' \
         -e 's:^\(\s*\)\(echo "Running\):\1#\2:g' \
         -e '# Block the usage of chkconfig' \
         -e 's:/usr/bin/chkconfig:/usr/bin/true:g' \
         -e '# Remove more noise' \
         -e 's:^\(\s\+\)\(echo "Removed\):\1#\2:g' \
         -e '# No need to sleep. The daemons are shut down by systemd' \
         -e 's:^sleep :#&:g' \
         -e '# pacman handles the links and files' \
         -e 's;if \[ -L ;if ! : \&\& [ -L ;g' \
         -e 's;^\(\s*\)\(rm -f \);\1: #\2;g' \
         -e '# Fixing this file was almost useless. All it does after we disable everything is an rmmod' \
    'scripts/preuninstall'
  test ! -f 'scripts/postinstall.Arch' -a ! -f 'scripts/preuninstall.Arch'
  # this generate a harmless error as it tries to make a folder in /usr/lib/modules...
  ./configure -q --sbindir='/usr/bin' --prefix='/usr' --mandir='/usr/share/man' # the module and DESTDIR-RPM_BUILD_ROOT dirs seem unsettable so are handled elsewhere

  # Produce a "file_locations" that we can pull in here.
  #if [ ! -f 'config/file_locations.Arch' ]; then
  #  echo "# for ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR" > 'config/file_locations.Arch'
  #  sed -e 's/^DGRP/local _&/g' 'config/file_locations' >> 'config/file_locations.Arch'
  #fi
  #. 'config/file_locations.Arch'

  # Patch a source for a constant that has been removed from the kernel.
  # Digi should patch this constant away since whatever it does will eventually not work.
  # See https://lkml.org/lkml/2014/10/16/632  [PATCH -next 09/27] tty: Remove TTY_CLOSING - LKML.ORG
  # See http://lkml.iu.edu/hypermail/linux/kernel/1411.0/03202.html [PATCH -next v2 09/26] tty: Remove TTY_CLOSING
  cat >> 'driver/build/include/dgrp_net_ops.h' << EOF
/* patched by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR */
/* http://aur.archlinux.org/ */
#ifndef TTY_CLOSING
#define TTY_CLOSING (7)
#endif
EOF
  set +u
}

build() {
  set -u
  cd dgrp-*/
  #. 'config/file_locations.Arch'
  make all -s # -j $(nproc) # This package doesn't support threaded make and it's too small to fix
  set +u
}

_daemons=('daemon' 'ditty')

package() {
  set -u
  cd dgrp-*/
  #. 'config/file_locations.Arch'

  # I don't want Linux version info showing on AUR web. After a few months 'linux<0.0.0' makes it look like an out of date package.
  local _kernelversionsmall="$(pacman -Q linux)" # this differs from uname -r. pacman: 4.0, uname: 4.0.0
  _kernelversionsmall="${_kernelversionsmall#* }"
  _kernelversionsmall="${_kernelversionsmall%-*}"
  eval 'conf''licts=("linux>${_kernelversionsmall}" "linux<${_kernelversionsmall}")' # prevent the makepkg bash simulator from getting this line!
  if [ "${_opt_LocktoKernel}" -ne 0 ]; then
    eval 'dep''ends+=("linux=${_kernelversionsmall}")'
  else
    depends+=('linux') # Prevent installation into Docker
  fi

  make -s RPM_BUILD_ROOT="${pkgdir}" install
  install -m644 'dinc/dinc.1' -t "${pkgdir}/usr/share/man/man1/" # They bypass the Makefile that does this
  chmod 644 "${pkgdir}/usr/bin/dgrp/config"/{dgrp.gif,file_locations}
  chmod 744 "${pkgdir}/usr/bin/"{dgelreset,dgipserv}
  # Create the links, customized for us by prepare above
  _DESTDIR="${pkgdir}" sh -eu <(grep 'ln -sf ' 'scripts/postinstall')
  #rmdir "${pkgdir}/usr/share/doc" # The Arch PKGBUILD does this for us

  # Prepend our message on the udev rules file
  install -dm755 "${pkgdir}/etc/udev/rules.d/"
  touch "${pkgdir}/${backup[0]}" # postinstall handles the pacsave file automatically
  chmod 644 "${pkgdir}/${backup[0]}"
  cat > "${pkgdir}/etc/udev/rules.d/10-dgrp.rules" << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# http://aur.archlinux.org/

# Generated: `date +"%F %T"`
# From PKGBUILD in folder: `pwd`

# Warning: If you modify this file you should copy it into the folder with the
# PKGBUILD or you might lose the customizations on the next install.

# This file was customized by the PKGBUILD by setting the mode on all ports
# to MODE=(see below). If all you need is a different mode on all ports
# then set the option in the PKGBUILD. If you need more granular control
# see these customization instructions:

# http://www.digi.com/support/kbase/kbaseresultdetl?id=3048

# Then copy this file into the folder with PKGBUILD.

$(cat "${pkgdir}/tmp/dgrp/10-dgrp.rules")
EOF
  rm -f "${pkgdir}/tmp/dgrp/10-dgrp.rules"
  rmdir "${pkgdir}/tmp/dgrp" "${pkgdir}/tmp" # errors out if other files ever show up in /tmp/dgrp
  if [ ! -z "${_opt_defaultmode:-}" ]; then
    sed -i -e 's:^\(KERNEL=="tty_dgrp\)\(.*\)$:\1\2, MODE="'"${_opt_defaultmode}"'":g' "${pkgdir}/etc/udev/rules.d/10-dgrp.rules"
  fi
  if [ -s "${srcdir}/../10-dgrp.rules" ]; then
    cp "${srcdir}/../10-dgrp.rules" "${pkgdir}/etc/udev/rules.d/10-dgrp.rules" # no cp -p in case this file has any wrong user:group
  fi
  chmod 644 "${pkgdir}/etc/udev/rules.d/10-dgrp.rules"

  install -Dpm755 "${pkgdir}/etc/init.d"/{dgrp_daemon,dgrp_ditty} -t "${pkgdir}/usr/bin/dgrp/daemon/"
  rm -f "${pkgdir}/etc/init.d"/{dgrp_daemon,dgrp_ditty}
  rmdir "${pkgdir}/etc/init.d"

  # systemd integration.
  install -dm755 "${pkgdir}/usr/lib/systemd/system/"
  local _daemon
  for _daemon in "${_daemons[@]}"; do
    cat > "${pkgdir}/usr/lib/systemd/system/dgrp_${_daemon}.service" << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# http://aur.archlinux.org/
[Unit]
Description="Digi ${_opt_RealPort} ${_daemon}"
After=network.target

[Service]
Type=forking
ExecStart=/usr/bin/dgrp/daemon/dgrp_${_daemon} start
ExecStop=/usr/bin/dgrp/daemon/dgrp_${_daemon} stop
ExecReload=/usr/bin/dgrp/daemon/dgrp_${_daemon} reload

[Install]
WantedBy=multi-user.target
EOF
  chmod 644 "${pkgdir}/usr/lib/systemd/system/dgrp_${_daemon}.service"
done

  # Install my custom drpadmin with man page.
  install -Dm755 "${srcdir}/drpadmin" -t "${pkgdir}/usr/bin/"
  sed -i -e 's/^#distro=:::$/distro="Arch Linux"/g' \
         -e "s/RealPort/${_opt_RealPort}/gI" "${pkgdir}/usr/bin/drpadmin"
  install -Dm444 "${srcdir}/drpadmin.1" -t "${pkgdir}/usr/share/man/man1/"
  # Standardize name of RealPort in man pages
  sed -i -e "s/RealPort/${_opt_RealPort}/gI" "${pkgdir}/usr/share/man/man8/"*.8 "${pkgdir}/usr/share/man/man1/"*.1
  set +u
}

# We generate this file because we have no other way to have adjustable content
_geninstall() {
# produce the Install script so it doesn't need to be downloaded separately
# I'm wondering why there isn't a function for this.
cat > "${install}" << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# http://aur.archlinux.org/

pre_install() {
  set -u
  # Ensure that config files don't get lost on reinstall, chiefly from the digi make install to package upgrade
  # post_install code will rename it back
  if [ -s '/etc/dgrp.backing.store' -a ! -s '/etc/dgrp.backing.store.pacsave' ]; then
    mv '/etc/dgrp.backing.store' '/etc/dgrp.backing.store.pacsave'
  fi
  set +u
}

post_upgrade() {
  set -u
  mandb -q
  /usr/bin/dgrp/config/postinstall # this used to run depmod -a
  depmod -a
  # rmdir '/tmp/dgrp' # postinstall forgets to remove this. Useful on /tmp folders that are not mounted tmpfs
  systemctl daemon-reload
  # Digi's postinstall automatically loads the daemons so we might as well too
  for _daemon in ${_daemons[@]}; do
    systemctl enable "dgrp_\${_daemon}.service"
    systemctl start "dgrp_\${_daemon}.service"
  done
  #echo "${_opt_RealPort} (dgrp) startup scripts updated or installed"
  set +u
}

post_install() {
  post_upgrade
}

pre_upgrade() {
  set -u
  for _daemon in ${_daemons}; do
    systemctl stop "dgrp_\${_daemon}.service"
    systemctl disable "dgrp_\${_daemon}.service"
  done
  /usr/bin/dgrp/config/preuninstall
  set +u
}

pre_remove() {
  pre_upgrade
  set -u
  . '/usr/bin/dgrp/config/file_locations'
  if [ -f "\${DGRP_STORE}.old" ]; then
    echo "To clean fully you may want to remove your config backup: \${DGRP_STORE}.old"
  fi
  if [ -f "\${DGRP_STORE}.pacsave" ]; then
    echo "To clean fully you may want to remove your config backup: \${DGRP_STORE}.pacsave"
  fi
  set +u
}

post_remove() {
  set -u
  mandb -q
  systemctl daemon-reload
  #echo "${_opt_RealPort} (dgrp) startup scripts removed"
  set +u
}
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
EOF
chmod 644 "${install}" # "
}
_geninstall
set +u
