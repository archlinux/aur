# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: vicks <aur-hylafaxplus@p.lalouisianaise.com>
# Category: daemons

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

# TODO: Automatically fix font path in /usr/lib/fax/hyla.conf whenever ghostscript upgrades.
# TODO: Cover pages in PKGBUILD for ready made installs.
# TODO: faxcron timer run as uucp. faxqclean must run as root.
# TODO: find more optional dependencies

# Setup these parameters

_opt_AreaCode="517"
_opt_FAXNumber="+1.517.555.0001"    # Default: +1.517.555.0001
_opt_LocalIdentifier="ArchLinuxFAX" # Default: ArchLinuxFAX
_opt_RingsBeforeAnswer="1"  # set to 0 to make faxgetty send only
_opt_MaintenanceTime="06:10:00"  # Cleanup will run every 12 hours starting at this time

_opt_hosts_hfaxd="192.168.[0-9]+.[0-9]+" # Default "", hosts to add to hosts.hfaxd
_opt_pagesize="Letter" # A4, Letter, Legal

# How to install:
# Recommended build command: makepkg -scCfi

# Before running faxsetup, let's see which daemons we want to run.
# man faxq # used only if modems are present on this system
# man hfaxd # also read the part about SNPP
# Enable the ones you want. faxsetup will start them.
# systemctl enable faxq
# systemctl enable hfaxd

# sudo faxsetup

# faxsetup will ask to run faxaddmodem only if there are no modems set up. 
# Answer yes if you like but you might as well answer no to
#   Do you want to run faxaddmodem to configure a modem [yes]? no
# because you'll need to run faxaddmodem anyways to add more modems.

# You can run with or without faxgetty
# faxgetty makes your setup more reliable and easier to manage.
# faxgetty is suitable for send/receive or send only environments.
# faxgetty is not required. If using faxgetty answer "NO" to
#   Should I run faxmodem for each configured modem [yes]? no
# and enable/start your modems.
# faxmodem systemd support is incomplete. Modems will not autostart on boot.

# sudo faxaddmodem
# Add as many modems as you like. See below for some untested high speed techniques.

# Enable one of the modems with some of the following commands.

# sudo systemctl enable faxgetty@ttyUSB0.service
# sudo systemctl start faxgetty@ttyUSB0.service
# sudo systemctl enable faxgetty@ttyACM0.service
# sudo systemctl start faxgetty@ttyACM0.service

# You only need to enable the first faxgetty service manually. faxsetup will 
# detect that faxgetty is in use and automatically enable and start all 
# configured modems. When all modems are added run faxsetup again to restart 
# the servers and enable all modems.

# sudo faxsetup

# HylaFAX recommends you run faxsetup to restart the servers after every 
# upgrade. This PKGBUILD is programmed to not require this. You need to run 
# faxsetup whenever ghostscript upgrades or the fonts won't be found. This 
# needs to be fixed if anyone can figure out how.

# Are the services running?
# systemctl status faxq
# systemctl status hfaxd
# systemctl list-units "faxgetty@*.service"
# systemctl list-timers

# Once you have a modem set up with phone line unplugged
# sendfax -n -d 5175551212 /etc/passwd
# Once you see that the modem is trying to send, let's see the job.
# faxstat -s
# Let's delete that job (change the id as necessary)
# faxrm 1
# Be patient. This can take a minute if the job is active on a modem in faxq.
# Let's see what happened to that job.
# faxstat -sd
# After you get a few real faxes sent, let's see how we're performing.
# xferfaxstats
# Let's see a log file
# less /var/spool/hylafax/etc/xferfaxlog

# Avoid restarting the daemons manually with systemctl. Too many commands, and 
# too tricky. Use faxsetup to restart the daemons and enable the modems.

# If the skel defaults are correct and prefab modem configs are available a 
# large number of modems could be automatically set up this way.
# cd /dev; for i in ttyUSB[1-3]; do faxaddmodem -nointeractive -s 38400 $i; done

