# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgbase=gtest-py3
pkgname=('gtest-py3' 'gmock-py3')
pkgver=1.10.0
pkgrel=2
pkgdesc='Google Test - C++ testing utility'
url='https://github.com/google/googletest'
arch=('x86_64')
license=('BSD')
makedepends=('python' 'cmake' 'gcc-libs' 'sh')
_srcname=googletest-release-${pkgver}
source=(${_srcname}.tar.gz::https://github.com/google/googletest/archive/release-${pkgver}.tar.gz
        gtest-1.10.0-libversion.patch)
sha512sums=('bd52abe938c3722adc2347afad52ea3a17ecc76730d8d16b065e165bc7477d762bce0997a427131866a89f1001e3f3315198204ffa5d643a9355f1f4d0d7b1a9'
            '57d18cdd2d7b744c4e759a51899372befc78624de00fccc71464293f8c36d32f7dd3bb87ec55fc0303031a397bbba5d45075662687cf5bba378f5001dabf2faa')

prepare() {
  cd ${_srcname}
  cp ../gtest-1.10.0-libversion.patch gtest-1.10.0-libversion.patch
  sed "s|__GOOGLETEST_VERSION__|${pkgver}|g" -i gtest-1.10.0-libversion.patch
  # https://src.fedoraproject.org/rpms/gtest/tree/master
  patch -Np1 -i gtest-1.10.0-libversion.patch

  # fixup version as they are never correct
  sed -E "s|(GOOGLETEST_VERSION) [0-9\\.]+|\\1 ${pkgver}|" -i CMakeLists.txt
}

build() {
  cmake -H${_srcname} -Bbuild \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DPython_ADDITIONAL_VERSIONS=2.7 \
    -Dgtest_build_tests=ON
  cmake --build build

}

check() {
  cmake --build build --target test
}

package_gtest-py3() {
  pkgdesc='Google Test - C++ testing utility based on the xUnit framework (like JUnit)'
  depends=('gcc-libs' 'sh')
  provides=('gtest')
  conflicts=('gtest')

  DESTDIR="${pkgdir}" cmake --build build --target install

  # Shouldn't be present
  find "${pkgdir}" -name '*.pump' -printf 'Removing %P\n' -delete

  # Split gmock
  mkdir -p gmock/{include,lib/pkgconfig}
  mv "${pkgdir}"/usr/include/gmock gmock/include/
  mv "${pkgdir}"/usr/lib/libgmock* gmock/lib/
  mv "${pkgdir}"/usr/lib/pkgconfig/gmock* gmock/lib/pkgconfig/

  cd ${_srcname}/googletest
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md CONTRIBUTORS -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 755 scripts/gtest-config.in -t "${pkgdir}/usr/bin"
  install -Dm 644 cmake/* -t "${pkgdir}/usr/src/googletest/cmake"
  install -Dm 644 src/* -t "${pkgdir}/usr/src/googletest/src"
  install -Dm 644 CMakeLists.txt -t "${pkgdir}/usr/src/googletest"
}

package_gmock-py3() {
  pkgdesc='Google Mock - A library for writing and using C++ mock classes'
  depends=('python' 'gtest' 'gcc-libs' 'sh')
  provides=('gmock')
  conflicts=('gmock')

  mv gmock "${pkgdir}/usr"

  cd ${_srcname}/googlemock
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md CONTRIBUTORS -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 755 scripts/gmock-config.in -t "${pkgdir}/usr/bin"
  install -Dm 644 cmake/* -t "${pkgdir}/usr/src/gmock/cmake"
  install -Dm 644 src/* -t "${pkgdir}/usr/src/gmock/src"
  install -Dm 644 CMakeLists.txt -t "${pkgdir}/usr/src/gmock"
  install -Dm 644 scripts/generator/{*.py,LICENSE,README*} -t "${pkgdir}/usr/share/gmock/generator"
  install -Dm 644 scripts/generator/cpp/* -t "${pkgdir}/usr/share/gmock/generator/cpp"

  sed -i 's|src/||' "${pkgdir}/usr/src/gmock/src/gmock-all.cc"

  python -m compileall -d /usr/share/gmock "${pkgdir}/usr/share/gmock"
  python -O -m compileall -d /usr/share/gmock "${pkgdir}/usr/share/gmock"
}

# vim: ts=2 sw=2 et:
