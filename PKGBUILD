# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The OpenTelemetry C/C++ special interest group (SIG)
#         meets regularly. See the OpenTelemetry community repo for
#         information on this and other language SIGs.
#         (https://github.com/open-telemetry/community)


pkgname=opentelemetry-cpp
pkgver="1.29.0"
_proto_version="1.11.0"
pkgrel=1
pkgdesc="The C++ OpenTelemetry client."
arch=("x86_64" "armv7h")
url="https://github.com/open-telemetry/opentelemetry-cpp"
license=("Apache-2.0")
depends=("grpc" "abseil-cpp" "protobuf" "curl" "prometheus-cpp")
makedepends=("doxygen" "cmake" "nlohmann-json" "benchmark" "gtest")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/open-telemetry/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
  "opentelemetry-proto-${_proto_version}.tar.gz::https://github.com/open-telemetry/opentelemetry-proto/archive/refs/tags/v${_proto_version}.tar.gz"
  "predicate-factory-cstdint.patch"
  "aggregation-config-include.patch"
)
sha256sums=('63effc2b0aaef32c9543bd95c8c227f1c80da8248392a6d97e8a2c3ffbcf7ea1'
            'cefb4cf0dee432bdd0eb25af73ed4c996b16e80baea7f98285c413184c1b92ad'
            '2b435b73ee51ef66bc4dd3279687a59498972513b7578203667936aaf81ec6cb'
            '5cdaf40de86829e325d33862a78d6da8c0097507b2bde3c0ae80813ededb8b90')

prepare() {
  # missing <cstdint> includes, an error with GCC >= 16; both merged upstream
  # after 1.29.0
  cd "${pkgname}-${pkgver}"
  patch -N -p1 --input="${srcdir}/predicate-factory-cstdint.patch"
  patch -N -p1 --input="${srcdir}/aggregation-config-include.patch"
}

build() {
  cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr \
    -DOTELCPP_PROTO_PATH="${srcdir}/opentelemetry-proto-${_proto_version}" \
    -DWITH_OTLP_GRPC=ON -DWITH_OTLP_HTTP=ON -DBUILD_SHARED_LIBS=ON \
    -DWITH_PROMETHEUS=ON -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DOPENTELEMETRY_INSTALL=ON
  make -C build
}

check() {
  # these two bind the fixed OTLP ports 4317/4318 and fail on any host
  # already running a collector (upstream hardcodes the ports)
  ctest --test-dir build -E 'RetryIntegrationTests'
}

package() {
  make -C build DESTDIR=${pkgdir} install

  # cmake's install(DIRECTORY) recreates excluded subdirs; drop the leftovers
  find "${pkgdir}" -type d -empty -delete
}
