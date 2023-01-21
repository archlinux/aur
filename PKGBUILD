# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=glom
pkgver=1.32.0
pkgrel=11
pkgdesc="An easy-to-use database designer and user interface"
arch=('x86_64')
url="https://www.glom.org/"
license=('GPL')
depends=('gettext' 'boost-libs' 'libgdamm' 'libxml++' 'python-gobject' 'libepc'
         'goocanvasmm' 'gtksourceviewmm' 'evince' 'postgresql' 'libgda-postgres')
makedepends=('intltool' 'python-sphinx' 'boost' 'itstool' 'libgda-mysql')
changelog=$pkgname.changelog
source=(https://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('53bf207ebca82c563b9e67bce977459a17e7fd94e35c27c196986736da248df1')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver
  sed -i 's/goocanvas-2\.0/goocanvas-3.0/' configure
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --with-postgres-utils=/usr/bin \
    --disable-update-mime-database \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