# Once the first one is set up, a fast, loose, and untested method for a very 
# large number of identical modems could work like this:
# cd /dev
# mdmlist=`echo ttyUSB* ttyS* ttya[a-m]*` # example 8 USB, 4 serial, 13*16=832 Digi PortServer (dgrp).
# # This is ridiculous of course since there's no single computer with enough 
# # power to run 844 fax modems.
# cd /var/spool/hylafax
# for ttymdm in $mdmlist; do
#   if [ "$ttymdm" != "ttyUSB0" ]; then
#     cp -p /etc/config.ttyUSB0 /etc/config.$ttymdm
#     mkfifo FIFO.$ttymdm
#     # faxmodem $ttymdm
#     systemctl enable faxgetty@$ttymodem.service
#     systemctl start faxgetty@$ttymodem.service
#   fi
# done

# Helpful guides
# Arch Wiki: https://wiki.archlinux.org/index.php/Hylafax
# Debian Wiki: https://wiki.debian.org/HylaFax
# Gentoo Wiki: http://www.gentoo-wiki.info/HylaFAX
# Univention Wiki: http://wiki.univention.com/index.php?title=HylaFAX_setup
# HylaFAX user contributions: ftp://ftp.hylafax.org/contrib/

# VGETTY: http://www.cril.ch/anciens_projets.html.html#vgetty_voice_mail_and_extensions Vgetty Documentation Center
# VGETTY: http://alpha.greenie.net/vgetty/

# Linux modem support is troublesome. Serial based products all create ttys
# which requires them to be kernel modules. Linux changes the kernel interface 
# constantly for peak functionality and performance. This means that many 
# modem products work for a while then quit working as of a certain kernel 
# version. Manufacturers much prefer Windows where driver compatibility is 
# maintained over many versions rather than going back to revise the driver 
# each time the Linux kernel devs change something. Arch Linux as a rolling 
# release is on the front lines of this constant change. Modems are a 
# declining market so manufacturers have little interest in continuously 
# revising drivers. The solution for us is to stick to interfaces that are 
# actively maintained either by the manufacturers or by the Linux kernel devs.

# Here are the ones that continue to work even on the latest kernels. I'm only
# listing brands with 2 or more ports and modems I've tried. Multi port serial 
# products is sorted by number of lights. I'm only listing products similar
# to those I've tried. There may be other well supported products.

# Ethernet serial: Digi PortServer dgrp
# Note: Some fax documentation recommend against Ethernet serial servers
# because of the unpredictable delays inherent in Ethernet communication.
# I don't see any other way to support hundreds of modems.
# FTDI USB Serial 2: VSCOM
# FTDI USB Serial 2: Perle Ultraport
# FTDI USB Serial 2: Sewell
# FTDI USB Serial 2: BrainBoxes US
# FTDI USB Serial 2: B&B Electronics ULINX
# FTDI USB Serial 2: Startech
# FTDI USB Serial 2: SIIG
# FTDI USB Serial 2: SerialGear
# FTDI USB Serial 2: EasySYNC
# FTDI USB Serial 2: Shentek
# FTDI USB Serial 1: SeaLevel SeaLINK
# FTDI USB Serial 0: Digi Edgeport
# FTDI USB Serial 0: Comtrol RocketPort
# FTDI USB Serial 0: Hightek HK
# ACM USB Serial: Zyxel Multitech MT5634ZBA-USB-V.92-AV
#  (This modem is properly supported by usbserial & udev in Linux 4.0+. You 
#   don't need the mknod instructions found at the Multitech web site.)

# I prefer USB over PCI, PCIe, or Ethernet. Ethernet has timing issues.
# No reason to compete for a limited number of high performance PCIe slots 
# with low performance serial devices. ISA, EISA, VESA, PCI, PCIe are all 
# temporary technologies that will be replaced eventually. USB will last
# essentially forever with no changes.

# For an interesting discussion of Hylafax vs Hylafax+ vs vsi-fax see:
# http://lists.opensuse.org/opensuse/2009-09/msg00269.html
# Re: [opensuse] Update Hylafax 4.4 to 6.03 with src.rpm on OpenSuSE 10.3

