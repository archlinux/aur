# $Id$
# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: Jonathan Liu <net147@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Benjamin Andresen <benny@klapmuetz.org>
# Contributor: bekks <eduard.warkentin@gmx.de>

pkgname=pgadmin3-lts-git
_pkgname=pgadmin3-lts
pkgver=r6397.7f3915ce4
pkgrel=1
pkgdesc="Comprehensive design and management interface for PostgreSQL (LTS by BigSQL)"
arch=('i686' 'x86_64')
url="https://www.bigsql.org/"
license=('custom')
# Dependency wxgtk3 is not supported due to segmentation fault (FS#54676)
depends=('wxgtk2' 'postgresql-libs' 'libxslt' 'libgcrypt')
makedepends=('libpqxx' 'krb5' 'postgresql' 'imagemagick' 'python-sphinx')
provides=("pgadmin3")
conflicts=("pgadmin3")
source=("git+https://bitbucket.org/openscg/$_pkgname.git"
  "pgadmin3-fix-segfault.patch")
sha256sums=('SKIP'
  'b175869b77bcbfa43f1bc256277966882789883792c4f9dd26038ec248def6a2')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
  convert $_pkgname/pgadmin/include/images/pgAdmin3.ico pgAdmin3.png


  cd "$_pkgname"
  patch -p1 -i ../pgadmin3-fix-segfault.patch

  CPPFLAGS+=" -fno-delete-null-pointer-checks"
  ./bootstrap
}

build() {
  cd "$srcdir/$_pkgname"
  [ -f Makefile ] ||  ./configure --prefix=/usr --with-wx-version=3.0 --with-libgcrypt
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install
  install -Dm644 i18n/pgadmin3.lng "$pkgdir/usr/share/pgadmin3/i18n"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  install -Dm644 pgadmin/include/images/pgAdmin3.ico "$pkgdir/usr/share/pgadmin3/pgAdmin3.ico"
  install -Dm644 "$srcdir/pgAdmin3-1.png" "$pkgdir/usr/share/pgadmin3/pgAdmin3.png"

  install -Dm644 "$srcdir/pgAdmin3-3.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/pgAdmin3.png"
  install -Dm644 "$srcdir/pgAdmin3-2.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/pgAdmin3.png"
  install -Dm644 "$srcdir/pgAdmin3-1.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/pgAdmin3.png"

  install -Dm644 "pkg/pgadmin3.desktop" "$pkgdir/usr/share/applications/pgadmin3.desktop"
}

# vim:set ts=2 sw=2 et:
