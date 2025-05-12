# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
# Contributor: Santiago Torres-Arias <santiago in el archlinux organization>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=mingw-w64-doctest
pkgver=2.4.12
pkgrel=1
pkgdesc='The lightest feature rich C++ single header testing framework'
arch=('any')
url='https://github.com/onqtam/doctest'
license=('MIT')
makedepends=('cmake')
source=("doctest-${pkgver}.tar.gz::https://github.com/doctest/doctest/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('73381c7aa4dee704bd935609668cf41880ea7f19fa0504a200e13b74999c2d70')
# Build fails with `buildflags` because ld.exe doesn't recognize `-z`
options=(!buildflags !strip)

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

build() {
  for _arch in ${_architectures}; do
    $_arch-cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_LIBDIR=lib \
          -DCMAKE_POLICY_VERSION_MINIMUM=3.0 \
          -DDOCTEST_WITH_TESTS=off \
          -S "${srcdir}/doctest-${pkgver}" \
          -B "build-$_arch"
    cmake --build "build-$_arch"
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build-$_arch
    ls build-$_arch/
    install -Dm 0644 "${srcdir}/doctest-${pkgver}/LICENSE.txt" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  done
}

# vim:set ts=2 sw=2 et:
