# Maintainer: Marti Raudsepp <marti@juffo.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=postgresql-testing
pkgver=9.0rc1
pkgrel=1
pkgdesc="Testing versions of the PostgreSQL database (includes both server and libs)"
arch=(i686 x86_64)
license=('BSD')
backup=('etc/conf.d/postgresql' 'etc/pam.d/postgresql')
url="http://www.postgresql.org/developer/beta"
options=(!strip) # to facilitate debugging of testing builds
depends=('libxml2' 'readline>=6.0' 'openssl' 'bash')
conflicts=('postgresql-libs' 'postgresql')
provides=("postgresql-libs=$pkgver" "postgresql=$pkgver")
source=(http://ftp.de.postgresql.org/packages/databases/PostgreSQL/source/v$pkgver/postgresql-$pkgver.tar.gz
        postgresql.rc postgresql.confd postgresql.pam)
md5sums=('b9d735bfca6d50cf0a091e6c453b61ed'
         '86e0161343ce80e544aba999f284bc88'
         'df6ddf9e2ab4700a3415f17c0f4f4172'
         '96f82c38f3f540b53f3e5144900acf17')

build() {
  cd $srcdir/postgresql-$pkgver || return 1

  ./configure --prefix=/usr --mandir=/usr/share/man \
    --with-docdir=/usr/share/doc --with-openssl \
    --datadir=/usr/share/postgresql --with-pam --with-libxml || return 1

  make || return 1
  make DESTDIR=$pkgdir install || return 1

  # adminpack contains functions used by pgAdmin III
  (
    cd contrib/adminpack;
    make || return 1;
    make DESTDIR=$pkgdir install || return 1
  )

  install -D -m755 $srcdir/postgresql.rc $pkgdir/etc/rc.d/postgresql || return 1
  install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/postgresql/LICENSE || return 1
  install -D -m644 $srcdir/postgresql.confd $pkgdir/etc/conf.d/postgresql || return 1
  install -D -m644 $srcdir/postgresql.pam $pkgdir/etc/pam.d/postgresql || return 1
}
