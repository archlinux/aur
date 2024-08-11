# Maintainer: 
# Contributor: Øystein Sture <oysstu a protonmail d com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>

# Remember to update googleapis commit sha on every new version
# _GOOGLE_CLOUD_CPP_GOOGLEAPIS_COMMIT_SHA can be found in $srcdir/cmake/GoogleapisConfig.cmake
_googleapis_commit_sha="0a250ef2318e97b1b3153423e7af0fdbe5731741"

pkgname=google-cloud-cpp
pkgver=2.28.0
pkgrel=1
pkgdesc="C++ Client Libraries for Google Cloud Services"
arch=('i686' 'x86_64')
url="https://github.com/googleapis/google-cloud-cpp/"
license=('Apache-2.0')
makedepends=('cmake')
depends=('protobuf' 'grpc' 'nlohmann-json' 'c-ares' 'zlib' 'openssl' 'curl' 'abseil-cpp' 'google-crc32c')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/googleapis/google-cloud-cpp/archive/v${pkgver}.tar.gz"
        "googleapis-${_googleapis_commit_sha}.tar.gz::https://github.com/googleapis/googleapis/archive/${_googleapis_commit_sha}.tar.gz")
sha256sums=('1d51910cb4419f6100d8b9df6bccd33477d09f50e378f12b06dae0f137ed7bc6'
            '69e8b16d7653bf9649539268dd84ba42a8ddba88715d6047dd1e296057b8a93f')

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
