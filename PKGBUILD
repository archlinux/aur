# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=webmin
pkgver=1.770
pkgrel=1
pkgdesc="a web-based interface for system administration"
arch=(i686 x86_64)
license=('custom:webmin')
url="http://www.webmin.com/"
depends=('perl' 'perl-perl4-corelibs')
makedepends=('perl-net-ssleay')
backup=('etc/webmin/miniserv.conf' 'etc/webmin/miniserv.users' 'etc/webmin/config' 'etc/webmin/webmin.cats' \
'etc/webmin/pacman/config' \
'etc/webmin/at/config' \
'etc/webmin/acl/config' \
'etc/webmin/lvm/config' \
'etc/webmin/net/config' \
'etc/webmin/nis/config' \
'etc/webmin/pam/config' \
'etc/webmin/cron/config' \
'etc/webmin/file/config' \
'etc/webmin/grub/config' \
'etc/webmin/init/config' \
'etc/webmin/ipfw/config' \
'etc/webmin/lilo/config' \
'etc/webmin/proc/config' \
'etc/webmin/raid/config' \
'etc/webmin/spam/config' \
'etc/webmin/sshd/config' \
'etc/webmin/time/config' \
'etc/webmin/cluster-passwd/config' \
'etc/webmin/software/config' \
'etc/webmin/webminlog/config' \
'etc/webmin/cluster-webmin/config' \
'etc/webmin/bind8/config' \
'etc/webmin/dhcpd/config' \
'etc/webmin/fdisk/config' \
'etc/webmin/mount/config' \
'etc/webmin/mysql/config' \
'etc/webmin/quota/config' \
'etc/webmin/samba/config' \
'etc/webmin/shell/config' \
'etc/webmin/squid/config' \
'etc/webmin/adsl-client/config' \
'etc/webmin/servers/config' \
'etc/webmin/cluster-shell/config' \
'etc/webmin/bandwidth/config' \
'etc/webmin/ppp-client/config' \
'etc/webmin/lpadmin/config' \
'etc/webmin/apache/config' \
'etc/webmin/firewall/config' \
'etc/webmin/stunnel/config' \
'etc/webmin/burner/config' \
'etc/webmin/exports/config' \
'etc/webmin/backup-config/config' \
'etc/webmin/custom/config' \
'etc/webmin/htaccess-htpasswd/config' \
'etc/webmin/logrotate/config' \
'etc/webmin/format/config' \
'etc/webmin/fsdump/config' \
'etc/webmin/passwd/config' \
'etc/webmin/cluster-useradmin/config' \
'etc/webmin/cluster-software/config' \
'etc/webmin/cluster-copy/config' \
'etc/webmin/cluster-cron/config' \
'etc/webmin/telnet/config' \
'etc/webmin/status/config' \
'etc/webmin/syslog/config' \
'etc/webmin/updown/config' \
'etc/webmin/usermin/config' \
'etc/webmin/webmin/config' \
'etc/webmin/xinetd/config' \
'etc/webmin/openslp/config' \
'etc/webmin/procmail/config' \
'etc/webmin/fetchmail/config' \
'etc/webmin/postgresql/config' \
'etc/webmin/useradmin/config' \
'etc/webmin/mailboxes/config' \
'etc/webmin/inittab/config' \
'etc/webmin/change-user/config' \
'etc/webmin/postfix/config' \
'etc/webmin/proftpd/config' \
'etc/webmin/pserver/config' \
'etc/webmin/dnsadmin/config' )
install=webmin.install
source=(http://downloads.sourceforge.net/sourceforge/webadmin/$pkgname-$pkgver.tar.gz
        ftp://ftp.archlinux.org/other/webmin/webmin-config.tar.bz2
        ftp://ftp.archlinux.org/other/webmin/webmin-pacman.tar.bz2
        webmin.service)
options=(!strip)

package() {
  # NOTE: USE --asroot build option to avoid fakeroot error!
  cd "$srcdir"/$pkgname-$pkgver
  # add patches from webmin.com
  #for i in ../*.wbm
  #do tar xvf $i
  #done
  #for i in ../*.wbt
  #do tar xvf $i
  #done
  # delete stuff that's not needed
  rm -f mount/freebsd-mounts*
  rm -f mount/openbsd-mounts*
  rm -f mount/macos-mounts*

  # remove modules we do not support
  rm -rf {bacula-backup,ldap-useradmin,mon,sentry,frox,jabber,majordomo,qmail,sendmail,sarg,wuftpd,webalizer,inetd,ipsec,pap,pptp-client,pptp-server,shorewall,smart-status,vgetty,heartbeat,cfengine,cpan,sgiexports,hpuxexports,qmailadmin,bsdexports,dfsadmin}

  #remove config files from other distros
  rm -f $(find . ! -name 'config-generic-linux' ! -name 'config-\*-linux' ! -name 'config-lib.pl' -name 'config-*')

  # remove caldera theme
  rm -rf caldera

  # remove init-scripts from other distros
  rm webmin-gentoo-init
  rm webmin-init
  rm webmin-caldera-init
  rm webmin-daemon

  # remove update stuff to avoid problems with updating webmin,modules and themes without pacman
  rm -f webmin/{update.cgi,update.pl,update_sched.cgi,upgrade.cgi,edit_upgrade.cgi,install_mod.cgi,delete_mod.cgi,install_theme.cgi}
  rm -f usermin/{upgrade.cgi,update.cgi,update.pl,edit_upgrade.cgi,install_mod.cgi,delete_mod.cgi,install_theme.cgi}

  # remove modules add because we don't want files installed without pacman control
  rm -f webmin/{install_mod.cgi,delete_mod.cgi}

  # setting perl path
  (find . -name '*.cgi' ; find . -name '*.pl') | perl perlpath.pl /usr/bin/perl -

  # create dirs
  mkdir -p "$pkgdir"/opt/webmin
  mkdir -p "$pkgdir"/var/log/webmin
  mkdir -p "$pkgdir"/etc/webmin

  # install pam stuff
  install -D -m 644 webmin-pam "$pkgdir"/etc/pam.d/webmin

  # remove other distros and add only Archlinux don't change next line else it will not work!
  rm os_list.txt
  echo 'Archlinux			Any version	generic-linux	*	-d "/etc/pacman.d"' >> os_list.txt

  # Add rc.conf support to boot and shutdown menu and lock editing of this module
  cd init/
  sed -i -e 's:^local_down=.*:local_down=Archlinux RC.CONF,3,None:g' $(find . ! -name 'config.info.pl' -name 'config.info*')
  sed -i -e 's:^local_script=.*:local_script=Archlinux RC.LOCAL,3,None:g' $(find . ! -name 'config.info.pl' -name 'config.info*')
  sed -i -e 's:^index_downscript=.*:index_downscript=Archlinux RC.CONF:g' lang/*
  sed -i -e 's:^index_script=.*:index_script=Archlinux RC.LOCAL:g' lang/*
  sed -i -e 's:^noconfig=0:noconfig=1:g'  defaultacl

  # Add pacman menu
  cd "$srcdir"/$pkgname-$pkgver
  cp -rf custom/ pacman
  cp -rf mscstyle3/custom mscstyle3/pacman
  sed -i -e 's:^noconfig=0:noconfig=1:g' -e 's:^edit=1:edit=0:g' pacman/defaultacl
  sed -i -e '/desc/d' -e '/longdesc/d' pacman/module.info
  sed -i -e 's:^name=Custom:name=Pacman:g' pacman/module.info
  echo 'category=system' >> pacman/module.info
  echo 'desc=Pacman' >> pacman/module.info
  sed -i -e 's:^index_title=.*:index_title=Pacman:g' pacman/lang/*

  # copy stuff to right dirs
  cd "$srcdir"/$pkgname-$pkgver
  cp -rp * "$pkgdir"/opt/webmin
  cd "$srcdir"/webmin-config
  cp -rfp * "$pkgdir"/opt/webmin

  # define parameters for setup.sh
  config_dir="$pkgdir"/etc/webmin
  var_dir="$pkgdir"/var/log/webmin
  perl=/usr/bin/perl
  autoos=1
  port=10000
  login=root
  crypt="XXX"
  ssl=1
  atboot=0
  nostart=1
  nochown=1
  autothird=1
  nouninstall=1
  noperlpath=1
  atbootyn=n
  tempdir="$pkgdir"/tmp
  export config_dir var_dir perl autoos port tempdir login crypt ssl nochown autothird nouninstall nostart noperlpath atbootyn

  # Fix setup.sh
  sed -i -e 's:read atbootyn::g' -e 's:exit 13::g' "$pkgdir"/opt/webmin/setup.sh
  "$pkgdir"/opt/webmin/setup.sh

  # Fixup the config files to use their real locations
  sed -i 's:^pidfile=.*$:pidfile=/var/run/webmin.pid:' "$pkgdir"/etc/webmin/miniserv.conf
  find "$pkgdir"/etc/webmin -type f -exec sed -i "s:$pkgdir::g" {} \;

  # make it only accessible by localhost
  echo 'allow=127.0.0.1' >> "$pkgdir"/etc/webmin/miniserv.conf

  # install pacman menu
  cd "$srcdir"/webmin-pacman/config
  cp -rfp * "$pkgdir"/etc/webmin/pacman

  # install systemd files
  install -D -m 644 $srcdir/webmin.service $pkgdir/usr/lib/systemd/system/webmin.service

  # delete temp dir
  rm -r "$pkgdir"/tmp
  # change sticky bit
  chmod 0644 $pkgdir/opt/webmin/man/config-generic-linux
  # install license
  install -m 644 -D "$srcdir"/$pkgname-$pkgver/LICENCE "$pkgdir"/usr/share/licenses/webmin/LICENCE
}


md5sums=('2b5c9a7e5f82db923971021d2b47aa40'
         'b0b3e3fb231a12e60165b6b4d604dcfa'
         'bfebb75bb94029b48c46b7f1ba1aa811'
         'fc29ecb6a5cd8c278abe054e60381095')
