# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=d-containers
_pkgname=containers
_pkgver=0.8.0
pkgver=${_pkgver/-/}
pkgrel=9
pkgdesc='Containers for D backed by std.experimental.allocator'
arch=('x86_64')
url='https://github.com/dlang-community/containers'
license=('Boost')
depends=('liblphobos')
makedepends=('meson' 'ldc' 'd-stdx-allocator')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha512sums=('cb3d5a02251922f920a32033bc5cca6d82b07e2a073d85bf729e71d6a3050deaf6c31b93b443c6287ad0ceb01ab5b3bc50b4d9c5df6066292175ceaf234f4c5c')

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
