# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=xombe-git
pkgver=0.1.0.r0.g2f0a8e7
pkgrel=1
pkgdesc='C99 library implementing AMBE 2400 and AMBE+2 used by D-STAR and DMR (git)'
arch=('x86_64' 'aarch64')
url='https://github.com/9M2PJU/xombe'
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('xombe')
conflicts=('xombe')
source=("$pkgname::git+https://github.com/9M2PJU/xombe.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -S "$pkgname" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
