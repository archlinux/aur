# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgbase=python-opentelemetry
_basename=opentelemetry-python
pkgname=(
  "$pkgbase-api"
  "$pkgbase-sdk"
  "$pkgbase-proto"
  "$pkgbase-semantic-conventions"
  "$pkgbase-propagator-b3"
  "$pkgbase-propagator-jaeger"
  # "$pkgbase-exporter-opencensus"
  "$pkgbase-exporter-otlp-proto-common"
  "$pkgbase-exporter-otlp-proto-grpc"
  "$pkgbase-exporter-otlp-proto-http"
  "$pkgbase-exporter-otlp"
  "$pkgbase-exporter-prometheus"
  "$pkgbase-exporter-zipkin-json"
  "$pkgbase-exporter-zipkin-proto-http"
  "$pkgbase-exporter-zipkin"
)
_names=("${pkgname[@]#python-}")
_names=("${_names[@]/opentelemetry-propagator/propagator\/opentelemetry-propagator}")
_names=("${_names[@]/opentelemetry-exporter/exporter\/opentelemetry-exporter}")
pkgver=1.20.0
pkgrel=1
pkgdesc="OpenTelemetry Python API and SDK"
url="https://github.com/open-telemetry/opentelemetry-python"
license=(Apache)
arch=(any)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-hatchling
)
checkdepends=(
  python-backoff
  python-deprecated
  python-flaky
  python-googleapis-common-protos
  python-grpcio
  python-importlib-metadata
  # python-opencensus
  python-prometheus_client
  python-protobuf
  python-pytest
  python-pytest-benchmark
  python-requests
  python-responses
  python-typing_extensions
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('674b0dd59cbcfbdbd3cdb2e73df9c89433ce30c3e955467d8b9034ed7525e2cd')

_archive="$_basename-$pkgver"

prepare() {
  cd "$_archive"

  # Remove duplicate file causing conflict on install
  rm exporter/opentelemetry-exporter-zipkin-json/src/opentelemetry/exporter/zipkin/py.typed
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation tests/opentelemetry-test-utils
  for name in "${_names[@]}"; do
    python -m build --wheel --no-isolation "$name"
  done
}

check() {
  local site_packages
  site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "$_archive"

  python -m installer --destdir=tmp_install tests/opentelemetry-test-utils/dist/*.whl

  for name in "${_names[@]}"; do
    python -m installer --destdir=tmp_install "$name"/dist/*.whl
  done

  for name in "${_names[@]}"; do
    PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" python -m pytest "$name"
  done
}

_package() {
  local _path="$1"
  local _pkgname="$2"

  cd "$_archive"

  python -m installer --destdir="$pkgdir" "$_path/dist/"*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$_pkgname/LICENSE"
}

package_python-opentelemetry-api() {
  depends=(
    python
    python-deprecated
    python-importlib-metadata
  )

  _package opentelemetry-api "$pkgname"
}

package_python-opentelemetry-sdk() {
  depends=(
    python
    python-deprecated
    python-opentelemetry-api
    python-opentelemetry-semantic-conventions
    python-typing_extensions
  )

  _package opentelemetry-sdk "$pkgname"
}

package_python-opentelemetry-proto() {
  depends=(
    python-grpcio
    python-protobuf
  )

  _package opentelemetry-proto "$pkgname"
}

package_python-opentelemetry-semantic-conventions() {
  depends=(
    python
  )

  _package opentelemetry-semantic-conventions "$pkgname"
}

package_python-opentelemetry-propagator-b3() {
  depends=(
    python
    python-deprecated
    python-opentelemetry-api
  )

  _package propagator/opentelemetry-propagator-b3 "$pkgname"
}

package_python-opentelemetry-propagator-jaeger() {
  depends=(
    python
    python-opentelemetry-api
  )

  _package propagator/opentelemetry-propagator-jaeger "$pkgname"
}

# package_python-opentelemetry-exporter-opencensus() {
#   depends=(
#     python
#     python-grpcio
#     python-opencensus-proto
#     python-opentelemetry-api
#     python-opentelemetry-sdk
#     python-protobuf
#     python-setuptools
#   )

#   _package exporter/opentelemetry-exporter-opencensus $pkgname
# }

package_python-opentelemetry-exporter-otlp-proto-common() {
  depends=(
    python
    python-opentelemetry-api
    python-opentelemetry-proto
    python-opentelemetry-sdk
  )

  _package exporter/opentelemetry-exporter-otlp-proto-common "$pkgname"
}

package_python-opentelemetry-exporter-otlp-proto-grpc() {
  depends=(
    python
    python-backoff
    python-deprecated
    python-googleapis-common-protos
    python-grpcio
    python-opentelemetry-api
    python-opentelemetry-exporter-otlp-proto-common
    python-opentelemetry-proto
    python-opentelemetry-sdk
  )

  _package exporter/opentelemetry-exporter-otlp-proto-grpc "$pkgname"
}

package_python-opentelemetry-exporter-otlp-proto-http() {
  depends=(
    python
    python-backoff
    python-deprecated
    python-googleapis-common-protos
    python-opentelemetry-api
    python-opentelemetry-exporter-otlp-proto-common
    python-opentelemetry-proto
    python-opentelemetry-sdk
    python-requests
  )

  _package exporter/opentelemetry-exporter-otlp-proto-http "$pkgname"
}

package_python-opentelemetry-exporter-otlp() {
  depends=(
    python-opentelemetry-exporter-otlp-proto-grpc
    python-opentelemetry-exporter-otlp-proto-http
  )

  _package exporter/opentelemetry-exporter-otlp "$pkgname"
}

package_python-opentelemetry-exporter-prometheus() {
  depends=(
    python
    python-opentelemetry-api
    python-opentelemetry-sdk
    python-prometheus_client
  )

  _package exporter/opentelemetry-exporter-prometheus "$pkgname"
}

package_python-opentelemetry-exporter-zipkin-json() {
  depends=(
    python
    python-opentelemetry-api
    python-opentelemetry-sdk
    python-requests
  )

  _package exporter/opentelemetry-exporter-zipkin-json "$pkgname"
}

package_python-opentelemetry-exporter-zipkin-proto-http() {
  depends=(
    python
    python-opentelemetry-api
    python-opentelemetry-exporter-zipkin-json
    python-opentelemetry-sdk
    python-protobuf
    python-requests
  )

  _package exporter/opentelemetry-exporter-zipkin-proto-http "$pkgname"
}

package_python-opentelemetry-exporter-zipkin() {
  depends=(
    python-opentelemetry-exporter-zipkin-json
    python-opentelemetry-exporter-zipkin-proto-http
  )

  _package exporter/opentelemetry-exporter-zipkin "$pkgname"
}
