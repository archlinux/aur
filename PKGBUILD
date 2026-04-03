# Maintainer: Natounlars <198830487@qq.com>
pkgname=dragonbox-git
pkgver=1.1.3.r248.gbeeeef9
pkgrel=1
pkgdesc="Reference implementation of Dragonbox in C++: a float-to-string conversion algorithm"
arch=('any')
url="https://github.com/jk-jeon/dragonbox"
license=('Apache-2.0 WITH LLVM-exception' 'BSL-1.0')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('dragonbox')
conflicts=('dragonbox')
source=("dragonbox::git+https://github.com/jk-jeon/dragonbox.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/dragonbox"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || echo "0.0.0"
}

build() {
  cd "$srcdir/dragonbox"
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DDRAGONBOX_INSTALL_TO_CHARS=ON
  cmake --build .
}

package() {
  cd "$srcdir/dragonbox/build"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/dragonbox/LICENSE-Apache2-LLVM" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-Apache2-LLVM"
  install -Dm644 "$srcdir/dragonbox/LICENSE-Boost" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-Boost"
}
