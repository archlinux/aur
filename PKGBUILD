# Maintainer: undefined <undefined_1@outlook.com>

pkgname=libwsman
_srcname=openwsman
pkgver=2.8.1
pkgrel=1
pkgdesc="OpenWSMAN C and C++ client libraries for WS-Management"
arch=('x86_64')
url="https://openwsman.github.io/"
license=('BSD-3-Clause')
depends=(curl glibc libgcc libstdc++ libxml2 openssl)
makedepends=(cmake)
provides=(libwsman.so libwsman_client.so libwsman_clientpp.so libwsman_curl_client_transport.so)
conflicts=(openwsman)
backup=('etc/openwsman/openwsman_client.conf')
source=("https://github.com/Openwsman/${_srcname}/archive/v${pkgver}/${_srcname}-${pkgver}.tar.gz")
sha256sums=('22f7dd418eda4d6e4d1c497fcc2a3e2ee91eeff3c19f4a4447dfaec38fd2b87b')

build() {
  cmake -S "${_srcname}-${pkgver}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}=." \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -ffile-prefix-map=${srcdir}=." \
    -DCMAKE_C_FLAGS_RELEASE='-DNDEBUG' \
    -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB=lib \
    -DBUILD_BINDINGS=OFF \
    -DBUILD_PYTHON=OFF \
    -DBUILD_PYTHON3=OFF \
    -DBUILD_RUBY=OFF \
    -DBUILD_PERL=OFF \
    -DBUILD_JAVA=OFF \
    -DBUILD_CSHARP=OFF \
    -DBUILD_SWIG_PLUGIN=OFF \
    -DBUILD_LIBCIM=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_TESTS=ON \
    -DDISABLE_PLUGINS=ON \
    -DDISABLE_SERVER=ON \
    -DUSE_PAM=OFF
  cmake --build build
}

check() {
  # The test_client_* integration tests require a configured WS-Man server.
  ctest --test-dir build --output-on-failure -E '^test_client_'
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # Upstream installs server metadata and configuration even with the server off.
  rm -f "${pkgdir}/usr/lib/pkgconfig/openwsman-server.pc"
  rm -rf "${pkgdir}/etc/init.d" "${pkgdir}/etc/pam.d"
  rm -f "${pkgdir}/etc/openwsman/"{openwsman.conf,ssleay.cnf,owsmangencert.sh}

  install -Dm644 "${_srcname}-${pkgver}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
