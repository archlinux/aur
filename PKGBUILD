# Maintainer: Your Name <your.email@example.com>
# Contributor: Community
pkgname=reflectcpp-git
pkgver=0
pkgrel=1
pkgdesc="A C++20 library for fast serialization, deserialization and validation using reflection"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/getml/reflect-cpp"
license=('MIT')
makedepends=(
  'cmake'
  'gcc'
  'ninja'
)
# reflectcpp is header-only + bundled deps, no runtime dependencies
depends=()
# Optional format support dependencies
optdepends=(
  'libxml2: for XML serialization support'
  'yaml-cpp: for YAML serialization support'
  'pugixml: for XML serialization support (alternative to libxml2)'
)
provides=("reflectcpp" "reflectcpp=${pkgver}")
conflicts=('reflectcpp')
source=("git+https://github.com/getml/reflect-cpp.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/reflect-cpp"
  git describe --tags --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "reflect-cpp"

  # Force C++20 to avoid std::expected requirement
  local cxx_standard=20

  cmake -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_TOOLCHAIN_FILE="" \
    -DCMAKE_CXX_STANDARD="${cxx_standard}" \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_MAKE_PROGRAM=$(which ninja) \
    -DBUILD_SHARED_LIBS=ON \
    -DREFLECTCPP_INSTALL=ON \
    -DREFLECTCPP_BUILD_SHARED=ON \
    -DREFLECTCPP_USE_STD_EXPECTED=OFF \
    -DREFLECTCPP_USE_BUNDLED_DEPENDENCIES=ON \
    -DREFLECTCPP_USE_VCPKG=OFF \
    -DREFLECTCPP_JSON=ON \
    -DREFLECTCPP_AVRO=OFF \
    -DREFLECTCPP_BSON=OFF \
    -DREFLECTCPP_CAPNPROTO=OFF \
    -DREFLECTCPP_CBOR=OFF \
    -DREFLECTCPP_CSV=OFF \
    -DREFLECTCPP_FLEXBUFFERS=OFF \
    -DREFLECTCPP_MSGPACK=OFF \
    -DREFLECTCPP_PARQUET=OFF \
    -DREFLECTCPP_TOML=ON \
    -DREFLECTCPP_UBJSON=OFF \
    -DREFLECTCPP_XML=ON \
    -DREFLECTCPP_YAML=ON \
    -DREFLECTCPP_BUILD_TESTS=OFF \
    -DREFLECTCPP_BUILD_BENCHMARKS=OFF

  cmake --build build -v
}

package() {
  cd "reflect-cpp"

  cmake --install build --prefix "${pkgdir}/usr"

  # Install license
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # Install documentation
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