set -u
pkgname='hylafaxplus'
_pkgnick='hylafax'
pkgver='5.5.6'
pkgrel='1'
pkgdesc='Enterprise Fax Server'
arch=('i686' 'x86_64')
install='hylafax.install'
license=('custom:SGI')
depends=('dash' 'libtiff' 'pam' 'ghostscript' 'gsfonts' 'sharutils' 'jbigkit' 'lcms2' 'smtp-server') # 'cron'
# BASE64 is the default so HylaFAX+ doesn't need uuencode but I put it in anyways to placate configure and the bin finder in faxsetup!
url='http://hylafax.sourceforge.net/'
provides=('hylafax')
conflicts=('hylafax')
# backup=(var/spool/hylafax/bin/{faxrcvd,notify})
#	'var/spool/hylafax/etc/hosts.hfaxd') # This is better handled with a .default file.
source=("http://downloads.sourceforge.net/hylafax/${_pkgnick}-${pkgver}.tar.gz"
        hylafax.{timer,service}
        'fmfix.pl'
        'faxq.service'
        'hfaxd.service'
        'faxgetty@.service'
        'sendfaxvsi-1.0.tgz')
sha256sums=('15ccb66d076d1bc399eb2358291fe33b64ddeca23ccdbb691b75039b5ef5ee2e'
            'ad13d5171f5a8eb55a5773fc429dcef8418db90a8742cec18484534e86198da8'
            '7b481d783f3c18303acd7d650321313302401e780616dce1f80b71a210bb58cf'
            'c9e9ad380aa50282125d2693e1ce7b65dedf4f5df22032a3fa60fbd1a75c87d9'
            '55505ff501e36281aa2b9c85fe0609d9cd04428a4b6d36e2754919411b615d2d'
            'be96cf8c5fc14fde96c7d37dc9ba2e604aeebe57ce8d5c95dd7567d7e794f3b0'
            '3f4cddd872be106041ecc460b7d738a5612668f447c783d5c9e71d9c1b7f62bb'
            'e80c6ffcb5f48bc1bf746b12d40abb94fe5ae79558edfad9c509ade6778cf2cf')
optdepends=('avantfax: manage HylaFAX+ through web browser'
            #'HERMESfax: manage HylaFAX+ through web browser' # Way too old
            't38modem: sip/voip fax modem pool interface'
            'fax4cups: CUPS fax printer'     # http://vigna.di.unimi.it/fax4CUPS/
            'faxfrontend: CUPS fax printer'  # https://www.vitki.net/book/page/integrating-hylafax-cups
            '2Fax: ascii to fax generator including pictures and fonts'  # http://www.atbas.org/2fax/ascii.php
            #'cypheus: (Windows) manage HylaFAX+' # Pretty old
# Too ad like... We'll leave them here for avid readers.
            #'Winprint-HylaFAX-Reloaded: (Windows) print to fax' # http://nerdvittles.com/?p=738 Incredible Fax: Free Faxing Returns to Incredible PBX 1.8
            #'WinPrint-Hylafax-for-Windows: (Windows) print to fax'
            #'Hylafax-support: iFax Solutions can help configure your fax system'
)
# 'sambafax'
# 'gfax: fax from Gnome (X)'

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
    if [ "${_opt_FAXNumber}" != '+1.517.555.0001' -o "${_opt_LocalIdentifier}" != 'ArchLinuxFAX' ]; then
      echo 'Our fax info must be removed from the PKGBUILD' 1>&2
      echo 'to produce a source package.' 1>&2
      exit 1
    fi
  fi
}
_pkginit

