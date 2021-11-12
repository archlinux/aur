# Maintainer: Aaron van Geffen <aaron@aaronweb.net>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Markus Martin <markus@archwyrm.net>

_pkgbase=yaml-cpp
pkgname=lib32-yaml-cpp
pkgver=0.7.0
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec (32-bits)"
url="https://github.com/jbeder/yaml-cpp"
arch=('x86_64')
license=('MIT')
depends=('lib32-gcc-libs' 'lib32-glibc')
makedepends=('cmake' 'gcc-multilib' 'ninja')
source=("https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-${pkgver}.tar.gz"
        https://patch-diff.githubusercontent.com/raw/jbeder/yaml-cpp/pull/1037.patch)
sha512sums=('2de0f0ec8f003cd3c498d571cda7a796bf220517bad2dc02cba70c522dddde398f33cf1ad20da251adaacb2a07b77844111f297e99d45a7c46ebc01706bbafb5'
            'c20d5e9393496052c3326d78555345b83a2345831d4cbfec8cf50f9576f2731ddc456148815b23dba3765b61a1a69b0c05c9618f91751dad124dbe8f7ca19609')

prepare() {
  cd "${_pkgbase}-${_pkgbase}-${pkgver}"
  patch -Np1 -i "${srcdir}"/1037.patch
}

build() {
  cd "${_pkgbase}-${_pkgbase}-${pkgver}"

  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake -GNinja \
        -Bbuild \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib32 \
        -DBUILD_SHARED_LIBS=ON \
        -DYAML_BUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release
  ninja -C build
}

check() {
  cd "${_pkgbase}-${_pkgbase}-${pkgver}"
  ninja -C build test
  build/test/yaml-cpp-tests
}

package() {
  cd "${_pkgbase}-${_pkgbase}-${pkgver}"
  DESTDIR="$pkgdir" ninja -C build install
  mv "${pkgdir}"/usr/share/cmake/yaml-cpp "${pkgdir}"/usr/lib32/cmake/yaml-cpp
  rm -rf "${pkgdir}"/usr/{include,share}
  rm -rf "${pkgdir}"/usr/{lib32,lib32/pkgconfig}/*{gtest,gmock}*
  rm -rf "${pkgdir}"/usr/lib32/cmake/GTest
}
