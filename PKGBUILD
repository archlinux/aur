# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The OpenTelemetry C/C++ special interest group (SIG)
#         meets regularly. See the OpenTelemetry community repo for
#         information on this and other language SIGs.
#         (https://github.com/open-telemetry/community)


pkgname=opentelemetry-cpp
pkgver="1.20.0"
_proto_version="1.6.0"
pkgrel=2
pkgdesc="The C++ OpenTelemetry client."
arch=("x86_64" "armv7h")
url="https://github.com/open-telemetry/"
license=("Apache-2.0")
depends=("grpc" "nlohmann-json" "benchmark" "abseil-cpp" "protobuf" "curl")
makedepends=("doxygen" "cmake")
source=(
  "https://github.com/open-telemetry/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
  "https://github.com/open-telemetry/opentelemetry-proto/archive/refs/tags/v${_proto_version}.tar.gz"
)
sha256sums=(
  "4b6eeb852f075133c21b95948017f13a3e21740e55b921d27e42970a47314297"
  "92682778affe8d00cd36f68308b49295db34fce379bef0a781c50837eccbc3c0"
)

build() {
  cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr \
    -DOTELCPP_PROTO_PATH="${srcdir}/opentelemetry-proto-${_proto_version}" \
    -DWITH_OTLP_GRPC=ON -DWITH_OTLP_HTTP=ON -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DOPENTELEMETRY_INSTALL=ON
  make -C build
}

check() {
  ctest --test-dir build
}

package() {
  make -C build DESTDIR=${pkgdir} install
}
