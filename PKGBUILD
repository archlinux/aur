# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=postgresql-testing
pkgver=9.2beta2
pkgrel=1
pkgdesc="Beta version of the PostgreSQL database (includes both server and libs)"
arch=(i686 x86_64)
license=('custom:PostgreSQL')
backup=('etc/conf.d/postgresql' 'etc/pam.d/postgresql')
url="http://www.postgresql.org/developer/alpha"
options=(!strip) # to facilitate debugging of testing builds
depends=('libxml2' 'readline' 'openssl')
makedepends=('python2' 'perl')
optdepends=('python2: PL/Python procedure support')
conflicts=('postgresql-libs' 'postgresql')
provides=("postgresql-libs=$pkgver" "postgresql=$pkgver")
source=("http://ftp.postgresql.org/pub/source/v9.2.0beta2/postgresql-$pkgver.tar.bz2"
        postgresql.rcd postgresql.confd postgresql.pam postgresql.logrotate)
install=postgresql.install

build() {
  cd $srcdir/postgresql-$pkgver

  ./configure --prefix=/usr \
  --mandir=/usr/share/man \
  --datadir=/usr/share/postgresql \
  --with-libxml \
  --with-openssl \
  --with-perl \
  --with-python PYTHON=/usr/bin/python2 \
  --with-pam \
  --with-system-tzdata=/usr/share/zoneinfo \
  --enable-nls \
  --enable-thread-safety
  #--with-krb5 \
  #--with-tcl \

  make world
}

package() {
  cd $srcdir/postgresql-$pkgver

  make DESTDIR=$pkgdir install

  # build all contrib modules
  make -C contrib
  make -C contrib DESTDIR=$pkgdir install

  install -D -m755 $srcdir/postgresql.rcd $pkgdir/etc/rc.d/postgresql
  install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 $srcdir/postgresql.confd $pkgdir/etc/conf.d/postgresql
  install -D -m644 $srcdir/postgresql.pam $pkgdir/etc/pam.d/postgresql
  install -D -m644 $srcdir/postgresql.logrotate $pkgdir/etc/logrotate.d/postgresql
}
md5sums=('f23eca70a6de56de73f0005a571c71b0'
         '1ddd1df8010549f237e7983bb326025e'
         'a54d09a20ab1672adf08f037df188d53'
         '96f82c38f3f540b53f3e5144900acf17'
         'd28e443f9f65a5712c52018b84e27137')
