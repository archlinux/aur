# Maintainer: Aaron van Geffen <aaron@aaronweb.net>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Markus Martin <markus@archwyrm.net>

_pkgbase=yaml-cpp
pkgname=lib32-yaml-cpp
pkgver=0.8.0
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec (32-bits)"
url="https://github.com/jbeder/yaml-cpp"
arch=('x86_64')
license=('MIT')
depends=('lib32-gcc-libs' 'lib32-glibc')
makedepends=('cmake' 'gcc-multilib' 'ninja')
source=("https://github.com/jbeder/yaml-cpp/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('aae9d618f906117d620d63173e95572c738db518f4ff1901a06de2117d8deeb8045f554102ca0ba4735ac0c4d060153a938ef78da3e0da3406d27b8298e5f38e')

build() {
  cd "${_pkgbase}-${pkgver}"

  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake -GNinja \
        -Bbuild \
        -DYAML_CPP_BUILD_TESTS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib32 \
        -DBUILD_SHARED_LIBS=ON \
        -DYAML_BUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release
  ninja -C build
}

check() {
  cd "${_pkgbase}-${pkgver}"
  ninja -C build test
  build/test/yaml-cpp-tests
}

package() {
  cd "${_pkgbase}-${pkgver}"
  DESTDIR="$pkgdir" ninja -C build install
  rm -rf "${pkgdir}"/usr/{include,share}
  rm -rf "${pkgdir}"/usr/{lib32,lib32/pkgconfig}/*{gtest,gmock}*
  rm -rf "${pkgdir}"/usr/lib32/cmake/GTest
}
