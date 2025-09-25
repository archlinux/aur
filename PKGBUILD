# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The OpenTelemetry C/C++ special interest group (SIG)
#         meets regularly. See the OpenTelemetry community repo for
#         information on this and other language SIGs.
#         (https://github.com/open-telemetry/community)


pkgname=opentelemetry-cpp
pkgver="1.22.0"
_proto_version="1.7.0"
pkgrel=4
pkgdesc="The C++ OpenTelemetry client."
arch=("x86_64" "armv7h")
url="https://github.com/open-telemetry/opentelemetry-cpp"
license=("Apache-2.0")
depends=("grpc" "nlohmann-json" "benchmark" "abseil-cpp" "protobuf" "curl" "prometheus-cpp")
makedepends=("doxygen" "cmake")
source=(
  "https://github.com/open-telemetry/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
  "https://github.com/open-telemetry/opentelemetry-proto/archive/refs/tags/v${_proto_version}.tar.gz"
)
sha256sums=(
  "3428f433f4b435ed1fad64cbdbe75b7288c06f6297786a7036d65d5b9a1d215b"
  "11330d850f5e24d34c4246bc8cb21fcd311e7565d219195713455a576bb11bed"
)

build() {
  cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr \
    -DOTELCPP_PROTO_PATH="${srcdir}/opentelemetry-proto-${_proto_version}" \
    -DWITH_OTLP_GRPC=ON -DWITH_OTLP_HTTP=ON -DBUILD_SHARED_LIBS=ON \
    -DWITH_PROMETHEUS=ON -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DOPENTELEMETRY_INSTALL=ON
  make -C build
}

check() {
  ctest --test-dir build
}

package() {
  make -C build DESTDIR=${pkgdir} install
}
