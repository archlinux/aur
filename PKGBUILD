# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The OpenTelemetry C/C++ special interest group (SIG)
#         meets regularly. See the OpenTelemetry community repo for
#         information on this and other language SIGs.
#         (https://github.com/open-telemetry/community)


pkgname=opentelemetry-cpp
pkgver="1.26.0"
_proto_version="1.10.0"
pkgrel=1
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
  "8a878777a18a013e0ee6604629d1b5f29b162354c14489ad1dccd370f14ac372"
  "52c85df79badc45da7e6a8735e8090b05a961b0208756187e1492a40db2d1f5f"
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
