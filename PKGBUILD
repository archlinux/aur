# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=regexxer
pkgver=0.10
pkgrel=10
pkgdesc="Interactive search and replace tool for GNOME"
arch=('x86_64')
url="http://regexxer.sourceforge.net/"
license=('GPL')
depends=('gtksourceviewmm')
makedepends=('intltool')
source=(https://download.gnome.org/sources/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz
        regexxer.appdata.xml
        regexxer-glib2.32.patch
        fix-deprecated.patch)
sha256sums=('2a7832541a0306b3d4eb63a1cf8978d7bbfc7927e9304473fe801d71fd99736c'
            'dafeaeacace596bc4313262090e15713b99d9f95420e535155735582d8dc206a'
            '1addebc552e4374f3f9ee778fb734c08c1ed3a4b2b5e70905f7c9287c9b34882'
            'e2548ccf46a4eeabcda4221f6feec6d961eaef7ae8f7a8998b6374c61a7ae77a')

prepare() {
  cd $pkgname-$pkgver

  # Port to glib 2.32
  patch -Np1 -i ../regexxer-glib2.32.patch

  # Fix deprecations
  patch -Np1 -i ../fix-deprecated.patch

  # Don't try to compile GSettings schemas when packaging
  sed -i '/GLIB_COMPILE_SCHEMAS/ d' Makefile.in
}

build() {
  cd $pkgname-$pkgver
  CXXFLAGS+=' -std=c++11'
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-schemas-compile
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 ../regexxer.appdata.xml "$pkgdir/usr/share/metainfo/regexxer.appdata.xml"
}
