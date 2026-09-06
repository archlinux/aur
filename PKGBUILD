# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributor:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=lib32-libnsl-git
pkgver=2.0.1.r6.gc2702fc
pkgrel=1
pkgdesc='Public client interface library for NIS(YP) and NIS+'
arch=(x86_64)
url=https://github.com/thkukuk/libnsl
license=(LGPL2.1)
depends=(
  lib32-libtirpc
  libnsl
)
makedepends=(git)
provides=(lib32-libnsl libnsl.so)
conflicts=(lib32-libnsl)
source=(git+https://github.com/thkukuk/libnsl.git)
sha256sums=(SKIP)

pkgver() {
  cd libnsl

  git describe --long --tags --abbrev=7 |
    sed -E 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

build() {
  local configure_options=(
    --prefix=/usr
    --libdir=/usr/lib32
    --disable-static
  )

  cd libnsl

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkg-config'

  ./autogen.sh
  ./configure "${configure_options[@]}"
  make
}

package() {
  make DESTDIR="${pkgdir}" -C libnsl install
  rm -rf "${pkgdir}"/usr/include
}

# vim: ts=2 sw=2 et:
