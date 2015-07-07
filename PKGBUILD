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

# Set the mode for all created devices.
_opt_defaultmode="0666" # default: 0600
# If you need more granular control.
# See http://www.digi.com/support/kbase/kbaseresultdetl?id=3048
# Once set copy /etc/udev/rules.d/10-dgrp.rules to the PKGBUILD folder
# and it will be made into the package.

# sudo must be configured and available to the user account
# In (non root) user account: download PKGBUILD into a new folder
# using any method: cower or any AUR helper, wget, web browser, copy through network, or paste into PuTTY
# makepkg -sCcfi

# Since the kernel module isn't loaded until you have an active
# device, these services are automatically enabled and started
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

# To get your equipment up faster on servers that don't have Xwindows installed
# I've supplied a console shell script "drpadmin".
# It is adapted from Digi's RealPort "drpadmin" for Sun, HP UX, and SCO and has the same 
# look and feel.

# For information about using dgrp_ditty.service to maintain your ditty settings
# across reboots see http://www.digi.com/support/kbase/kbaseresultdetl?id=904

# make install and other commands described in the release notes
# only build properly in the Arch environment when you first run
# "makepkg -sC" to unpack the source allowing this PKGBUILD to patch the build files.

# makepkg switches:
#  -s = build package
#  -C = erase source and rebuild from scratch. This is important because once
#       built it is locked to your booted kernel version. When the kernel 
#       changes the package is worthless and you must boot the new kernel and
#       rebuild from scratch. Rebuild automation is provided.
#  -f = force overwrite of already built package. When the kernel changes the 
#       the package is worthless.
#  -c = erase work folders when done
#  -i = install or upgrade package after build. 

# Leave "-c -i" off if you'd like to perform the make and install yourself
# using "make install" as described in the release notes.

# If you opt out of the Arch Linux package you must
# sudo make install
# sudo make postinstall
# You will need to construct your own startup environment. 
# The BSD init scripts run just fine. They just don't launch automatically
# in systemd. For startup I use @reboot in cron (cronie) to launch a shell 
# script in ~root with these commands:
# #!/bin/sh
# sleep 5 # wait for network and other services to start
# /etc/init.d/dgrp_daemon start # This submits configured interfaces to the kernel module
# /etc/init.d/dgrp_ditty start  # this sets configured baud rates and other ditty-rp settings for the ports
# You won't get a graceful shutdown on reboot.

# In general for any manual upgrade you will need to:
# sudo make preuninstall # this shuts down all of your interfaces which unloads the kernel module. 
                         # Then the UDEV module is removed. The config file is not erased.
# sudo make uninstall    # This removes the old executables, man pages, and other Digi files
# sudo mandb             # this removes the Digi man page summaries from "man -k".
# (don't do this) "./configure"   # this rebuilds the makefiles with the new kernel version
# (don't do this) "sudo make all" # this builds all the new executables
# (do this instead) "makepkg -sC" # This modifies some files for the Arch Linux package, runs the above two commands, makes a package, then modifies the makefiles for "make install"
# sudo make install      # this installs all the executables
# sudo mandb             # this adds the Digi man page summaries and any other missing summaries to "man -k"
# sudo make postinstall  # this installs the UDEV module and starts any configured interfaces and the kernel module.
# Adjust your daemon startup as necessary. The @reboot option in cron (cronie) is one choice, see above.

# Note that the kernel module is not loaded until you configure at least one interface. 
# When your last interface is uninit the kernel module will be unloaded.

# The manual install will not give you a systemd init script and installs unnecessary
# files and is a bunch of work to rebuild every time the kernel changes.

# How about we don't do that and use the Arch Linux package instead.

# The Arch Linux package gives you
#  * systemd init scripts
#  * Only installs the right files
#  * Automatic removal on kernel upgrade
#  * Automatic rebuild and start on next login

# Uninstall cleanup: 
# rm /etc/dgrp.backing.store /usr/bin/dgrp/config/ditty.commands
# rmdir /usr/bin/dgrp/config
# rmdir /usr/bin/dgrp

# If Digi releases a new version then all you need to change is
# pkgver, source, and possibly _pkgnamever
# Then run "updpkgsums" to get new md5sums

