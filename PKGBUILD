# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=flatcc-git
pkgver=20170802
pkgrel=1
pkgdesc="FlatBuffers Compiler and Library in C for C"
arch=('i686' 'x86_64')
makedepends=('cmake' 'git' 'make')
url="https://github.com/dvidelabs/flatcc"
license=('Apache')
options=('staticlibs')
source=(git+https://github.com/dvidelabs/flatcc)
sha256sums=('SKIP')
provides=('flatcc')
conflicts=('flatcc')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  mkdir -p build/install && cd build/install
  cmake \
    ../.. \
    -DBUILD_SHARED_LIBS=on \
    -DFLATCC_ALLOW_WERROR=off \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFLATCC_INSTALL=on
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  msg2 'Installing documentation...'
  install -Dm 644 *.md doc/* -t "$pkgdir/usr/share/doc/${pkgname%-git}"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install -C build/install/
}
