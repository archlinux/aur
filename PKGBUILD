# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: vicks <aur-hylafaxplus@p.lalouisianaise.com>

# Note: These TODO may not be things I'm planning to fix. Some of them are just
# notes to be fixed by someone else who wants that functionality and warnings
# to those who are expecting that functionality. The HylaFAX+ and AvantFAX
# PKGBUILD have taken many days to get them functional on a modern OS.
# I can't spend a lot more time fixing things I don't use without help.

# TODO: Check Arch Linux in TARGET="...unknown..."
# TODO: More systemd boot support (faxmodem).
# TODO: SendEmail/smtp-cli.pl support instead of sendmail/postfix

# WANT: Enabled Feature List: client, server, send fax, answer fax, answer modem, answer voice
# WANT: CLI fax manager (avantfax?)
# WANT: faxstat how to show only the last n days, like tail?
# WANT: a faxmovemodem: to rename or remove modem without shutting fax system down, compatible with faxmodem and faxgetty.

# TODO: faxcron timer run as uucp. faxqclean must run as root.
# TODO: find more optional dependencies
# TODO: Better default font.
# TODO: Fix faxd-makefile-bug on make install
# TODO: Improve systemd code now that it's out of sed and in patch
# TODO: Remove hfaxd.service and faxq.service symlinks

# TODO: log/c* modem and phone statistics script
# TODO: doneq/q* extended connection info awk script
# TODO: automatic requeue script

# Setting these skel defaults will make adding modems easier.

_opt_AreaCode="517"
_opt_FAXNumber="+1.517.555.0101"    # Default: +1.517.555.0101
_opt_LocalIdentifier="ArchLinuxFAX" # Default: ArchLinuxFAX
_opt_RingsBeforeAnswer="1"  # set to 0 to make faxgetty send only

# Configuration parameters

_opt_MaintenanceTime="06:10:00"  # Cleanup will run every 12 hours starting at this time

_opt_hosts_hfaxd="192.168.[0-9]+.[0-9]+" # Default "", hosts to add to hosts.hfaxd
_opt_pagesize="Letter" # A4, Letter, Legal

# Recommended modems

# http://hylafax.sourceforge.net/howto/intro.php#ss1.4

# Some fax documentation recommend against Ethernet serial servers
# because of the unpredictable delays inherent in Ethernet communication.

# Most PCI, PCIe, and USB serial ports are supported. I'm using USB.
# USB is self powered, does not compete for high performance slots,
# and does not create the highly contested /dev/ttyS* or
# /dev/ttyUSB* nodes.

# How to install:

# Before running faxsetup, let's see which daemons we want to run.
# man faxq # used only if modems are present on this system
# man hfaxd # also read the part about SNPP
# Enable the ones you want. faxsetup will start them.
# systemctl enable hylafax-faxq
# systemctl enable hylafax-hfaxd

# sudo faxsetup

# faxsetup will ask to run faxaddmodem only if there are no modems set up. 
# Answer yes if you like but you might as well answer no to
#   Do you want to run faxaddmodem to configure a modem [yes]? no
# because you'll need to run faxaddmodem anyways to add more than one modem.

# You can run with or without faxgetty
# faxgetty makes your setup more reliable and easier to manage.
# faxgetty is suitable for send/receive or send only environments.
# faxgetty is not required. If using faxgetty answer "NO" to
#   Should I run faxmodem for each configured modem [yes]? no
# and enable/start your modems.
# faxmodem systemd support is incomplete. Modems will not autostart on boot.

# What modems are configured?
# ls /var/spool/hylafax/etc/config.tty*

# sudo faxaddmodem
# Add as many modems as you like. See below for some minimally high speed techniques.

# Enable one of the modems with some of the following commands.

# sudo systemctl enable --now faxgetty@ttyUSB0.service
# sudo systemctl enable --now faxgetty@ttyACM0.service

# You only need to enable the first faxgetty service manually. faxsetup will 
# detect that faxgetty is in use and automatically enable and start all 
# configured modems. When all modems are added run faxsetup again to restart 
# the servers and enable all modems.
# Note that all modems are enabled including those that were manually
# disabled 'systemctl disable --now'. To permanently disable a modem
# you must 'rm /var/spool/hylafax/etc/config.tty...'
# To prevent faxsetup from enabling a modem and keep the config:
#   mv /var/spool/hylafax/etc/config.ttyACM1 /var/spool/hylafax/etc/config.disabled.ttyACM1

# sudo faxsetup

# HylaFAX recommends you run faxsetup to restart the servers after every 
# upgrade. This PKGBUILD is programmed to not require this.

# Are the services running?
# systemctl status hylafax-faxq
# systemctl status hylafax-hfaxd
# systemctl list-units 'faxgetty@*.service'
# systemctl list-timers 'hylafax.timer'

# Once you have a modem set up with phone line unplugged
#   sendfax -n -d 5175550113 /etc/passwd
# Once you see that the modem is trying to send, let's see the job.
#   faxstat -s
# Let's delete that job (change the id as necessary)
#   faxrm 1
# Be patient. This can take a minute if the job is active on a modem in faxq.
# Let's see what happened to that job.
#   faxstat -sd
# Try sending a real fax.
#   sendfax -n -d 5175550113 file
# If this doesn't work you'll need to modify dial rules:
#   man dialrules
#   dialtest -a 517 '/var/spool/hylafax/etc/dialrules'
# http://www.hylafax.org/archive/2007-10/msg00152.php
# https://www.allareacodes.com/517
# http://localcallingguide.com/
# dialrules modifications apply immediately, no restarting necessary.