############################### Arch PKGBUILD #################################
set -u
pkgname='dgrp'
_pkgnamever="${pkgname}-1.9"  # this is the folder name inside the supplied tgz. It should be ${pkgname}-$pkgver but Digi didn't do that.
pkgver='1.9.35'
pkgrel=1
_RealPort='RealPort' # Digi's product name is inconsistent. Here you can choose. RealPort seems right so I didn't complete the change to Realport.
pkgdesc=("tty driver for Digi ${_RealPort} Connect EtherLite Flex One CM PortServer IBM RAN")
_pkgdescshort="Digi ${_RealPort} driver for Ethernet serial servers"
arch=('i686' 'x86_64')
url='http://www.digi.com/'
license=('GPL' 'APACHE' 'custom:DigiInternational')
makedepends=('linux-headers' 'openssl' 'sudo') # openssl in in Arch Linux "base"

_lock_to_kernel=1

# Locking to a kernel is only necessary if we must manually uninstall before
# upgrading the kernel. Kernel locking makes upgrades impossible. Without a 
# lock the service will stop before the reboot, and not start on the next boot.
# We'll sense the missing kernel module and the upgrade will remove the
# old kernel module and install the new one. The upgrade will start the kernel
# module.
_kernelversionsmall="`uname -r | cut -d - -f 1`"
if [ "${_lock_to_kernel}" -ne 0 ]; then
  depends=("linux=${_kernelversionsmall}" 'openssl')
else
  depends=('linux' 'openssl')
  backup=('etc/dgrp.backing.store') # don't do this if you kernel lock or your config will be lost on upgrade
fi
conflicts=("linux>${_kernelversionsmall}" "linux<${_kernelversionsmall}")
optdepends=('tcl: digi config manager in X' 'tk: digi config manager in X')
source=("${pkgname}-${pkgver}-81000137_W.tgz::http://ftp1.digi.com/support/driver/81000137_W.tgz" 'drpadmin' 'drpadmin.1' 'autorebuild-dgrp.sh')
sha256sums=('218c3a873f8623d2e663735efdee384f7dac784327cea9e7211eddce700fe1c8'
            '1ab0ccdc361760ae078f9b69f603e99b40849cdf97ad69bb028ad6af27012634'
            '66f8b106a052b4807513ace92978e5e6347cef08eee39e4b4ae31c60284cc0a3'
            'dde3d60179c465696370aa493a5b9f0ba2e5189e56cfc51439cfcca38f66bad5')
options=('!docs' '!emptydirs')
install="${pkgname}-install.sh"
_autorebuild="autorebuild-${pkgname}.sh"
_autorebuildsenseexe="/usr/lib/modules/\`uname -r\`/misc/dgrp.ko"

prepare() {
  set -
  cd "${_pkgnamever}"
  ./configure # --prefix=/usr # this didn't work

  # Produce an Arch compatible Makefile
  if [ ! -f 'Makefile.inc.Arch' ]; then
    echo "# patched by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR" > 'Makefile.inc.Arch'
    echo '# http://aur.archlinux.org/' >> 'Makefile.inc.Arch'
    echo 'prefix=/usr' >> 'Makefile.inc.Arch'
    echo '' >> 'Makefile.inc.Arch'
    cat 'Makefile.inc' >> 'Makefile.inc.Arch'
    sed -i -e 's:/usr/sbin:/usr/bin:g' 'Makefile.inc.Arch'
  fi
  cp -p 'Makefile.inc.Arch' 'Makefile.inc'

  # Produce a "file_locations" that we can pull in here.
  if [ ! -f 'config/file_locations.Arch' ]; then
    echo "# patched by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR" > 'config/file_locations.Arch'
    sed -e 's/^DGRP/_DGRP/g' 'config/file_locations' >> 'config/file_locations.Arch'
  fi
  . 'config/file_locations.Arch'

  #export mandir=/usr/share/man
  #export CFLAGS="$CFLAGS -DTTY_CLOSING=7"
  #export MYMANDIR=/usr/share/man # didn't work
  #sed -i -e 's/CPPFLAGS =/CPPFLAGS = -DTTY_CLOSING=7/g' Makefile # didn't work
  #sed -i -e 's/MANDIR=.*$/MANDIR = \/usr\/share\/man/g' Makefile.inc # didn't work
  #sed -i -e 's/-DDGRP_TRACER/-DDGRP_TRACER -DTTY_CLOSING=7/g' driver/build/Makefile.in # didn't work
  #sed -i -e 's:\$(RPM_BUILD_ROOT)\$(MYMANDIR):/usr/share:g' driver/build/Makefile # I'm gonna get you, one way or another!
  #sed -i -e 's:\$(MANDIR):/usr/share/man:g' */Makefile # these changes are all ignored. I'm not gonna...

  # /usr/sbin /sbin and /lib are deprecated as soft links and aren't permitted in packages
  sed -i -e 's:/usr/sbin:/usr/bin:g' 'Makefile' */Makefile driver/*/Makefile
  # sed will perform a replace on already replaced text, but only once. 
  # That doesn't make sense to me but I can get around it by ensuring 
  # the from string isn't in the to string and doing it twice.
  sed -i -e 's:/lib/:/usr/lIb/:g' Makefile */Makefile driver/*/Makefile
  sed -i -e 's:/lIb/:/lib/:g' Makefile */Makefile driver/*/Makefile

  # I'd like to use /usr/local/bin but I suspect that this change would be 
  # even more work than what I've already done and much to different from
  # Digi's install.

  # Patch a source for a constant that has been removed from the kernel. 
  # Digi should fix this since it will eventually not work right.
  # See https://lkml.org/lkml/2014/10/16/632  [PATCH -next 09/27] tty: Remove TTY_CLOSING - LKML.ORG
  # See http://lkml.iu.edu/hypermail/linux/kernel/1411.0/03202.html [PATCH -next v2 09/26] tty: Remove TTY_CLOSING
  echo '' >> 'driver/build/include/dgrp_net_ops.h'
  echo "/* patched by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR */" >> 'driver/build/include/dgrp_net_ops.h'
  echo '/* http://aur.archlinux.org/ */' >> 'driver/build/include/dgrp_net_ops.h'
  echo '#ifndef TTY_CLOSING' >> 'driver/build/include/dgrp_net_ops.h'
  echo '#define TTY_CLOSING (7)' >> 'driver/build/include/dgrp_net_ops.h'
  echo '#endif' >> 'driver/build/include/dgrp_net_ops.h'
  set +u
}

build() {
  set -
  cd "${_pkgnamever}"
  . 'config/file_locations.Arch'

  # The instructions say we can only use pkgdir in package() but fortunately it exists here
  # This bit of magic might work on other RPM based commercial drivers
  echo "RPM_BUILD_ROOT=${pkgdir}" > 'Makefile.inc'
  cat 'Makefile.inc.Arch' >> 'Makefile.inc'
  make all -s -j $(nproc)
  # This package doesn't seem to support threaded make
  set +u
}

_daemons='daemon ditty'

