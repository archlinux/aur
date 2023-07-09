# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Upstream Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Upstream Maintainer: Edward Tjörnhammar <xhemi@cube2.se>
# Upstream Contributor: Edward Tjörnhammar <xhemi@cube2.se>

pkgname=inn-git
_pkgname=inn
pkgver=2.8.0.e370638
pkgrel=1
pkgdesc="Complete open source Usenet system. De facto standard for handling news routing, news spool and serving the spool to customers."
url="https://www.isc.org/othersoftware/"
arch=('x86_64')
license=("custom:INN")
depends=('openssl' 'perl-mime-tools' 'perl-gd' 'pam' 'db5.3')
makedepends=('make' 'bison' 'python' 'gcc' 'smtp-forwarder' 'libsasl' 'sqlite' 'git' 'autoconf')
optdepends=('python' 'libsasl'
            'sqlite: ovsqlite-server')
options=(emptydirs docs zipman)
install=inn.install
backup=(etc/inn/innwatch.ctl
	etc/inn/innfeed.conf
	etc/inn/moderators
	etc/inn/news2mail.cf
	etc/inn/innshellvars.tcl.local
	etc/inn/buffindexed.conf
	etc/inn/newsfeeds
	etc/inn/storage.conf
	etc/inn/innshellvars.local
	etc/inn/inn-radius.conf
	etc/inn/nntpsend.ctl
	etc/inn/passwd.nntp
	etc/inn/send-uucp.cf
	etc/inn/cycbuff.conf
	etc/inn/incoming.conf
	etc/inn/control.ctl.local
	etc/inn/actsync.ign
	etc/inn/motd.innd.sample
	etc/inn/distributions
	etc/inn/innshellvars.pl.local
	etc/inn/readers.conf
	etc/inn/innreport.conf
	etc/inn/actsync.cfg
	etc/inn/nocem.ctl
	etc/inn/control.ctl
	etc/inn/subscriptions
	etc/inn/motd.nnrpd.sample
	etc/inn/inn.conf
	etc/inn/ovdb.conf
	etc/inn/localgroups
	etc/inn/nnrpd.track
	etc/inn/distrib.pats
	etc/inn/expire.ctl
	etc/inn/inn-secrets.conf
	etc/inn/ovsqlite.conf
	var/db/inn/active
	var/db/inn/active.times
	var/db/inn/history
	var/db/inn/history.dir
	var/db/inn/history.hash
	var/db/inn/history.index
	var/db/inn/newsgroups)
validpgpkeys=('E784364E8DDE7BB370FBD9EAD15D313882004173')
source=("git+https://github.com/InterNetNews/inn"
	innd.service
	inn.tmpfiles
	inn.sysusers)
sha256sums=('SKIP'
            'b8658c900f5bce5d0b09b595496137e5f3e93bbcdc1fb1f751783e6e2873de21'
            'f58a06718396628bf110de21c052cf29c0d2e7bd0c7bd645d43b592b6ac549d4'
            'a8c269bc006eb39a140af1538a0812c54ea11f444867c28f5e9792bfdd4df71a')

prepare() {
  # fix configure file missing from git repo...
  #cp configure "$srcdir"/inn/
  cd "$srcdir"/inn
  ./autogen
  # Override unreproducible hostname
  sed -i 's/HOSTNAME=`hostname 2> \/dev\/null || uname -n`/HOSTNAME=archlinux/' configure
  sed -i 's/-ldb/-ldb-5.3/g' configure
}

build() {
  cd "$srcdir"/inn
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  PYTHON=/usr/bin/python ./configure --prefix=/usr \
	--includedir=/usr/include/inn \
	--sbindir=/usr/sbin \
	--with-libtool \
	--with-gnu-id \
  --with-bdb-include=/usr/include/db5.3 \
	--with-db-dir=/var/db/inn \
	--sysconfdir=/etc/inn \
	--with-spool-dir=/var/spool/news \
	--with-log-dir=/var/log/inn \
	--with-run-dir=/var/run/inn \
	--with-tmp-dir=/var/spool/inn/tmp \
	--enable-largefiles \
	--with-openssl=/usr \
	--with-perl \
	--with-python \
	--with-sendmail=/usr/bin/msmtp \
	--with-sasl=/usr \
	--with-news-user=9 \
	--with-news-group=13
  # See https://wiki.archlinux.org/index.php/DeveloperWiki:UID_/_GID_Database
  test -f include/config.h
  cat >>include/config.h <<EOF
#undef RUNASUSER
#define RUNASUSER "news"
#undef RUNASGROUP
#define RUNASGROUP "news"
EOF
  make
}

package() {
  cd "$srcdir"/inn
  export LD_LIBRARY_PATH=.:"$pkgdir"/usr/lib:$LD_LIBRARY_PATH

  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr/lib
  for i in lib*.a; do
	gcc -shared -o ${i%%.a}.so.2.0.0 $i
	for j in 2.0 2; do
	    ln -s ${i%%a}so.2.0.0 ${i%%a}so.$j
	done
  done

  touch "$pkgdir"/var/db/inn/history{.dir,.hash,.index,}

  mkdir -p "$pkgdir"/usr/share/doc/inn "$pkgdir"/usr/share/inn/
#  mv "$pkgdir"/usr/share/man/man3/list.3 "$pkgdir"/usr/share/man/man3/list-inn.3
  mv "$pkgdir"/usr/doc/* "$pkgdir"/usr/share/doc/inn/
  mv "$pkgdir"/usr/http/* "$pkgdir"/usr/share/inn/
  mv "$pkgdir"/usr/bin/archive "$pkgdir"/usr/bin/archive.inn
  rm -rf "$pkgdir"/usr/doc "$pkgdir"/usr/http "$pkgdir"/var/run
  install -D -m0644 "$srcdir"/inn/LICENSE "$pkgdir"/usr/share/licenses/inn/LICENSE
  chown root:root "$pkgdir"/usr/bin/innbind
  chmod 05555 "$pkgdir"/usr/bin/innbind

  install -Dm0644 "$srcdir"/innd.service "$pkgdir"/usr/lib/systemd/system/innd.service
  install -Dm0644 "$srcdir"/inn.sysusers "$pkgdir"/usr/lib/sysusers.d/inn.conf
  install -Dm0644 "$srcdir"/inn.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/inn.conf
}