build() {
  set -u
  cd "${srcdir}/${_pkgnick}-${pkgver}"

  # sbin is deprecated and should not be used. We'll obliterate 
  # all uses of /sbin. Some /sbin not applicable to our OS are left alone.
  sed -i -e 's:^\(DIR_SBIN=/usr/local/\)sbin$:\1bin:g' \
         -e 's|:/sbin:\($PATH\)|:\1|g' \
         -e 's|\(findApp [^ ]\+ \)/sbin:\($PATH\)|\1\2|g' \
         -e 's|\(findAppDef [^ ]\+ \)/sbin:\($PATH\)|\1\2|g' \
         -e 's|^\(PATH=$PATH:/bin:/usr/bin\)\(:/etc\)$|\1 # \2 # it was an insanely stupid choice for some UNIX systems to put /etc in the path!|g' \
         -e 's:^\(test -d /usr/sbin &&\):#\1:g' \
         -e 's:^#!/bin/sh$:#!/usr/bin/dash:g' \
      'configure'

  # Eliminate all uses of /bin/sh which on Arch Linux is bash. configure gets 
  # some of them. dash is partly for performance on high volume fax servers 
  # and partly to ensure my changes to scripts conform to strict POSIX.
  # Upstream is more likely to accept the patches if they don't need to 
  # remove bashishms.
  sed -i -e 's:^#! */bin/sh$:#!/usr/bin/dash:g' \
      'config.'{guess,sub} faxmail/mailfax.sh* dist/new*
  sed -i -e 's:execl("/bin/sh":execl("/usr/bin/dash":g' \
      faxd/{faxApp.c++,faxGettyApp.c++}

  # apply PKGBUILD defaults to default etc/skel for hands free multi modem setup
  sed -i -e 's/^\(AreaCode:\s\+\)[^#\t]\+\(.*\)$'"/\1${_opt_AreaCode}\2/g" \
         -e 's/^\(FAXNumber:\s\+\)[^#\t]\+\(.*\)$'"/\1${_opt_FAXNumber}\2/g" \
         -e 's/^\(LocalIdentifier:\s\+\)[^#\t]\+\(.*\)$'"/\1\"${_opt_LocalIdentifier}\"\2/g" \
         -e 's/^\(RingsBeforeAnswer:\s\+\)[^#\t]\+\(.*\)$'"/\1${_opt_RingsBeforeAnswer}\2/g" \
      'config/skel'

  sed -i -e '# More sbin fixes' \
         -e 's:^\(test -d /usr/sbin &&\):#\1:g' \
         -e "# Add crude systemd support. faxmodem init on boot is still missing but I'm using faxgetty so I don't care" \
         -e 's/^\(DIR_SYSVINIT\)=@SYSVINITDIR@$/\1="systemd"/g' \
         -e 's:^\(\s\+\)if \[ -f ${DIR_SYSVINIT}/hylafax \]; then$:\1ishylaInit ()\n\1{\n\1if [ "${DIR_SYSVINIT}" = "systemd" ]; then\n\1    systemctl -q is-active hfaxd.service\n\1else\n\1    [ -f ${DIR_SYSVINIT}/hylafax ]\n\1fi\n\1}\n\n\1if ishylaInit; then:g' \
         -e 's/^\(\s\+\)\(if kill $HFAXD; then\)$/\1if [ "${DIR_SYSVINIT}" = "systemd" ]; then\n\1    systemctl stop hfaxd.service\n\1el\2/g' \
         -e 's:^\(\s\+\)\($DIR_SBIN/faxquit >/dev/null 2>&1\)$:\1if [ "$DIR_SYSVINIT" = "systemd" ]; then\n\1    systemctl stop faxq.service\n\1else\n\1    \2\n\1fi:g' \
         -e 's/^\(    \)\(kill $HFAXD\)$/\1\2 (SysV)\nor\n\1systemctl stop hfaxd.service (systemd)\n/g' \
         -e 's:^\(\s\+\)\(if \[ -x ${DIR_SYSVINIT}/hylafax \]; then\)$:\1# The systemd code does not adequately duplicate the functionality of SysV\n\1if [ "$DIR_SYSVINIT" = "systemd" ]; then\n\1    if isOK "$FAXQ_SERVER"; then systemctl start faxq.service; fi\n\1    if isOK "$HFAXD_SNPP_SERVER"; then\n\1        sed -i -e '"'"'s|^\\(ExecStart=/usr/bin/hfaxd -i hylafax\\)\\(.*\\)$|\\1 -s snpp|g'"'"' /usr/lib/systemd/system/hfaxd.service\n\1    else\n\1        sed -i -e '"'"'s|^\\(ExecStart=/usr/bin/hfaxd -i hylafax\\)\\(.*\\)$|\\1|g'"'"' /usr/lib/systemd/system/hfaxd.service\n\1    fi\n\1    systemctl daemon-reload\n\1    if isOK "$HFAXD_SERVER"; then systemctl start hfaxd.service; fi\n\1el\2:g' \
         -e '# Fix FAXD= typo' \
         -e 's:^\(\s\+\)\(FAXD="`findproc hfaxd`"\)$:\1H\2:g' \
         -e "# Remove ' for mcedit syntax highlighter" \
         -e 's:\([dD]on\)'"'"'t:\1t:g' \
         -e "# This would have been easier to fix if the error wasn't hidden" \
         -e 's:^\(\s\+\)\($DIR_SBIN/faxmodem $devid\)\( >/dev/null 2>&1\)$:\1\2 #\3 # Hiding these errors is counter productive!:g' \
         -e '# Fix LN for anyone who has LN in their environment' \
         -e 's:^\(LN=\):unset LN\n\1:g' \
         -e '# vgetty and egetty are not readily available on Arch Linux so kill the warning.' \
         -e '# Supress warning: /bin/vgetty does not exist or is not an executable program!' \
         -e '# Supress warning: /bin/egetty does not exist or is not an executable program!' \
         -e 's|^\(\s\+\)\(test -x $PATH_\)\([VE]GETTY\)\(.\+\)$|\1echo "\3 not available for Arch Linux" # \2\3\4 # http://www.hylafax.org/site2/HylaFAQ/Q360.html Q360: The truth about egetty/vgetty|g' \
         -e '# The gsfonts are likely to never be again placed in this folder.' \
         -e '# Why does gs report the folder in the search path?' \
         -e '# Supress warning: /usr/share/ghostscript/fonts does not exist or is not a directory!' \
         -e 's|^\(\s\+\)\(if \[ -d $FDIR \]; then\)$|\1if [ ! -d "$FDIR" -a "$FDIR" = "/usr/share/ghostscript/fonts" ]; then\n\1    echo -n ""\n\1el\2|g' \
         -e '# Branding' \
         -e 's|^\(Note "Setup program for HylaFAX (tm) $VERSION\)."$|\1-Arch Linux."|g' \
         -e '# Improve display for 25 line screens. I skipped one that would take too much regex to get.' \
         -e 's|^\(\t\t\)\(Note ""\)$|\1# \2|g' \
         -e 's|^\(\t    \)\(Note ""\)$|\1# \2|g' \
         -e '# Fix genfontmap output to get rid of glyph metric error.' \
         -e 's:\($DIR_SPOOL/bin/genfontmap.ps\) \(> $DIR_SPOOL/etc/Fontmap.HylaFAX\):\1 | $DIR_SPOOL/bin/fmfix.pl \2:g' \
         -e '# Fix some typos. Clarify SNPP.' \
         -e 's|\(\[2\] Init script starts hfaxd\)|\1:|g' \
         -e 's|\(\[3\] Start paging protocol\):\t|\1 (SNPP):|g' \
         -e '# systemd handling of faxgetty. Using sed limits how nice I can make the hacks.' \
         -e 's|^\(\s\+\)\(echo $DIR_SBIN/faxquit $devid\)$|\1if [ "$DIR_SYSVINIT" = "systemd" ]; then\n\1    systemctl enable "faxgetty@$devid.service"\n\1    systemctl restart "faxgetty@$devid.service"\n\1else\n\1    \2|g' \
         -e 's|^\(\s\+\)\($DIR_SBIN/faxquit $devid >/dev/null 2>&1\)$|\1    \2\n\1fi|g' \
         -e 's|^\(\s\+\)\(if \[ -f /etc/inittab \]; then\)$|\1if [ "$DIR_SYSVINIT" = "systemd" ]; then\n\1    FAXGETTY="`cd /etc/systemd/system/multi-user.target.wants; echo faxgetty@*.service`"; test "$FAXGETTY" = "faxgetty@*.service" \&\& unset FAXGETTY\n\1el\2|g' \
         -e 's|^\(\s\+\)\(if \[ "$init" \]; then\)$|\1if [ "$DIR_SYSVINIT" = "systemd" ]; then\n\1  for x in $DEVS; do\n\1    devid="`expr $x : '"'"'config.\\(.*\\)'"'"'`"\n\1    if [ -w $DIR_SPOOL/FIFO.$devid ]; then\n\1        systemctl enable "faxgetty@$devid.service"\n\1        systemctl restart "faxgetty@$devid.service"\n\1    fi\n\1  done\n\1el\2|g' \
         -e '# Remove /etc from path' \
         -e 's|^\(PATH\)=.\+$|\1=/usr/bin:/usr/local/sbin|g' \
         -e '# Apply default area code for easier setup' \
         -e 's|^\(AREACODE\)=.\+$'"|\1=${_opt_AreaCode}|g" \
      'etc/faxsetup.sh.in'

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
  sed -s -i -e 's:$TTY\>:$MDMTTY:g' \
            -e 's:\<TTY=:MDMTTY=:g' \
            -e 's:\<read TTY\>:read MDMTTY:g' \
            -e 's:^\(DEVPATH="/dev/"\)$:\1\ncleanMDM () {\n    if [ "$1" = "`dirname "$2"`/" ]; then\n       MDMTTY="`basename $2`"\n    else\n       MDMTTY="$2"\n    fi\n    case "$MDMTTY" in\n    /*)SHOWTTY="$MDMTTY";;\n    "")SHOWTTY=;;\n    *)SHOWTTY="$1$MDMTTY";;\n    esac\n}\ncleanMDM "$DEVPATH" "$MDMTTY"\n:g' \
            -e 's?^\(\s\+\)\(prompt "Serial port that modem is connected to .\+\)$?\1echo ""\n\1echo "Leave /dev off if your device is in /dev"\n\1echo "Examples: ttyUSB0, ttyACM0, ttyS0"\n\1\2\n\1test "$MDMTTY" || (cd /dev; ls tty[^0-9]*)\n\1cleanMDM "$DEVPATH" "$MDMTTY"?g' \
            -e 's?$DEVPATH$MDMTTY?$SHOWTTY?g' \
      etc/{faxaddmodem,probemodem}.sh.in
  # It is not necessary to add faster baud rates to the 2 modem scripts. 
  #   38400 is only the speed at which the script will test the modem. 
  # The modem config will set the proper speed during use.

  # quick grammar error fix
  sed -i -e 's:^a \(modem device \):\1:g' 'man/ondelay.1m'

  #exit 1
  unset LN # On my system this has something in it. The script should
  # probably be fixed to prefix _var_ on all variables. Like TTY in Linux, 
  # given enough systems and enough time eventually a variable conflict will 
  # occur. Prefixing should prevent this. The idea is to pick a prefix so obtuse
  # that no sane person would ever pick it. What does that make us?
  if [ ! -s 'Makefile' ]; then
    ./configure --nointeractive --with-OPTIMIZER="${CFLAGS}" \
    --target="${CARCH}-arch-linux" \
    --nointeractive \
    --with-DIR_BIN='/usr/bin' \
    --with-DIR_LIB='/usr/lib' \
    --with-DIR_LIBDATA='/usr/lib/fax' \
    --with-DIR_LIBEXEC='/usr/bin' \
    --with-DIR_MAN='/usr/share/man' \
    --with-DIR_SBIN='/usr/bin' \
    --with-SYSVINIT='no' \
    --with-PAGESIZE="${_opt_pagesize}" \
    --with-SCRIPT_SH='/usr/bin/dash'
  fi

#    --with-PATH_AFM='/usr/share/fonts/Type1' gs ignores this

  # unknown isn't good enough for me. Let's brand! 
  # We don't brand any of the build files which just get deleted anyways.
  #sed -s -i -e 's:-unknown-linux-:-arch-linux-:g' \
  #    etc/{faxaddmodem,probemodem,faxsetup}.sh
  # This crude branding was eliminated by the configure option above.

  # A patch from the Gentoo hylafaxplus ebuild. hostname -f produces a useless result on my system
  # sed -i -e "s:hostname:hostname -f:g" util/{faxrcvd,pollrcvd}.sh.in
  # More patches from the Gentoo hylafaxplus ebuild
  # Respect LDFLAGS(at least partially)
  # sed -i -e "/^LDFLAGS/s/LDOPTS}/LDOPTS} ${LDFLAGS}/" defs.in
  # sed -i -e "s|-fpic|-fPIC|g" configure

  # A serious error that needs a bit more explanation before somebody gets fired.
  sed -s -i -e 's|\(emsg = fxStr::format("Unable to open scheduler FIFO: %s\)\(",\)$|\1 (try running faxsetup)\2|g' \
      'hfaxd/FIFO.c++'
  #exit 1
  make -s # -j $(nproc) # hylafax is not multi threaded make compatible
  cd "${srcdir}/sendfaxvsi-1.0"
  sh -u make.sh
  set +u
}

