# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=woff2-git
pkgver=1.0.2.r8.g0f4d304
pkgrel=2
pkgdesc="Web Open Font Format 2 reference implementation"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/google/woff2"
license=(MIT)
depends=(brotli)
makedepends=(git cmake ninja)
provides=(woff2 libwoff2common.so libwoff2dec.so libwoff2enc.so)
conflicts=(woff2)
source=("${pkgname}::git+https://github.com/google/woff2.git")
sha256sums=('SKIP')

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
