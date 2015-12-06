# EXIM-MYSQL (compiled with mysql support)
# Maintainer: Fabien Wang <fabienwang@free.fr>
# Based on exim package
# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=exim-mysql
pkgver=4.86
pkgrel=1
pkgdesc='Message Transfer Agent'
arch=('x86_64' 'i686')
url='http://www.exim.org/'
license=('GPL')
backup=(etc/mail/aliases etc/mail/exim.conf etc/logrotate.d/exim)
install=exim.install
depends=('gdbm' 'pcre' 'pam' 'openssl' 'libldap' 'libmysqlclient' 'sqlite3' 'tcp_wrappers')
provides=('smtp-server' 'smtp-forwarder')
conflicts=('smtp-server' 'smtp-forwarder')
options=('!makeflags')
source=(http://exim.mirror.fr/exim/exim4/exim-${pkgver}.tar.gz
        aliases
        exim.logrotate
        exim.Makefile
        exim-submission@.service
        exim.service
        exim@.service
        exim.socket
        exim-submission.socket)
md5sums=('4dca35aac41aefef9d6e98fe337d55a2'
         '4874006f0585253ddab027d441009757'
         'e18a535218718c5eb394ed5c9296fe06'
         '2675c17fa9e5bb63c0862fe6fa633377'
         '88cf76405367a6ed371d05db1d3c9565'
         'be8fdcf7b2d6b6368a21705e69743265'
         '6f5a5c2b0835b33f59d2513cce18c65b'
         '101a726e4d3f4d0074710273f9808022'
         '11b319ba0bd84911fa70e9bef2190715')

build() {
  cd exim-$pkgver

  echo "
BIN_DIRECTORY=/usr/bin
CONFIGURE_FILE=/etc/mail/exim.conf
EXIM_USER=exim
EXIM_GROUP=exim
SPOOL_DIRECTORY=/var/spool/exim
INCLUDE=-I/usr/include
ROUTER_ACCEPT=yes
ROUTER_DNSLOOKUP=yes
ROUTER_IPLITERAL=yes
ROUTER_MANUALROUTE=yes
ROUTER_QUERYPROGRAM=yes
ROUTER_REDIRECT=yes
TRANSPORT_APPENDFILE=yes
TRANSPORT_AUTOREPLY=yes
TRANSPORT_PIPE=yes
TRANSPORT_SMTP=yes
SUPPORT_MAILDIR=yes
LOOKUP_DBM=yes
LOOKUP_LSEARCH=yes
LOOKUP_MYSQL=yes
LOOKUP_SQLITE=yes
PCRE_LIBS=-lpcre
LOOKUP_INCLUDE=-I /usr/include/mysql
LOOKUP_LIBS=-L/usr/lib -lmysqlclient -lsqlite3
WITH_CONTENT_SCAN=yes
FIXED_NEVER_USERS=root
AUTH_CRAM_MD5=yes
AUTH_DOVECOT=yes
AUTH_PLAINTEXT=yes
AUTH_SPA=yes
HEADERS_CHARSET=\"UTF-8\"
SUPPORT_TLS=yes
TLS_LIBS=-L/usr/lib -lssl -lcrypto
TLS_INCLUDE=-I/usr/include/openssl
LOG_FILE_PATH=/var/log/exim/%slog
COMPRESS_COMMAND=/bin/gzip
COMPRESS_SUFFIX=gz
ZCAT_COMMAND=/bin/zcat
SUPPORT_PAM=yes
CFLAGS=-O -I/usr/include
EXTRALIBS_EXIM=-L/usr/lib -lwrap -lpam
SYSTEM_ALIASES_FILE=/etc/mail/aliases
CHOWN_COMMAND=/bin/chown
CHGRP_COMMAND=/bin/chgrp
CHMOD_COMMAND=/bin/chmod
MV_COMMAND=/bin/mv
RM_COMMAND=/bin/rm
TOUCH_COMMAND=/bin/touch
PERL_COMMAND=/usr/bin/perl
TMPDIR=\"/tmp\"
PID_FILE_PATH=/var/run/exim.pid
MAX_NAMED_LIST=16
SUPPORT_MOVE_FROZEN_MESSAGES=yes">"Local/Makefile"

  make
}

package() {
  cd exim-$pkgver

  install -Dm0644 ../exim.logrotate "$pkgdir"/etc/logrotate.d/exim
  install -Dm0644 doc/exim.8 "$pkgdir"/usr/share/man/man8/exim.8

  mkdir -p "$pkgdir"/var/spool/exim/db "$pkgdir"/etc/mail \
    "$pkgdir"/var/log/exim "$pkgdir"/usr/{lib,bin}

  chmod 770 "$pkgdir"/var/spool/exim{,/db} "$pkgdir"/var/log/exim

  cd build-Linux-*
  for i in exicyclog exim_checkaccess exim_dumpdb exim_lock exim_tidydb \
    exipick exiqsumm exigrep exim_dbmbuild exim exim_fixdb eximstats exinext \
    exiqgrep exiwhat; do
    install -m0755 "$i" "$pkgdir"/usr/bin
  done

  cd ../src
  sed -e "s|/etc/aliases|/etc/mail/aliases|g" \
    -e "s|SYSTEM_ALIASES_FILE|/etc/mail/aliases|g" \
    configure.default > "$pkgdir"/etc/mail/exim.conf

  cp "$srcdir"/aliases "$pkgdir"/etc/mail

  cd "$pkgdir"/usr/bin
  for i in mailq newaliases rmail rsmtp runq sendmail; do
    ln -s exim "$i"
  done

  # fhs compliancy
  ln -s ../bin/exim ../lib/sendmail

  install -Dm0644 "$srcdir"/exim-submission@.service \
    "$pkgdir"/usr/lib/systemd/system/exim-submission@.service
  install -Dm0644 "$srcdir"/exim.service \
    "$pkgdir"/usr/lib/systemd/system/exim.service
  install -Dm0644 "$srcdir"/exim@.service \
    "$pkgdir"/usr/lib/systemd/system/exim@.service
  install -Dm0644 "$srcdir"/exim.socket \
    "$pkgdir"/usr/lib/systemd/system/exim.socket
  install -Dm0644 "$srcdir"/exim-submission.socket \
    "$pkgdir"/usr/lib/systemd/system/exim-submission.socket
}

pre_build() {
  groupadd -g 79 exim
  useradd -u 79 -g exim -d /var/spool/exim -s /bin/false exim
}

post_remove() {
  groupdel exim
  userdel exim
}
