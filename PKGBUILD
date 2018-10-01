# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Benjamin Andresen <benny@klapmuetz.org>
# Contributor: bekks <eduard.warkentin@gmx.de>

pkgname=pgadmin3
pkgver=1.22.2
pkgrel=6
pkgdesc="Comprehensive design and management interface for PostgreSQL"
arch=('x86_64')
url="http://www.pgadmin.org"
license=('custom')
# Dependency wxgtk3 is not supported due to segmentation fault (FS#54676)
depends=('wxgtk2' 'postgresql-libs' 'libxslt' 'libgcrypt')
makedepends=('libpqxx' 'krb5' 'postgresql' 'imagemagick')
validpgpkeys=('E0C4CEEB826B1FDA4FB468E024ADFAAF698F1519')
source=(https://ftp.postgresql.org/pub/pgadmin/pgadmin3/v${pkgver}/src/pgadmin3-${pkgver}.tar.gz{,.sig}
        pgadmin3-fix-segfault.patch)
sha256sums=('9b68b0e3d3f0a261344fb8196825967d1e7acaca1d8cc82c42e12368ca5844ac'
            'SKIP'
            'b175869b77bcbfa43f1bc256277966882789883792c4f9dd26038ec248def6a2')

prepare() {
  cd "$srcdir"
  convert pgadmin3-${pkgver}/pgadmin/include/images/pgAdmin3.ico pgAdmin3.png

# Fix segfault at startup (Debian)
  cd $pkgname-$pkgver
  patch -p1 -i ../pgadmin3-fix-segfault.patch
}

build() {
  cd "$srcdir"/pgadmin3-${pkgver}
  ./configure --prefix=/usr --with-wx-version=3.0 --with-libgcrypt
  make
}

package() {
  cd "$srcdir"/pgadmin3-${pkgver}

  make DESTDIR="$pkgdir/" install
  install -Dm644 i18n/$pkgname.lng "$pkgdir/usr/share/pgadmin3/i18n"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 pgadmin/include/images/pgAdmin3.ico "$pkgdir/usr/share/pgadmin3/pgAdmin3.ico"
  install -Dm644 "$srcdir/pgAdmin3-1.png" "$pkgdir/usr/share/pgadmin3/pgAdmin3.png"

  install -Dm644 "$srcdir/pgAdmin3-3.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/pgAdmin3.png"
  install -Dm644 "$srcdir/pgAdmin3-2.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/pgAdmin3.png"
  install -Dm644 "$srcdir/pgAdmin3-1.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/pgAdmin3.png"

  install -Dm644 "pkg/pgadmin3.desktop" "$pkgdir/usr/share/applications/pgadmin3.desktop"
}
