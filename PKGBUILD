# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgbase=gtest-py3
pkgname=('gtest-py3' 'gmock-py3')
pkgver=1.8.1
pkgrel=1
pkgdesc='Google Test - C++ testing utility'
url='https://github.com/google/googletest'
arch=('x86_64')
license=('BSD')
makedepends=('python' 'cmake' 'gcc-libs' 'sh')
_srcname=googletest-release-${pkgver}
source=(${_srcname}.tar.gz::https://github.com/google/googletest/archive/release-${pkgver}.tar.gz
        gtest-1.8.1-libversion.patch
        gtest-1.8.1-null-pointer.patch)
sha512sums=('e6283c667558e1fd6e49fa96e52af0e415a3c8037afe1d28b7ff1ec4c2ef8f49beb70a9327b7fc77eb4052a58c4ccad8b5260ec90e4bceeac7a46ff59c4369d7'
            'e9bd9d65f6e54f71be0026b84c6543a71f9e3d5c0da92eb7f01df3f5937871eff2b8177e3680fec8d733888327eda5f5f3caaf88a3263ada542cdd2b42475ac5'
            'afa75f975d8aed453c901245dae753939958d8b72e3e5c52995efe7980f44de4fd1ea08f1b0a4cc927443d858de0a1fe34a919512ce05ae443bfb9600b08f029')

prepare() {
  cd ${_srcname}
  cp ../gtest-1.8.1-libversion.patch gtest-1.8.1-libversion.patch
  sed "s|__GOOGLETEST_VERSION__|${pkgver}|g" -i gtest-1.8.1-libversion.patch
  # https://src.fedoraproject.org/rpms/gtest/tree/master
  patch -Np1 -i gtest-1.8.1-libversion.patch
  patch -Np1 -i ../gtest-1.8.1-null-pointer.patch

  # fixup version as they are never correct
  sed -E "s|(GOOGLETEST_VERSION) [0-9\\.]+|\\1 ${pkgver}|" -i CMakeLists.txt
  sed -E "s|^( +)\\[[0-9\\.]+\\],$|\\1[${pkgver}],|" -i {googletest,googlemock,.}/configure.ac
  sed -E "s|(GTEST_MIN_VERSION)=\"1.8.0\"|\\1=\"${pkgver}\"|" -i googlemock/configure.ac
}

build() {
  mkdir -p build
  mkdir -p cmake
  cmake -H${_srcname} -Bbuild \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
  cmake build

  # Only for g{test,mock}-config
  cd ${_srcname}/googletest
  autoreconf -fvi
  ./configure --prefix=/usr
  cd ../googlemock
  autoreconf -fvi
  ./configure --prefix=/usr
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
  install -Dm 644 README.md CHANGES CONTRIBUTORS -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 755 scripts/gtest-config -t "${pkgdir}/usr/bin"
  install -Dm 644 m4/gtest.m4 -t "${pkgdir}/usr/share/aclocal"
  install -Dm 644 cmake/* -t "${pkgdir}/usr/src/gtest/cmake"
  install -Dm 644 src/* -t "${pkgdir}/usr/src/gtest/src"
  install -Dm 644 CMakeLists.txt -t "${pkgdir}/usr/src/gtest"
}

package_gmock-py3() {
  pkgdesc='Google Mock - A library for writing and using C++ mock classes'
  depends=('python' 'gtest' 'gcc-libs' 'sh')
  provides=('gmock')
  conflicts=('gmock')

  mv gmock "${pkgdir}/usr"

  cd ${_srcname}/googlemock
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md CHANGES CONTRIBUTORS -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 755 scripts/gmock-config -t "${pkgdir}/usr/bin"
  install -Dm 644 src/* -t "${pkgdir}/usr/src/gmock"
  install -Dm 644 scripts/generator/{*.py,LICENSE,README*} -t "${pkgdir}/usr/share/gmock/generator"
  install -Dm 644 scripts/generator/cpp/* -t "${pkgdir}/usr/share/gmock/generator/cpp"

  sed -i 's|src/||' "${pkgdir}/usr/src/gmock/gmock-all.cc"

  python -m compileall -d /usr/share/gmock "${pkgdir}/usr/share/gmock"
  python -O -m compileall -d /usr/share/gmock "${pkgdir}/usr/share/gmock"
}

# vim: ts=2 sw=2 et:
