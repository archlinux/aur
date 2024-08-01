# Maintainer: Øystein Sture <oysstu a protonmail d com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=google-cloud-cpp
pkgver=2.27.0
pkgrel=1
pkgdesc="C++ Client Libraries for Google Cloud Services"
arch=('i686' 'x86_64')
url="https://github.com/googleapis/google-cloud-cpp/"
license=('Apache-2.0')
makedepends=('cmake')
depends=('protobuf' 'grpc' 'nlohmann-json' 'c-ares' 'zlib' 'openssl' 'curl' 'abseil-cpp' 'google-crc32c')

# Update this one every release to avoid cmake FetchContent
# _GOOGLE_CLOUD_CPP_GOOGLEAPIS_COMMIT_SHA can be found in $srcdir/cmake/GoogleapisConfig.cmake
_googleapis_commit_sha="e3838fbf057c3b69efc1e0b8e1a5a288ee91a00d"

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/googleapis/google-cloud-cpp/archive/v${pkgver}.tar.gz"
        "googleapis-${_googleapis_commit_sha}.tar.gz::https://github.com/googleapis/googleapis/archive/${_googleapis_commit_sha}.tar.gz")
sha256sums=('333fe00210ce1a6f0c1b51c232438a316eaf2c7a1724f75d0b2c64f8fc456aa7'
            '2966f46125ef3665329340288771e85fb8f6e289b2f4f9adb972fdb42d49e180')

prepare() {
  # Symlink from googleapis to exernalproject folder
  mkdir -p "${srcdir}/build/external/googleapis/src"
  ln -sf "${srcdir}/googleapis-${_googleapis_commit_sha}.tar.gz" "${srcdir}/build/external/googleapis/src/${_googleapis_commit_sha}.tar.gz"
}

build() {
  # Add the following to build everything instead of only the default libraries
  # -DGOOGLE_CLOUD_CPP_ENABLE=__ga_libraries__ \

  cmake -B build -S "${pkgname}-${pkgver}" \
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
