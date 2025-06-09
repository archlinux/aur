# Maintainer:
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=d-containers
_pkgname=containers
_pkgver=0.9.0
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc='Containers for D backed by std.experimental.allocator'
arch=('x86_64')
url='https://github.com/dlang-community/containers'
license=('Boost')
depends=('liblphobos')
makedepends=('meson' 'ldc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha512sums=('627253a92f985b9b17cd127a7ea2db0a206981a5aa8d1b6bb10f012c771b10d373742f0e58205cd42dd37ff25cf521e0425768b2f33e9846d445dfc607d5ac53')

build() {
  mkdir -p $_pkgname-$_pkgver/build
  cd $_pkgname-$_pkgver/build

  # Force build with LDC
  export DC=ldc
  export LDFLAGS="$(echo -ne $LDFLAGS | sed -e 's/-flto=auto/-flto=full/')"

  arch-meson ..

  ninja
}

check() {
  cd $_pkgname-$_pkgver/build

  ninja test
}

package() {
  cd $_pkgname-$_pkgver/build

  DESTDIR="$pkgdir" ninja install
}
