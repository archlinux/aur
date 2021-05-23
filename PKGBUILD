# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=icecream-cpp-git
pkgver=0.3.1.r13.g0f77e26
pkgrel=1
pkgdesc="Single header library for print debugging in C++11 and forward"
arch=('x86_64')
url="https://github.com/renatogarcia/icecream-cpp"
license=('MIT')
makedepends=('cmake>=3.16' 'git' 'boost>=1.71.0')
checkdepends=('cmake>=3.16')
provides=('icecream-cpp' 'icecream-debugging')
conflicts=('icecream-cpp')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver()  {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

check() {
  export CPP_STANDARD=11
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -Wno-dev \
    -B build \
    -S "$pkgname"
  make -C build
  make -C build test
}

package() {
  DESTDIR="$pkgdir" make -C build install
  cd "$pkgname"
  install -Dvm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
