# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=libplacebo-git
pkgver=v0.4.0.44.g63d1bec
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives. (GIT version)'
url='https://github.com/haasn/libplacebo'
arch=('x86_64')
license=('LGPL2.1')
depends=('vulkan-icd-loader')
makedepends=('git'
             'meson'
             'ninja'
             'vulkan-headers'
             )
source=(git+https://github.com/haasn/libplacebo.git)
sha256sums=('SKIP')

pkgver() {
  cd libplacebo
  echo "$(git describe --long --tags |tr - .)"
}

prepare() {
  mkdir -p build

  cd build
  arch-meson ../libplacebo \
    -D tests=true \
    -D vulkan=true
}

build() {
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 libplacebo/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