# To remove SGI logo and add your own see
#   /var/spool/hylafax/etc/cover.templ

# After you get a few real faxes sent, let's see how we're performing.
#   xferfaxstats
# Let's see a log file
#   less -S '/var/spool/hylafax/etc/xferfaxlog'

# Avoid restarting the daemons manually with systemctl. Too many commands, and 
# too tricky. Use faxsetup to restart the daemons and enable the modems.

# If the skel defaults are correct and prefab modem configs are available a 
# large number of modems could be automatically set up this way.
#   cd /dev; for i in ttyUSB[1-3]; do faxaddmodem -nointeractive -s 38400 $i; done

# Once the first one is set up, a fast, loose, and minimally tested method for a very 
# large number of identical modems could work like this:
# cd '/dev'
# mdmlist=(ttyUSB* ttyS* ttya[a-m]*) # example 8 USB, 4 serial, 13*16=832 Digi PortServer (dgrp).
# # This is ridiculous of course since there's no single computer with enough 
# # power to run 844 fax modems.
# cd '/var/spool/hylafax'
# for ttymdm in "${mdmlist[@]}"; do
#   if [ "${ttymdm}" != 'ttyUSB0' ]; then
#     cp -p 'etc/config.ttyUSB0' "etc/config.${ttymdm}"
#     mkfifo "FIFO.${ttymdm}"
#     chmod 600 "${ttymdm}"
#     chown 'uucp:uucp' "${ttymdm}"
#     # faxmodem "${ttymdm}"
#     systemctl enable "faxgetty@${ttymdm}.service"
#     systemctl start "faxgetty@${ttymdm}.service"
#   fi
# done

# Helpful guides
# Arch Wiki: https://wiki.archlinux.org/index.php/Hylafax
# Debian Wiki: https://wiki.debian.org/HylaFax
# Gentoo Wiki: http://www.gentoo-wiki.info/HylaFAX (defunct)
# Univention Wiki: http://wiki.univention.com/index.php?title=HylaFAX_setup
# HylaFAX user contributions: ftp://ftp.hylafax.org/contrib/
# http://aplawrence.com/Linux/hylafax-scripts.html

# VGETTY: http://www.cril.ch/anciens_projets.html.html#vgetty_voice_mail_and_extensions Vgetty Documentation Center
# VGETTY: http://alpha.greenie.net/vgetty/

# For an interesting discussion of Hylafax vs Hylafax+ vs vsi-fax see:
# http://lists.opensuse.org/opensuse/2009-09/msg00269.html
# Re: [opensuse] Update Hylafax 4.4 to 6.03 with src.rpm on OpenSuSE 10.3

set -u
pkgname='hylafaxplus'
_pkgnick='hylafax'
pkgver='7.0.3'
pkgrel='1'
_sendfaxvsicommit='18fabc74490362cd26690331d546d727c727db25'
pkgdesc='Enterprise Fax Server'
arch=('i686' 'x86_64')
url='http://hylafax.sourceforge.net/'
license=('custom')
depends=('dash' 'libtiff' 'pam' 'ghostscript' 'sharutils' 'jbigkit' 'lcms2' 'gawk') # 'gsfonts-type1') # 'cron'
# BASE64 is the default so HylaFAX+ doesn't need uuencode but I put it in anyways to placate configure and the bin finder in faxsetup!
optdepends=(
  'smtp-server: email support' # this must be configured if installed or Hylafax will spam the process table with orphaned sendmail processes
  'avantfax: manage HylaFAX+ through web browser'
  #'HERMESfax: manage HylaFAX+ through web browser' # Way too old
  't38modem: sip/voip fax modem pool interface'
  'fax4cups: CUPS fax printer'     # http://vigna.di.unimi.it/fax4CUPS/
  'faxfrontend: CUPS fax printer'  # https://www.vitki.net/book/page/integrating-hylafax-cups
  '2Fax: ascii to fax generator including pictures and fonts'  # http://www.atbas.org/2fax/ascii.php
  #'cypheus: (Windows) manage HylaFAX+' # Pretty old
# Too ad like and will show in red as not found packages... We'll leave them here for avid readers.
  #'Winprint-HylaFAX-Reloaded: (Windows) print to fax' # http://nerdvittles.com/?p=738 Incredible Fax: Free Faxing Returns to Incredible PBX 1.8
  #'WinPrint-Hylafax-for-Windows: (Windows) print to fax'
  #'Hylafax-support: iFax Solutions can help configure your fax system'
# 'sambafax'
# 'gfax: fax from Gnome (X)'
  'yajhfc: hylafax client in Java'
  'mainpine-rfuser: reset utility for MainPine modems'
  'tgif: Cover Page Customization'
)
provides=("hylafax=${pkgver}")
conflicts=('hylafax')
# backup=(var/spool/hylafax/bin/{faxrcvd,notify})
install="${_pkgnick}.install"
# 'var/spool/hylafax/etc/hosts.hfaxd') # This is better handled with a .default file.
_verwatch=("${url}" 'news/\([0-9\.]\+\)\.php' 'l')
source=(
  "https://downloads.sourceforge.net/hylafax/${_pkgnick}-${pkgver}.tar.gz"
  "sendfaxvsi-1.0.0.tgz::https://github.com/severach/sendfaxvsi/archive/${_sendfaxvsicommit}.tar.gz"
  'fmfix.pl'
  'localnxxtoregex.sh'
  '0001-dialrules.7-10.digits.USA.patch'
  '0002-typerules.vertical.margins.patch'
  '0003-graphic.logo.instructions.patch'
  '0004-hylafaxplus-systemd.patch'
  '0004a-hylafaxplus-systemd.patch'
  '0005-hylafaxplus-faxsetup.patch'
  '0006-hylafaxplus-jobfmt-assigned-modem-to-used-modem.patch'
  '1000-hylafaxplus-modem-support.patch'
)
md5sums=('5835843903ae8cefc86eaa9a0c342612'
         '3af38f1eaa4f9fb92cac2f0cf9544321'
         '916f2c100eb2b41ef6b35f96bdb9444a'
         'c1d54ea1f50abfb3834488b428754714'
         '0edd9dbf9b745437a5a4c174d6418e96'
         'a2d08cfd91be2aa608dd3bc9ef6c69bc'
         'c8c3aab59725c20eddc7d31d21c7b31e'
         'fd0395521f6c2b8681e5fbcfd943043d'
         'a14922b05223f703c41dff8035477706'
         '0de848f554e2a93c09352eadb2b2e260'
         'f6692d5cb0033abe7865c47ec581ea87'
         'dd1e2859dd1cc13db863ba74bc539ca0')
