# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=aom
pkgver=1.0.0
pkgrel=1
pkgdesc="An open, royalty-free video coding format designed for video transmissions over the Internet"
arch=('i686' 'x86_64')
url="https://aomedia.org/"
license=('BSD' 'custom:PATENTS')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'perl' 'yasm' 'doxygen' 'graphviz')
source=("git+https://aomedia.googlesource.com/aom#tag=v$pkgver")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir"

  mkdir -p "_build"
}

build() {
  cd "$srcdir/_build"

  cmake \
    -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=1 \
    ../aom
  make
}

check() {
  cd "$srcdir/_build"

  #make runtests
}

package() {
  cd "$srcdir/_build"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -R "docs/." "$pkgdir/usr/share/doc/$pkgname"

  cd "$srcdir/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "PATENTS" "$pkgdir/usr/share/licenses/$pkgname/PATENTS"
}
