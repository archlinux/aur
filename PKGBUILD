# Maintainer: Amish <contact at via dot aur>
# Contributor: Daniel Milde <daniel at milde dot cz>
# Contributor: Felix Schindler <ftschindler at aur dot archlinux>

pkgname=webmin
pkgver=1.831
pkgrel=5
pkgdesc="a web-based interface for system administration"
arch=(i686 x86_64)
license=('custom:webmin')
url="http://www.webmin.com/"
depends=('perl' 'perl-net-ssleay' 'perl-authen-pam')
backup=('etc/webmin/miniserv.conf' 'etc/webmin/miniserv.users' 'etc/webmin/config' \
'etc/webmin/acl/config' \
'etc/webmin/adsl-client/config' \
'etc/webmin/ajaxterm/config' \
'etc/webmin/apache/config' \
'etc/webmin/at/config' \
'etc/webmin/backup-config/config' \
'etc/webmin/bacula-backup/config' \
'etc/webmin/bandwidth/config' \
'etc/webmin/bind8/config' \
'etc/webmin/burner/config' \
'etc/webmin/change-user/config' \
'etc/webmin/cluster-copy/config' \
'etc/webmin/cluster-cron/config' \
'etc/webmin/cluster-passwd/config' \
'etc/webmin/cluster-shell/config' \
'etc/webmin/cluster-software/config' \
'etc/webmin/cluster-useradmin/config' \
'etc/webmin/cluster-usermin/config' \
'etc/webmin/cluster-webmin/config' \
'etc/webmin/cron/config' \
'etc/webmin/custom/config' \
'etc/webmin/dhcpd/config' \
'etc/webmin/dovecot/config' \
'etc/webmin/exim/config' \
'etc/webmin/exports/config' \
'etc/webmin/fail2ban/config' \
'etc/webmin/fdisk/config' \
'etc/webmin/fetchmail/config' \
'etc/webmin/file/config' \
'etc/webmin/filemin/config' \
'etc/webmin/filter/config' \
'etc/webmin/firewall/config' \
'etc/webmin/firewall6/config' \
'etc/webmin/firewalld/config' \
'etc/webmin/fsdump/config' \
'etc/webmin/heartbeat/config' \
'etc/webmin/htaccess-htpasswd/config' \
'etc/webmin/idmapd/config' \
'etc/webmin/init/config' \
'etc/webmin/inittab/config' \
'etc/webmin/ipsec/config' \
'etc/webmin/iscsi-client/config' \
'etc/webmin/iscsi-server/config' \
'etc/webmin/iscsi-target/config' \
'etc/webmin/iscsi-tgtd/config' \
'etc/webmin/jabber/config' \
'etc/webmin/krb5/config' \
'etc/webmin/ldap-client/config' \
'etc/webmin/ldap-server/config' \
'etc/webmin/ldap-useradmin/config' \
'etc/webmin/logrotate/config' \
'etc/webmin/lpadmin/config' \
'etc/webmin/lvm/config' \
'etc/webmin/mailboxes/config' \
'etc/webmin/mailcap/config' \
'etc/webmin/man/config' \
'etc/webmin/mon/config' \
'etc/webmin/mount/config' \
'etc/webmin/mysql/config' \
'etc/webmin/net/config' \
'etc/webmin/nis/config' \
'etc/webmin/openslp/config' \
'etc/webmin/pam/config' \
'etc/webmin/pap/config' \
'etc/webmin/passwd/config' \
'etc/webmin/phpini/config' \
'etc/webmin/postfix/config' \
'etc/webmin/postgresql/config' \
'etc/webmin/ppp-client/config' \
'etc/webmin/pptp-client/config' \
'etc/webmin/pptp-server/config' \
'etc/webmin/proc/config' \
'etc/webmin/procmail/config' \
'etc/webmin/proftpd/config' \
'etc/webmin/qmailadmin/config' \
'etc/webmin/quota/config' \
'etc/webmin/raid/config' \
'etc/webmin/samba/config' \
'etc/webmin/sarg/config' \
'etc/webmin/sendmail/config' \
'etc/webmin/servers/config' \
'etc/webmin/shell/config' \
'etc/webmin/shorewall/config' \
'etc/webmin/shorewall6/config' \
'etc/webmin/smart-status/config' \
'etc/webmin/spam/config' \
'etc/webmin/squid/config' \
'etc/webmin/sshd/config' \
'etc/webmin/status/config' \
'etc/webmin/stunnel/config' \
'etc/webmin/syslog/config' \
'etc/webmin/system-status/config' \
'etc/webmin/tcpwrappers/config' \
'etc/webmin/telnet/config' \
'etc/webmin/time/config' \
'etc/webmin/tunnel/config' \
'etc/webmin/updown/config' \
'etc/webmin/useradmin/config' \
'etc/webmin/usermin/config' \
'etc/webmin/vgetty/config' \
'etc/webmin/webalizer/config' \
'etc/webmin/webmin/config' \
'etc/webmin/webmincron/config' \
'etc/webmin/webminlog/config' \
'etc/webmin/wuftpd/config' \
'etc/webmin/xinetd/config' \
'etc/pam.d/webmin' )
source=(http://downloads.sourceforge.net/sourceforge/webadmin/$pkgname-$pkgver.tar.gz
        webmin-config.tar.bz2
        webmin.pam
        webmin.service)
