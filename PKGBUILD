# Maintainer: Øystein Sture <oysstu a protonmail d com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=google-cloud-cpp
pkgver=2.26.0
pkgrel=1
pkgdesc="C++ Client Libraries for Google Cloud Services"
arch=('i686' 'x86_64')
url="https://github.com/googleapis/google-cloud-cpp/"
license=('Apache-2.0')
makedepends=('cmake')
depends=('protobuf' 'grpc' 'nlohmann-json' 'c-ares' 'zlib' 'openssl' 'curl' 'abseil-cpp' 'google-crc32c')

# Update this one every release to avoid cmake FetchContent
# _GOOGLE_CLOUD_CPP_GOOGLEAPIS_COMMIT_SHA can be found in $srcdir/cmake/GoogleapisConfig.cmake
_googleapis_commit_sha="622e10a1e8b2b6908e0ac7448d347a0c1b4130de"

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/googleapis/google-cloud-cpp/archive/v${pkgver}.tar.gz"
        "googleapis-${_googleapis_commit_sha}.tar.gz::https://github.com/googleapis/googleapis/archive/${_googleapis_commit_sha}.tar.gz")
sha256sums=('91cd0552c68d85c0c07f9500771367034ea78f6814603275dcf8664472f8f37f'
            '33c62c03f9479728bdaa1a6553d8b35fa273d010706c75ea85cd8dfe1687586c')

build() {
  # Add the following to build everything instead of only the default libraries
  # -DGOOGLE_CLOUD_CPP_ENABLE=__ga_libraries__ \

  cmake -B build -S "${pkgname}-${pkgver}" \
           -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
           -DFETCHCONTENT_SOURCE_DIR_FOO="$srcdir/googleapis-${_googleapis_commit_sha}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DBUILD_TESTING=OFF \
           -DBUILD_SHARED_LIBS=ON \
           -DGOOGLE_CLOUD_CPP_ENABLE_EXAMPLES=OFF \
           -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