sha256sums=('c44700d5f09495fea4742d56f2782a5c1ca83e8d63c4fe54a625269b39e3318d'
            '0aed186ab30fdb7cf36895a0ff50b03bd4a68db63cf4f19763995dabd9caffb0'
            '466ab17cdaa1eb1f1f0b5bdc444a90df5835a1896b1363584264920bbc3929f2'
            '80d2e28ee7a7d8f93501e32c96e9895e242409da1326761d36dbf28e5a0e3677'
            'dd4728f8204d0bba2a026768f0e0216778ed26583c3f799f6266554e21b48fe2'
            '5f19fa1f3b12fd480f4c28a9a2bdf041359d5510e1040b735d5f312071dcbd04'
            'b4b93c149164ed7c96f4f04373c32198c1e19c89ca9e2ab6e92e17c0a48bd1af'
            '989d6f71a8cfe99a3ca983981f8d8e9368776e2fc7667a809755d8d7292d52ad'
            '528f267805203b792741423f46114fee7b48664f1aab35a0edff7d519555ccc2'
            'e2b43c19705ce112dd3a08ecd0cae4c5558910366291524566cdd5890b2c6095'
            '96d106278ac68b95f0d1916f76066904c2108a2bb0c97651c22d025d989f4acb'
            '98e79e16e9cda5bb853501daaac7734cd5a367eb7543990f6a3c16fef49d0968')

# The HylaFAX binaries work very well. The scripts need major fixes!
# HylaFAX+ is pretty much completely broken for any Linux install,
# and some parts are broken for other Unix too. The original HylaFAX
# is even more broken. I scanned some other package builds:
# [x] dpkg .deb: Debian, Ubuntu
# [x] RPM/YUM spec: RHEL, Redhat, SUSE, CentOS, Fedora, Yellow Dog
# [x] Slackbuild tgz: Slackware
# [x] Pacman PKGBUILD: Arch Linux
# [x] Portage ebuild: Gentoo, Sabayon
# [ ] Ports: FreeBSD
# These have a few well chosen ./configure options but no substantial sed hacks 
# of any kind. I'm wondering how anyone gets HylaFAX running.
# HylaFAX was designed to be an easy install, 
# and with a little sedery, it can be again.
# -CJS

# Note: I only send faxes. Fax receiving might need a bunch more patches.

_pkginit() {
  if [ "${SOURCEONLY:-0}" -ne 0 ]; then # see makepkg -S if this var changes
    if [ "${_opt_FAXNumber}" != '+1.517.555.0101' ] || [ "${_opt_LocalIdentifier}" != 'ArchLinuxFAX' ]; then
      echo 'Our fax info must be removed from the PKGBUILD' 1>&2
      echo 'to produce a source package.' 1>&2
      exit 1
    fi
  fi
}
_pkginit
unset -f _pkginit

prepare() {
  set -u
  cd "${_pkgnick}-${pkgver}"

  # sbin is deprecated and should not be used. We'll obliterate 
  # all uses of /sbin. Some /sbin not applicable to our OS are left alone.
  #cp -p 'configure'{,.Arch}
  sed -e 's:^\(DIR_SBIN=/usr/local/\)sbin$:\1bin:g' \
      -e 's|:/sbin:\($PATH\)|:\1|g' \
      -e 's|\(findApp [^ ]\+ \)/sbin:\($PATH\)|\1\2|g' \
      -e 's|\(findAppDef [^ ]\+ \)/sbin:\($PATH\)|\1\2|g' \
      -e 's|^\(PATH=$PATH:/bin:/usr/bin\)\(:/etc\)$|\1 # \2 # it was an insanely stupid choice for some UNIX systems to put /etc in the path!|g' \
      -e 's:^\(test -d /usr/sbin &&\):#\1:g' \
      -e 's:^#!/bin/sh$:#!/usr/bin/dash:g' \
    -i 'configure'
  test ! -s 'configure.Arch' || echo "${}"

  # Ghostscript dropped Type1 from the font path.
  sed -e 's:@FONTPATH@:/usr/share/fonts/Type1:g' -i $(grep -le '@FONTPATH@' *.in etc/*.in)

  # Eliminate all uses of /bin/sh which on Arch Linux is bash. configure gets 
  # some of them. dash is partly for performance on high volume fax servers 
  # and partly to ensure my changes to scripts conform to strict POSIX.
  # Upstream is more likely to accept the patches if they don't need to 
  # remove bashishms.
  sed -e 's:^#! */bin/sh$:#!/usr/bin/dash:g' -i 'config.'{guess,sub} faxmail/mailfax.sh* dist/new*
  sed -e 's:execl("/bin/sh":execl("/usr/bin/dash":g' -i faxd/{faxApp.c++,faxGettyApp.c++}

  #cp -p 'etc/faxsetup.sh.in'{,.Arch}
  # diff -pNau5 'etc/faxsetup.sh.in'{.Arch,} > '0004a-hylafaxplus-systemd.patch'
  patch -Nbup0 -i "${srcdir}/0004a-hylafaxplus-systemd.patch"
  sed -e 's:/bin/systemctl:/usr/bin/systemctl:g' -i 'etc/faxsetup.sh.in'
  test ! -s 'etc/faxsetup.sh.in.Arch' || echo "${}"

  #cp -p 'etc/faxsetup.sh.in'{,.Arch}
  # diff -pNau5 'faxsetup.sh.in'{.Arch,} > '0005-hylafaxplus-faxsetup.patch'
  patch -Nbup0 -i "${srcdir}/0005-hylafaxplus-faxsetup.patch"
  sed -Ee "# Remove ' for mcedit syntax highlighter" \
      -e "s:([dD]on)'t:"'\1t:g' \
      -e '# Branding' \
      -e 's:^(Note "Setup program for HylaFAX (tm) \$VERSION)."$:\1-Arch Linux.":g' \
     -i 'etc/faxsetup.sh.in'
  test ! -s 'etc/faxsetup.sh.in.Arch' || echo "${}"

  #cp -p 'hfaxd/Jobs.c++'{,.Arch}
  # diff -pNau5 'hfaxd/Jobs.c++'{.Arch,} > '0006-hylafaxplus-jobfmt-assigned-modem-to-used-modem.patch'
  patch -Nbup0 -i "${srcdir}/0006-hylafaxplus-jobfmt-assigned-modem-to-used-modem.patch"
  test ! -s 'hfaxd/Jobs.c++.Arch' || echo "${}"

  #cp -pr 'config'{,.Arch}
  # diff -pNaru5 'config'{.Arch,} > '1000-hylafaxplus-modem-support.patch'
  patch -Nup0 -i "${srcdir}/1000-hylafaxplus-modem-support.patch"
  test ! -d 'config.Arch' || echo "${}"

  # Var $TTY clashes with the Arch Linux environment and likely all other Linux 
  # too. $TTY contains the terminal device from `tty`. With this already set 
  # to a known valid terminal, faxaddmodem never asks for a modem device and 
  # immedately tests the terminal for a modem. We haven't used modems for 
  # terminals for a long time and even when we did, you can't test a modem 
  # while it's "off hook" actively running a terminal. This bug blocks the 
  # to add modems interactively by running faxaddmodem or faxsetup leaving
  # big hole of complexity in setting up HylaFAX+.
  # Until we fix this, automatic modem setup in faxsetup must be skipped.
  # Modems can only be added with "faxaddmodem ttyUSB0". Then you need to run
  # faxsetup again to start all the modems.

  # We change TTY -> MDMTTY instead of -> TTYMDM to prevent sed recursive replace.

  # "faxaddmodem /dev/ttyUSB0" adds the device as "config._dev_ttyUSB0". This 
  # would be clever if the scripts could handle this, but they can't. We'll trim 
  # /dev/ off so the scripts work. It is too much to ask installing admins to 
  # remember to leave /dev/ off when no screens specify such. If the device 
  # is outside of /dev/ then we leave the folder intact resulting in a device
  # like "config._proc_stuff". I'm certain this won't work but 
  # until someone finds a use for a device outside of /dev 
  # this set of bugs will stay the way they are.
  # Fix bugs in /dev/tty* handling. Make faxaddmodem /dev/ttyUSB0 behave the 
  # same as faxaddmodem ttyUSB0. 
  # With all these bugs fixed you can install HylaFAX+ the way it was 
  # originally designed, and it's not very hard.
  #cp -p 'etc/faxaddmodem.sh.in'{,.Arch}
  #cp -p 'etc/probemodem.sh.in'{,.Arch}
  sed -e 's:$TTY\>:$MDMTTY:g' \
      -e 's:\<TTY=:MDMTTY=:g' \
      -e 's:\<read TTY\>:read MDMTTY:g' \
      -e 's:^\(DEVPATH="/dev/"\)$:\1\ncleanMDM () {\n    if [ "$1" = "`dirname "$2"`/" ]; then\n       MDMTTY="`basename $2`"\n    else\n       MDMTTY="$2"\n    fi\n    case "$MDMTTY" in\n    /*)SHOWTTY="$MDMTTY";;\n    "")SHOWTTY=;;\n    *)SHOWTTY="$1$MDMTTY";;\n    esac\n}\ncleanMDM "$DEVPATH" "$MDMTTY"\n:g' \
      -e 's?^\(\s\+\)\(prompt "Serial port that modem is connected to .\+\)$?\1echo ""\n\1echo "Leave /dev off if your device is in /dev"\n\1echo "Examples: ttyUSB0, ttyACM0, ttyS0"\n\1\2\n\1test "$MDMTTY" || (cd /dev; ls tty[^0-9]*)\n\1cleanMDM "$DEVPATH" "$MDMTTY"?g' \
      -e 's?$DEVPATH$MDMTTY?$SHOWTTY?g' \
    -i etc/{faxaddmodem,probemodem}.sh.in
  test ! -s 'etc/faxaddmodem.sh.in.Arch'
  test ! -s 'etc/probemodem.sh.in.Arch'

  # It is not necessary to add faster baud rates to the 2 modem scripts. 
  #   38400 is only the speed at which the script will test the modem. 
  # The modem config will set the proper speed during use.

  # A serious error that needs a bit more explanation before somebody gets fired for crashing the fax server.
  sed -e 's|\(emsg = fxStr::format("Unable to open scheduler FIFO: %s\)\(",\)$|\1 (try running faxsetup)\2|g' \
    -i 'hfaxd/FIFO.c++'

  # Provide clear instructions to remove and replace the SGI logo
  # diff -pNau5 cover.templ{.default,} > '0003-graphic.logo.instructions.patch'
  patch -d 'util' -Nup0 -i "${srcdir}/0003-graphic.logo.instructions.patch"

  # Add Include to all of the config files. The initial include is blank so it won't change anything.
  local _cfg
  for _cfg in $(grep -le '^ModemType:' config/*); do
    printf '#\nInclude:\t\t"etc/config-modems"\n' >> "${_cfg}"
  done

  # pretend, that libtiff 4.1 is similar to 4.0
  sed -e 's/4.0)/4.[01])/' -i 'configure'

  set +u

  echo 'Checking for fonts missing from fmfix.pl'
  ! grep -o $'\t/[A-Z].*;$' <(gs -q -sDEVICE='tiffg3' -sFONTPATH='/usr/share/fonts/Type1' 'util/genfontmap.ps' | perl '../fmfix.pl')
}

build() {
  set -u
  cd "${_pkgnick}-${pkgver}"
  if [ ! -s 'Makefile' ]; then
    # On my system LN has something in it. Short variable names should be avoided in scripts.
    LN= \
    CHOWN="${srcdir}/chown" \
    CHGRP="${srcdir}/chgrp" \
    ./configure \
      --nointeractive \
      --with-OPTIMIZER="${CFLAGS}" \
      --target="${CARCH}-arch-linux" \
      --with-DIR_BIN='/usr/bin' \
      --with-DIR_LIB='/usr/lib' \
      --with-DIR_LIBDATA='/usr/lib/fax' \
      --with-DIR_LIBEXEC='/usr/bin' \
      --with-DIR_MAN='/usr/share/man' \
      --with-DIR_SBIN='/usr/bin' \
      --with-SYSVINIT='no' \
      --with-PAGESIZE="${_opt_pagesize}" \
      --with-SCRIPT_SH='/usr/bin/dash'
#      --with-PATH_AFM='/usr/share/fonts/Type1' gs ignores this
  fi

  make -s -j1 # hylafax is not multi threaded make compatible
  make -C "${srcdir}/sendfaxvsi-${_sendfaxvsicommit}" -j1
  set +u
}

package() {
  set -u
  cd "${_pkgnick}-${pkgver}"

  local _chown="${pkgdir}/_install_chown.sh"

  # create chgrp capture
  install -Dm755 <(cat << EOF
#!/bin/bash

echo "  chgrp" \$(printf " '%s'" "\$@") >> "${_chown}"
EOF
  ) "${srcdir}/chgrp"
  # create chown capture
  install -Dm755 <(cat << EOF
#!/bin/bash

echo "  chown" \$(printf " '%s'" "\$@") >> "${_chown}"
EOF
  ) "${srcdir}/chown"
  echo -e "#!/bin/sh\n\n_fn_install() {" > "${_chown}"

  make -j1 INSTALLROOT="${pkgdir}" install
  echo -e "}\n_fn_install" >> "${_chown}"
  sed -e '# Remove pkgdir from script' \
      -e "s:${pkgdir}::g" \
      -e '# This file doesnt at the point where this is run in .install and we just chown them again' \
      -e '/hosts.hfaxd/ s:^:#:g' \
    -i "${_chown}"
  sed -e "s:${srcdir}:/usr/bin:g" -i "${pkgdir}/usr/bin/faxsetup"
  mv "${_chown}" "${pkgdir}/var/spool/hylafax/bin/"
  unset _chown

  # My crude vsi-fax tag support
  make -C "${srcdir}/sendfaxvsi-${_sendfaxvsicommit}" -j1 install DESTDIR="${pkgdir}" BINDIR='/usr/bin'

  # Thanks to looking at everything in mc I can see that these files have the wrong permissions.
  chmod 644 "${pkgdir}/var/spool/hylafax/bin/"*.ps

  # Remove files that are not needed on Linux (from RPM .spec)
  rm "${pkgdir}/usr/bin/"{faxsetup.irix,faxsetup.bsdi}
  rm -f "${pkgdir}/usr/bin/"{ps2fax.imp,ps2fax.dps}
  rm "${pkgdir}/usr/share/man/man1/sgi2fax.1"

  # Huge screwup! We don't want to lose this log file on every upgrade.
  rm "${pkgdir}/var/spool/hylafax/etc/xferfaxlog"

  # apply PKGBUILD defaults to default etc/skel for hands free multi modem setup
  sed -e 's/^\(AreaCode:\s\+\)[^#\t]\+\(.*\)$'"/\1${_opt_AreaCode}\2/g" \
      -e 's/^\(FAXNumber:\s\+\)[^#\t]\+\(.*\)$'"/\1${_opt_FAXNumber}\2/g" \
      -e 's/^\(LocalIdentifier:\s\+\)[^#\t]\+\(.*\)$'"/\1\"${_opt_LocalIdentifier}\"\2/g" \
      -e 's/^\(RingsBeforeAnswer:\s\+\)[^#\t]\+\(.*\)$'"/\1${_opt_RingsBeforeAnswer}\2/g" \
    -i "${pkgdir}/var/spool/hylafax/config/skel"
  sed -e '# Apply default area code for easier setup' \
      -e 's|^\(AREACODE\)=.\+$'"|\1=${_opt_AreaCode}|g" \
    -i "${pkgdir}/usr/bin/faxsetup"

  # Leaving this FIFO in the package makes it so that an accidental upgrade to 
  # a live production system immediately shuts down all fax traffic 
  # thereby forcing the admin to quickly run faxsetup to restore operation, 
  # and that's only if the admin knows what to do because the errors on 
  # sendfax don't reveal much about the problem.
# 460 Failed to submit job 6: Unable to open scheduler FIFO: No such file or directory.
  # See patch where we amend this error to give the poor admin a chance.
  # Removing the FIFO here ensures that the system will continue to run 
  # after an upgrade until it is convenient to run faxsetup to restart the 
  # daemons. Besides, the FIFO from the package is not made correctly.
  rm -f "${pkgdir}/var/spool/hylafax/FIFO"

  # My fixer tool to get rid of the glyph metrics warning. Look where patch hacks this in.
  # Alternate solution: ftp://ftp.hylafax.org/contrib/fontmap/fontmap.pl
  # Alternate solution: configure --with-AFM=no (seems supported only in HylaFAX, not HylaFAX+)
  install -Dpm744 "${srcdir}/fmfix.pl" "${pkgdir}/var/spool/hylafax/bin"
  # install -Dm744 "${srcdir}/hylafax.cron.daily" "${pkgdir}/etc/cron.daily/hylafax" # all systemd now

  # Install user selected hosts. Duplicate Samba's technique of making 
  # foo.default as part of the package leaving foo to be user modified. 
  # foo.default is copied to foo during the first install and removed or
  # upgraded automatically if same as original.
  # This fixes many problems and enables a lot of functionality.
  # * The Arch Linux Pacman file backup technique isn't friendly to reinstalls.
  # * Whether and what user changes can be easily found with any diff tool.
  # * You can start over with a new copy preserving only the crufty
  #   user mods you still want.
  # * Related installers can add their own foo.superbar.default files without
  #   calously overwriting user mods preventing the problem where
  #   "Installing superbar will fubar your server" and the apps can be installed
  #   in any order. Diff can be used to determine which variant is in use 
  #   and more diff can be used to switch user mods from one variant to another.
  # * Installers can automatically remove or upgrade unchanged files.
  # * Users are encouraged to make their own defaults like foo.central.default
  #   complete with their own installers.
  # * Eventually this leads to the proper use where the master script sources
  #   bunches of addons to obtain the desired result.
  # * When you see a .default file you know the related file is supposed to be 
  #   modifed.

  local _outfile="${pkgdir}/var/spool/hylafax/etc/hosts.hfaxd.default"
  mv "${pkgdir}/var/spool/hylafax/etc/hosts.hfaxd" "${_outfile}"
  local _host_first=1
  for _host in ${_opt_hosts_hfaxd}; do
    if [ "${_host_first}" -ne 0 ]; then
      _host_first=0
      cat >> "${_outfile}" << EOF
# The .default of this file will always be overwritten by upgrades. Modify the non .default copies!
# The following hosts were added by an install option in the ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/
EOF
    fi
    echo "${_host}" >> "${_outfile}"
  done

  # The usage of config include files needs to be standardized
  touch "${pkgdir}/var/spool/hylafax/etc/config-modems.default"

  # Lengthen retries to minimize failed jobs on high volume fax servers
  install -Dm644 <(cat << EOF
# The delay in seconds to wait before retrying a job whose
# dialing attempt failed with a BUSY status result.
# 12 dials over two hours: (2*60*60)/12
JobReqBusy:       600

# The delay in seconds to wait before retrying a job whose
# dialing attempt failed with a NO ANSWER status result.
# 2 dials over 2 hours: (2*60*60)/2
JobReqNoAnswer:   3600

# The delay in seconds to wait before retrying a job whose
# dialing attempt failed with a NO CARRIER status result.
# 2 dials over 2 hours: (2*60*60)/2
JobReqNoCarrier:  3600

# Delay in seconds for a Fax protocol error.
JobReqProto: 180

# rings to wait before answering phone
# 0 for send only modems
RingsBeforeAnswer: 0
EOF
  ) "${pkgdir}/var/spool/hylafax/etc/config-modems.sample"

  # faxaddmodem destroys some things we'd like to add to etc/config
  install -Dm644 <(cat << EOF
# faxaddmodem destroys some lines we add to etc/config
# so we add them here and use Include which isn't destroyed.
# To use this, etc/config must contain the line
# Include:<------><------>etc/config-local
# Hylafax does not automatically detect changes to included files
# touch etc/config to signal a change

#FAXNumber:		+1.000.000.0000
#PageMargins:		l=0.40in,r=0.40in,t=0.1in,b=0.1in
#JobControlCmd:		etc/jobcontrol-local
#ModemGroup:		"any:0:.*"
##ModemGroup:		"any:0:(ttyACM.*|ttyUSB[0123456])"
#ModemGroup:		"Rockwell:0:ttyUSB[067]"
#ModemGroup:		"Lucent:0:ttyACM.*"
#ModemGroup:		"Courier:0:ttyUSB3"
EOF
  ) "${pkgdir}/var/spool/hylafax/etc/config-local.default"

  # It's difficult to set up job control from the scant information in man pages and the Internet
  install -Dm755 <(cat << EOF
#!/usr/bin/bash

set -u
set -e

# man jobcontrol

if [ -x "\${0##*/}" ]; then
  self="\$(readlink -m "\$0")"
  cd ..
  self="\${self##\${PWD}/}"
  if ! grep -q "^JobControlCmd:\s\+\${self}" 'etc/config-local'; then
    echo "JobControlCmd not installed"
    echo "Try:"
    echo "  printf 'JobControlCmd:\t\t%s\n' '\${self}' >> 'config-local'"
  fi
  echo "DEMO!" 1>&2
  if [ "\$#" -ne 1 ]; then
    echo "Usage \$0 JID"
    exit 1
  fi
fi

source etc/setup.cache
source bin/common-functions

QFILE="sendq/q\$1"
if [ -s "\${QFILE}" ]; then
  HYLAFAX_TMPDIR=''
  TMPDIR=''
  SetupPrivateTmp
  parseQfile '' "\${QFILE}"
  case "\$number-\$owner-\$tottries" in
  #5551212-lee-3) echo "Class1ECMSupport: no";;
  #*-sam-*) echo "LocalIdentifier: +1.800.555.1224";;
  911-*|???555*) echo 'RejectNotice: "Calls to 911 and directory assistance are not permitted"';;
  [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]*) echo "RejectNotice: \"Invalid number (\${#number} digits)\"";;
  [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]-*) echo "RejectNotice: \"Invalid number (\${#number} digits)\"";;
  ???111*|000*|111*|???000*) echo 'RejectNotice: "Invalid number"';;
  #5175551214-*) echo 'ModemGroup: "Rockwell"';; # not compatible with Lucent
  #2705551214-*) # bad lines at this location won't let the fax complete
  #  # man sendq
  #  echo 'DesiredBR: 0' # 0 for 2400 bps, 1 for 4800 bps, 2 for 7200 bps, 3 for 9600 bps, 4 for 12000 bps, 5 for 14400 bps, 6 for 16800 bps, 7 for 19200 bps, 8 for 21600 bps, 9 for 24000 bps, 10 for 26400 bps, 11 for 28800 bps, 12 for 31200 bps, and 13 for 33600 bps (default).
  #  echo 'DesiredEC: 0' # 0 to disable, 1 for 64-byte ECM, 2 for 256-byte ECM (default).
  #  echo 'DesiredDF: 0' # 0 for 1-D MH, 1 for 2-D MR, 3 for 2-D MR with uncompressed data, and 4 for 2-D MMR (default).
  #  ;;
  esac
else
  echo "This only works with files in the sendq. Don't try JID in the doneq." 1>&2
fi
exit 0
EOF
  ) "${pkgdir}/var/spool/hylafax/etc/jobcontrol-local.default"

  # Add dial rules for USA 7 and 10 digit numbers. The posted examples have them in the wrong order.
  # diff -pNau5 dialrules{.default,} > '0001-dialrules.7-10.digits.USA.patch'
  patch -d "${pkgdir}/var/spool/hylafax/etc" -Nup0 -i "${srcdir}/0001-dialrules.7-10.digits.USA.patch"
  install -Dpm755 "${srcdir}/localnxxtoregex.sh" -t "${pkgdir}/usr/bin"

  # top and bottom margin patch because fax doesn't do page layout like a regular printer
  # http://aplawrence.com/Linux/hylafax-scripts.html
  # diff -pNau5 typerules{.orig,} > '0002-typerules.vertical.margins.patch'
  patch -d "${pkgdir}/usr/lib/fax" -Nup0 -i "${srcdir}/0002-typerules.vertical.margins.patch"

  # More user customizable files from the Slackbuild
  pushd "${pkgdir}/var/spool/hylafax/etc" > /dev/null
  for _outfile in dialrules* 'cover.templ' 'dpsprinter.ps'; do
    mv "${_outfile}" "${_outfile}.default"
  done
  popd > /dev/null

  # Extended name .default for these files allowing AvantFAX and others
  # to Install their own versions.
  for _outfile in 'archive' 'faxrcvd' 'notify' 'pollrcvd'; do
    mv "${pkgdir}/var/spool/hylafax/bin/${_outfile}" "${pkgdir}/var/spool/hylafax/bin/${_outfile}.hylafaxplus.default"
  done

  # Don't want a fax cover at two different places. Modified versions are preserved in install.
  ln -sf '/var/spool/hylafax/etc/cover.templ' "${pkgdir}/usr/lib/fax/faxcover.ps"

  # add systemd files
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=HylaFAX+ client-server protocol server
Documentation=man:hfaxd(8)

[Service]
Type=forking
ExecStart=/usr/bin/hfaxd -i hylafax
ExecReload=/bin/kill -HUP \$MAINPID

[Install]
WantedBy=multi-user.target
EOF
  ) "${pkgdir}/usr/lib/systemd/system/hylafax-hfaxd.service"
  # Compatibility mode for the old service names
  ln -s '/usr/lib/systemd/system/hylafax-hfaxd.service' "${pkgdir}//usr/lib/systemd/system/hfaxd.service"
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=HylaFAX+ queue manager
Documentation=man:faxq(8)

[Service]
Type=forking
ExecStart=/usr/bin/faxq
Nice=-10
ExecReload=/bin/kill -HUP \$MAINPID

[Install]
WantedBy=multi-user.target
EOF
  ) "${pkgdir}/usr/lib/systemd/system/hylafax-faxq.service"
  ln -s '/usr/lib/systemd/system/hylafax-faxq.service' "${pkgdir}//usr/lib/systemd/system/faxq.service"
  install -Dm644 <(cat << EOF
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.

# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=HylaFAX+ faxgetty on %i
Documentation=man:faxgetty(8)
After=faxq.service hfaxd.service

[Service]
ExecStart=/usr/bin/faxgetty %i
Nice=-10
Type=simple
Restart=always
RestartSec=0
KillMode=process

KillSignal=SIGTERM

[Install]
WantedBy=multi-user.target
EOF
  ) "${pkgdir}/usr/lib/systemd/system/faxgetty@.service"
  # systemd timer (from the HylaFAX PKGBUILD). No need to install cron. This should be split into two timers.
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=HylaFAX+ daily fax queue cleanup and deletion of 30 days old faxes
Documentation=man:faxqclean(8) man:faxcron(8)

[Timer]
OnCalendar=*-*-* ${_opt_MaintenanceTime}
AccuracySec=3h
Persistent=true

[Install]
WantedBy=multi-user.target
EOF
  ) "${pkgdir}/usr/lib/systemd/system/hylafax.timer"
  # insert the selected maintenance time
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=HylaFAX+ daily fax queue cleanup and deletion of 30 days old faxes
Documentation=man:faxqclean(8) man:faxcron(8)

[Service]
Type=oneshot
ExecStart=/usr/bin/faxqclean -a -j 1209600
ExecStart=/usr/bin/faxcron -rcv 30
Nice=19
IOSchedulingClass=best-effort
IOSchedulingPriority=7
#User=uucp
#Group=uucp
EOF
  ) "${pkgdir}/usr/lib/systemd/system/hylafax.service"

  # pacman hook for automatic folder change on ghostscript upgrade
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Trigger]
Operation = Upgrade
Type = Package
Target = ghostscript

[Action]
Description = HylaFax+: Check for changed ghostscript font folder
When = PostTransaction
Exec = /usr/share/libalpm/scripts/hylafax-ghostscript-upgrade.sh
EOF
  ) "${pkgdir}/usr/share/libalpm/hooks/hylafax-ghostscript.hook"
  install -Dm744 <(cat << EOF
#!/usr/bin/bash

# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

set -e
set -u

newfolder=(/usr/share/ghostscript/[0-9]*/Resource/)
if [ "\${EUID}" -eq 0 ]; then
  if [ "\${#newfolder[@]}" -ne 1 ]; then
    echo "\$0: unable to upgrade ghostscript folder"
  else
    newfolder="\${newfolder%/}"
    newfolder="\${newfolder%/*}/"
    sed -e "s:/usr/share/ghostscript/[0-9][^/]\+/:\${newfolder}:g" -i '/usr/lib/fax/hyla.conf' '/var/spool/hylafax/etc/setup.cache'
  fi
fi
EOF
  ) "${pkgdir}/usr/share/libalpm/scripts/hylafax-ghostscript-upgrade.sh"

  # pacman hooks to generate AFM files
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Trigger]
Operation = Upgrade
Type = Package
Target = ghostscript

[Action]
Description = HylaFax+: Generate Ghostscript Type 1 Font Metrics files
When = PostTransaction
Exec = /usr/share/libalpm/scripts/hylafax-ps2afm.sh build
EOF
  ) "${pkgdir}/usr/share/libalpm/hooks/hylafax-ghostscript-post.hook"
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Trigger]
Operation = Upgrade
Type = Package
Target = ghostscript

[Action]
Description = HylaFax+: Remove Ghostscript Type 1 Font Metrics files
When = PreTransaction
Exec = /usr/share/libalpm/scripts/hylafax-ps2afm.sh destroy
EOF
  ) "${pkgdir}/usr/share/libalpm/hooks/hylafax-ghostscript-pre.hook"
  install -Dm744 <(cat << EOF
#!/usr/bin/bash

# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

# build afm files for gs built in fonts at
# /usr/share/ghostscript/*/Resource/Font
# No more need for gsfonts-type1

set -u
set -e

if [ "\${EUID}" -ne 0 ]; then
  echo 'Must be root'
  exit 1
fi

cd /usr/share/ghostscript/[0-9]*/Resource/Font

_fn_build() {
  local f fa fm
  for f in *Mono*; do
    if [ "\${f//./}" = "\${f}" ]; then
      fa="\${f}.pfa"
      fm="\${f}.afm"
      ln -sf "\${f}" "\${fa}"
      pf2afm "\${fa}" > /dev/null # supress .pfm message
      rm "\${fa}"
      sed -e 's:\r::g' -i "\${fm}"
    fi
  done
}

_fn_destroy() {
  local f fa fm
  for f in *Mono*; do
    if [ "\${f//./}" = "\${f}" ]; then
      fm="\${f}.afm"
      rm "\${fm}"
    fi
  done
}

_fn_\${1:-build}
EOF
  ) "${pkgdir}/usr/share/libalpm/scripts/hylafax-ps2afm.sh"

  install -Dpm644 'COPYRIGHT' "${pkgdir}/usr/share/licenses/${_pkgnick}/COPYRIGHT"
  set +u
}
set +u