package() {
  set -u
  cd "${srcdir}/${_pkgnick}-${pkgver}"
  make INSTALLROOT="${pkgdir}" install

  # My crude VSI-FAX tag support
  install -D -m 755 "${srcdir}/sendfaxvsi-1.0/sendfaxvsi" "${pkgdir}/usr/bin/sendfaxvsi"

  # Thanks to mc I can see that these files have the wrong permissions.
  chmod 644 "${pkgdir}/var/spool/hylafax/bin/"*.ps

  # Remove files that are not needed on Linux (from RPM .spec)
  rm -f "${pkgdir}/usr/bin/"{faxsetup.irix,faxsetup.bsdi}
  rm -f "${pkgdir}/usr/bin/"{ps2fax.imp,ps2fax.dps}
  rm -f "${pkgdir}/usr/share/man/man1/sgi2fax.1"

  # Huge screwup! We don't want to lose this log file on every upgrade.
  rm -f "${pkgdir}/var/spool/hylafax/etc/xferfaxlog"

  # Leaving this FIFO in the package makes it so that an accidental upgrade to 
  # a live production system immediately shuts down all fax traffic 
  # therby forcing the admin to quickly run faxsetup to restore operation, 
  # and that's only if the admin knows what to do because the errors on 
  # sendfax don't reveal much about the problem.
# 460 Failed to submit job 6: Unable to open scheduler FIFO: No such file or directory.
  # See above for where we amend this error.
  # Removing the FIFO ensures that the system will continue to run 
  # after an upgrade until it is convenient to run faxsetup to restart the 
  # daemons. Besides, the package doesn't create the FIFO correctly anyways.
  rm -f "${pkgdir}/var/spool/hylafax/FIFO" || :

  # My fixer tool to get rid of the glyph metrics warning. Look above for where sed hacks this in.
  # Alternate solution: ftp://ftp.hylafax.org/contrib/fontmap/fontmap.pl
  # Alternate solution: configure --with-AFM=no (seems supported only in HylaFAX, not HylaFAX+)
  install -D -m 744 "${srcdir}/fmfix.pl" "${pkgdir}/var/spool/hylafax/bin"
  # install -D -m 744 "${srcdir}/hylafax.cron.daily" "${pkgdir}/etc/cron.daily/hylafax" # all systemd now

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
# http://aur.archlinux.org/
EOF
    fi
    echo "${_host}" >> "${_outfile}"
  done

  # More user customizable files from the Slackbuild
  cd "${pkgdir}/var/spool/hylafax/etc"
  for _outfile in dialrules* 'cover.templ' 'dpsprinter.ps'; do
    mv "${_outfile}" "${_outfile}.default"
  done

  cd "${srcdir}/${_pkgnick}-${pkgver}"
  # Extended name .default for these files allowing AvantFAX and others 
  # to Install their own versions.
  for _outfile in 'archive' 'faxrcvd' 'notify' 'pollrcvd'; do
    mv "${pkgdir}/var/spool/hylafax/bin/${_outfile}" "${pkgdir}/var/spool/hylafax/bin/${_outfile}.hylafaxplus.default"
  done

  # add systemd files
  install -D -m644 "${srcdir}/hfaxd.service" "${pkgdir}/usr/lib/systemd/system/hfaxd.service"
  install -D -m644 "${srcdir}/faxq.service" "${pkgdir}/usr/lib/systemd/system/faxq.service"
  install -D -m644 "${srcdir}/faxgetty@.service" "${pkgdir}/usr/lib/systemd/system/faxgetty@.service"
  install -D -m644 'COPYRIGHT' "${pkgdir}/usr/share/licenses/${_pkgnick}/COPYRIGHT"
  # systemd timer (from the HylaFAX PKGBUILD). No need to install cron. This should be split into two timers.
  install -D -m644 "${srcdir}/hylafax.timer" "${pkgdir}/usr/lib/systemd/system/hylafax.timer"
  # insert the selected maintenance time
  sed -i -e 's/^\(OnCalendar\)=.\+$'"/\1=*-*-* ${_opt_MaintenanceTime}/g" "${pkgdir}/usr/lib/systemd/system/hylafax.timer"
  install -D -m644 "${srcdir}/hylafax.service" "${pkgdir}/usr/lib/systemd/system/hylafax.service"
  install -d -m755 "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants"
  # ln -s '../hylafax.timer' "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/hylafax.timer" # better done in install with systemctl enable
  set +u
}
set +u
