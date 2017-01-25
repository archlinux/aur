# $Id$
# Maintainer: Jonathan Liu <net147@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Benjamin Andresen <benny@klapmuetz.org>
# Contributor: bekks <eduard.warkentin@gmx.de>

pkgname=pgadmin3-lts
pkgver=1.23.0a
pkgrel=2
pkgdesc="Comprehensive design and management interface for PostgreSQL (LTS by BigSQL)"
arch=('i686' 'x86_64')
url="https://www.bigsql.org/"
license=('custom')
depends=('wxgtk' 'postgresql-libs' 'libxslt')
makedepends=('libpqxx' 'krb5' 'postgresql' 'imagemagick')
provides=("pgadmin3=$pkgver")
conflicts=("pgadmin3")
source=("git+https://bitbucket.org/openscg/$pkgname.git#tag=REL-${pkgver//./_}")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir"
  convert $pkgname/pgadmin/include/images/pgAdmin3.ico pgAdmin3.png

  cd "$pkgname"
  CPPFLAGS+=" -fno-delete-null-pointer-checks"
  ./bootstrap
}

build() {
  cd "$srcdir/$pkgname"
  [ -f Makefile ] ||  ./configure --prefix=/usr --with-wx-version=3.0
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
  install -Dm644 i18n/pgadmin3.lng "$pkgdir/usr/share/pgadmin3/i18n"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 pgadmin/include/images/pgAdmin3.ico "$pkgdir/usr/share/pgadmin3/pgAdmin3.ico"
  install -Dm644 "$srcdir/pgAdmin3-1.png" "$pkgdir/usr/share/pgadmin3/pgAdmin3.png"

  install -Dm644 "$srcdir/pgAdmin3-3.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/pgAdmin3.png"
  install -Dm644 "$srcdir/pgAdmin3-2.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/pgAdmin3.png"
  install -Dm644 "$srcdir/pgAdmin3-1.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/pgAdmin3.png"

  install -Dm644 "pkg/pgadmin3.desktop" "$pkgdir/usr/share/applications/pgadmin3.desktop"
}