package() {
  set -
  cd "${_pkgnamever}"
  . 'config/file_locations.Arch'
  make install
  # Leave the user with a properly modified Makefile.inc so the make commands in
  # the release notes mostly work in the Arch environment.
  cp -p 'Makefile.inc.Arch' 'Makefile.inc'

  if [ "${_opt_defaultmode}" != '' ]; then
    mv "${pkgdir}/tmp/dgrp/10-dgrp.rules" "${pkgdir}/tmp/dgrp/10-dgrp.rules.Arch"
    cat > "${pkgdir}/tmp/dgrp/10-dgrp.rules" << EOF
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

EOF
    cat "${pkgdir}/tmp/dgrp/10-dgrp.rules.Arch" >> "${pkgdir}/tmp/dgrp/10-dgrp.rules"
    rm -f "${pkgdir}/tmp/dgrp/10-dgrp.rules.Arch"
    sed -i -e 's:^\(KERNEL=="tty_dgrp\)\(.*\)$:\1\2, MODE="'"${_opt_defaultmode}"'":g' "${pkgdir}/tmp/dgrp/10-dgrp.rules"
    cp -p "${srcdir}/10-dgrp.rules" "${pkgdir}/tmp/dgrp/10-dgrp.rules" || :
  fi

  # we need this to be safe just in case this points to the real /etc instead of pkg/etc as we expect
  # as non root we'll be unable to erase any of these things from the real /etc. On Arch Linux none will exist anyways
  mv -n "${pkgdir}/etc/init.d/dgrp_daemon" "${pkgdir}/etc/init.d/dgrp_ditty" "${pkgdir}/usr/bin/dgrp/daemon/"
  rm -f "${pkgdir}/etc/init.d/dgrp_daemon" "${pkgdir}/etc/init.d/dgrp_ditty"
  rmdir "${pkgdir}/etc/init.d" "${pkgdir}/etc"
  chmod 1777 "${pkgdir}/tmp" # /tmp is not allowed in packages. We're not making a binary distro so having /tmp here shouldn't be a problem.
  chmod 700 "${pkgdir}/usr/bin/dgelreset" "${pkgdir}/usr/bin/dgipserv" "${pkgdir}/usr/bin/dgrp/config/postinstall" "${pkgdir}/usr/bin/dgrp/config/preuninstall"
  # It's not really clear to me why these are in the man pages but not in the path so you can use them.
  cd "${pkgdir}/usr/bin"
  for _exes in 'dgrp_cfg_node' 'dgrp_gui'; do
    ln -s "dgrp/config/${_exes}" "${_exes}"
  done
  # ditty: You might need this if you have scripts that depend on ditty. It is commented out in case you have another ditty on your system.
  # ln -s ditty-rp ditty
  #rmdir "${pkgdir}/usr/share/doc" # The Arch PKGBUILD does for us

  # systemd integration. Umask is 000 on my system. I don't know how makepkg gets the right permissions on this mkdir.
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  local _daemon
  for _daemon in ${_daemons}; do
    cat > "dgrp_${_daemon}.service" << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# http://aur.archlinux.org/
[Unit]
Description="Digi ${_RealPort} ${_daemon}"
After=network.target

[Service]
Type=forking
ExecStart=/usr/bin/dgrp/daemon/dgrp_${_daemon} start
ExecStop=/usr/bin/dgrp/daemon/dgrp_${_daemon} stop
ExecReload=/usr/bin/dgrp/daemon/dgrp_${_daemon} reload

[Install]
WantedBy=multi-user.target
EOF
  install -m 644 "dgrp_${_daemon}.service" "${pkgdir}/usr/lib/systemd/system/"
  rm -f "dgrp_${_daemon}.service"
done

  # Install my custom drpadmin with man page. This automatically detects if the files aren't provided.
  sed -i -e "s/RealPort/${_RealPort}/gI" "${pkgdir}/usr/share/man/man8/"*.8 "${pkgdir}/usr/share/man/man1/"*.1
  if [ -s "${srcdir}/drpadmin" ]; then
    install -Dm755 "${srcdir}/drpadmin" "${pkgdir}/usr/bin/"
    sed -i -e 's/^#distro=:::$/distro="Arch Linux"/g' \
           -e "s/RealPort/${_RealPort}/gI" "${pkgdir}/usr/bin/drpadmin"
    if [ -s "${srcdir}/drpadmin.1" ]; then
      install -Dm444 "${srcdir}/drpadmin.1" "${pkgdir}/usr/share/man/man1/"
      sed -i -e "s/RealPort/${_RealPort}/gI" "${pkgdir}/usr/share/man/man1/drpadmin.1"
    fi
  fi
}

_geninstall() {
# produce the install script so it doesnt need to be downloaded separately
# I'm wondering why there isn't a function for this.
cat > "${install}" << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# http://aur.archlinux.org/

post_upgrade() {
  set -u
  mandb -q
  /usr/bin/dgrp/config/postinstall # this runs depmod -a
  rmdir '/tmp/dgrp' # postinstall forgets to remove this. Useful on /tmp folders that are not mounted tmpfs
  systemctl daemon-reload
  # Digi's postinstall automatically loads the daemons so we might as well too
  for _daemon in ${_daemons}; do
    systemctl enable "dgrp_\${_daemon}.service"
    systemctl start "dgrp_\${_daemon}.service"
  done
  echo "${_RealPort} (dgrp) startup scripts updated or installed"
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
  if [ -f "\${DGRP_STORE}" ]; then
    echo "To clean fully you may want to remove your config: \${DGRP_STORE}"
  fi
  set +u
}

post_remove() {
  set -u
  mandb -q
  systemctl daemon-reload
  echo "${_RealPort} (dgrp) startup scripts removed"
  set +u
}
EOF
chmod 644 "${install}"
}
_geninstall
set +u
