# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Alexandre Bique <bique.alexandre@gmail.com>
# Contributor: Louis R. Marascio <lrm@fitnr.com>
# Contributor: Cody Maloney <cmaloney@theoreticalchaos.com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=gtest1.12
pkgver=1.12.1
pkgrel=1
pkgdesc='Google Test - C++ testing utility'
url='https://github.com/google/googletest'
arch=('x86_64')
license=('BSD')
depends=('gcc-libs' 'sh')
makedepends=('python' 'cmake' 'gcc-libs' 'sh')
optdepends=('python: gmock generator')
conflicts=('gmock' 'gtest')
replaces=('gmock')
provides=('gmock' 'gtest' 'gtest=1.12')
_srcname=googletest-release-${pkgver}
source=(${_srcname}.tar.gz::https://github.com/google/googletest/archive/release-${pkgver}.tar.gz
        gtest-version.patch)
sha512sums=('a9104dc6c53747e36e7dd7bb93dfce51a558bd31b487a9ef08def095518e1296da140e0db263e0644d9055dbd903c0cb69380cb2322941dbfb04780ef247df9c'
            'ad3ae6e8c503ff8391dbf9d71a3c3f65a058e7702816b614c985087c15a31d21ba59b96c881efa37106e7fc6d297c0653dea793cb99491655290a6d3fbddc90d')

prepare() {
  cd ${_srcname}
  cp ../gtest-version.patch gtest-version.patch
  sed "s|__GOOGLETEST_VERSION__|${pkgver}|g" -i gtest-version.patch
  patch -Np1 -i gtest-version.patch
}

build() {
  cmake -H${_srcname} -Bbuild \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -Dgtest_build_tests=ON
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install

  # Shouldn't be present
  find "${pkgdir}" -name '*.pump' -printf 'Removing %P\n' -delete

  cd ${_srcname}
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md CONTRIBUTORS -t "${pkgdir}/usr/share/doc/${pkgname}"

  cd googletest
  install -Dm 644 cmake/* -t "${pkgdir}/usr/src/googletest/cmake"
  install -Dm 644 src/* -t "${pkgdir}/usr/src/googletest/src"
  install -Dm 644 CMakeLists.txt -t "${pkgdir}/usr/src/googletest"

  cd ../googlemock
  install -Dm 644 cmake/* -t "${pkgdir}/usr/src/gmock/cmake"
  install -Dm 644 src/* -t "${pkgdir}/usr/src/gmock/src"
  install -Dm 644 CMakeLists.txt -t "${pkgdir}/usr/src/gmock"

  sed -i 's|src/||' "${pkgdir}/usr/src/gmock/src/gmock-all.cc"

  python -m compileall -d /usr/share/gmock "${pkgdir}/usr/share/gmock"
  python -O -m compileall -d /usr/share/gmock "${pkgdir}/usr/share/gmock"
}

# vim: ts=2 sw=2 et:
