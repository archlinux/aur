# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=woff2-git
pkgver=1.0.2.r4.ga0d0ed7
pkgrel=1
pkgdesc="Web Open Font Format 2 reference implementation"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/google/woff2"
license=(custom:MIT)
depends=(brotli)
makedepends=(git cmake ninja)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/google/woff2.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  sed -i 's/NOT BUILD_SHARED_LIBS/TRUE/' CMakeLists.txt
}

build() {
  cd "$pkgname"
  cmake -G Ninja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
  ninja
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" ninja install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}
