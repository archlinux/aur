# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=regexxer
pkgver=0.10
pkgrel=4
pkgdesc="Interactive search and replace tool for GNOME"
arch=('i686' 'x86_64')
url="http://regexxer.sourceforge.net/"
license=('GPL')
depends=('gtksourceviewmm' 'dconf' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('intltool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz
        regexxer-glib2.32.patch)
sha256sums=('2a7832541a0306b3d4eb63a1cf8978d7bbfc7927e9304473fe801d71fd99736c'
            '1addebc552e4374f3f9ee778fb734c08c1ed3a4b2b5e70905f7c9287c9b34882')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Port to glib 2.32
  patch -Np1 -i "$srcdir/regexxer-glib2.32.patch"

  # Don't try to compile GSettings schemas when packaging
  sed -i '/GLIB_COMPILE_SCHEMAS/ d' Makefile.in
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