options=(!strip !zipman)

prepare() {
  cd "$srcdir"/$pkgname-$pkgver

  # remove modules that we do not support
  rm -r {bsdexports,bsdfdisk,cpan,dfsadmin,format,grub,hpuxexports,inetd,ipfilter,ipfw,package-updates,rbac,sgiexports,smf,software,syslog-ng,zones}

  # delete stuff that is not needed
  rm mount/freebsd-mounts* mount/netbsd-mounts* mount/openbsd-mounts* mount/macos-mounts*
  rm webmin-gentoo-init webmin-init webmin-daemon

  # remove config files for other distros, add only Arch linux
  find . ! -name 'config-generic-linux' ! -name 'config-\*-linux' ! -name 'config-lib.pl' -name 'config-*' -exec rm '{}' \+
  echo 'Archlinux	Any version	generic-linux	*	-d "/etc/pacman.d"' > os_list.txt

  # remove update stuff to avoid problems with updating webmin, modules and themes without pacman
  rm {webmin,usermin}/{update.cgi,update.pl,update_sched.cgi,upgrade.cgi,edit_upgrade.cgi,install_mod.cgi,delete_mod.cgi,install_theme.cgi}

  # copy Arch linux config files
  cp -rp "$srcdir"/webmin-config/* "$srcdir"/$pkgname-$pkgver/

  # Fix setup.sh
  sed -i -e 's:exit 13::g' "$srcdir"/$pkgname-$pkgver/setup.sh
}

package() {
  # create basic dirs
  mkdir -p "$pkgdir"/{etc,opt,var/log}

#  # copy stuff to right dirs
#  cp -rp "$srcdir"/$pkgname-$pkgver/* "$pkgdir"/opt/webmin

  # define parameters for setup.sh
  config_dir="$pkgdir"/etc/webmin
  var_dir="$pkgdir"/var/log/webmin
  perl=/usr/bin/perl
  autoos=1
  port=10000
  login=root
  crypt="x"
  ssl=1
  atboot=0
  nostart=1
  nochown=1
  autothird=1
  nouninstall=1
  atbootyn=n
  tempdir="$pkgdir"/tmp
  pam=webmin
  export config_dir var_dir perl autoos port login crypt ssl atboot nostart nochown autothird nouninstall atbootyn tempdir pam
  cd "$srcdir"/$pkgname-$pkgver
  "$srcdir"/$pkgname-$pkgver/setup.sh "$pkgdir"/opt/webmin

  # more logging and other config changes
  echo -e 'logfiles=1\nlogfullfiles=1\ngotoone=1\nnoremember=1' >> "$pkgdir"/etc/webmin/config

  # Fixup the config files to use their real locations
  sed -i 's:^pidfile=.*$:pidfile=/run/webmin.pid:' "$pkgdir"/etc/webmin/miniserv.conf
  find "$pkgdir"/etc/webmin -type f -exec sed -i "s:$pkgdir::g" {} \+

  # Use pam
  echo -e 'pam_only=1\npam_end=1\npam_conv=\nno_pam=0\nlogouttime=10' >> "$pkgdir"/etc/webmin/miniserv.conf

  # install sources
  install -D -m 644 $srcdir/webmin.service $pkgdir/usr/lib/systemd/system/webmin.service
  install -D -m 644 "$srcdir"/webmin.pam "$pkgdir"/etc/pam.d/webmin
  install -D -m 644 "$srcdir"/$pkgname-$pkgver/LICENCE "$pkgdir"/usr/share/licenses/webmin/LICENCE

  # delete temp dir
  rm -r "$pkgdir"/tmp
}


sha256sums=('b4cc63a369026e4e6d8f5af7501fe101dc122d9edbdd6bb20058f8f511694ce3'
            'd326da95233341ed0a6d51c6c28d9b47b5bbe8c1ae8e03e2578c24191dd14383'
            'a979e236681c6a06906937cf0f012e976347af5d6d7e7ae04a11acb01cc2689d'
            'a1bdc68e3b0970a5c8e5063bd882b0469664ca782b34faecee22af5c6c30dd11')
