# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgbase=python-opentelemetry
_pkgbase=opentelemetry-python
pkgname=(
  python-opentelemetry-api
  # python-opentelemetry-exporter-opencensus
  python-opentelemetry-exporter-otlp
  python-opentelemetry-exporter-otlp-proto-common
  python-opentelemetry-exporter-otlp-proto-grpc
  python-opentelemetry-exporter-otlp-proto-http
  python-opentelemetry-exporter-prometheus
  python-opentelemetry-exporter-zipkin
  python-opentelemetry-exporter-zipkin-json
  python-opentelemetry-exporter-zipkin-proto-http
  python-opentelemetry-propagator-b3
  python-opentelemetry-propagator-jaeger
  python-opentelemetry-proto
  python-opentelemetry-sdk
  python-opentelemetry-semantic-conventions
  python-opentelemetry-test-utils
)
pkgver=1.22.0
pkgrel=3
pkgdesc="OpenTelemetry Python API and SDK"
url="https://github.com/open-telemetry/opentelemetry-python"
license=(Apache-2.0)
arch=(any)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  # python-opencensus
  python-backoff
  python-deprecated
  python-flaky
  python-googleapis-common-protos
  python-grpcio
  python-importlib-metadata
  python-prometheus_client
  python-protobuf
  python-pytest
  python-pytest-benchmark
  python-requests
  python-responses
  python-typing_extensions
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3b5b9020dec944e6f307786d018355e7bee7d9a09c7c9ccbb080c465c854594d')

_archive="$_pkgbase-$pkgver"

_pkgpaths=(
  opentelemetry-api
  # exporter/opentelemetry-exporter-opencensus
  exporter/opentelemetry-exporter-otlp
  exporter/opentelemetry-exporter-otlp-proto-common
  exporter/opentelemetry-exporter-otlp-proto-grpc
  exporter/opentelemetry-exporter-otlp-proto-http
  exporter/opentelemetry-exporter-prometheus
  exporter/opentelemetry-exporter-zipkin
  exporter/opentelemetry-exporter-zipkin-json
  exporter/opentelemetry-exporter-zipkin-proto-http
  propagator/opentelemetry-propagator-b3
  propagator/opentelemetry-propagator-jaeger
  opentelemetry-proto
  opentelemetry-sdk
  opentelemetry-semantic-conventions
  tests/opentelemetry-test-utils
)

prepare() {
  cd "$_archive"

  # Remove duplicate file causing conflict on install
  rm exporter/opentelemetry-exporter-zipkin-json/src/opentelemetry/exporter/zipkin/py.typed
}

build() {
  cd "$_archive"

  for path in "${_pkgpaths[@]}"; do
    python -m build --wheel --no-isolation "$path"
  done
}

check() {
  cd "$_archive"

  rm -rf ./tmp_install
  for path in "${_pkgpaths[@]}"; do
    python -m installer --destdir=tmp_install "$path/dist/"*.whl
  done

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"

  for path in "${_pkgpaths[@]}"; do
    [ "$path" = "tests/opentelemetry-test-utils" ] && continue
    pytest "$path"
  done
}

_package() {
  local path="$1"
  python -m installer --destdir="$pkgdir" "$_archive/$path/dist/"*.whl
}

package_python-opentelemetry-api() {
  depends=(
    python
    python-deprecated
    python-importlib-metadata
  )
  pkgdesc="OpenTelemetry Python API"
  _package opentelemetry-api
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
#   _package exporter/opentelemetry-exporter-opencensus
# }

package_python-opentelemetry-exporter-otlp() {
  depends=(
    python-opentelemetry-exporter-otlp-proto-grpc
    python-opentelemetry-exporter-otlp-proto-http
  )
  pkgdesc="OpenTelemetry Collector Exporters"
  _package exporter/opentelemetry-exporter-otlp
}

package_python-opentelemetry-exporter-otlp-proto-common() {
  depends=(
    python
    python-backoff
    python-opentelemetry-api
    python-opentelemetry-proto
    python-opentelemetry-sdk
  )
  pkgdesc="OpenTelemetry Protobuf encoding"
  _package exporter/opentelemetry-exporter-otlp-proto-common
}

package_python-opentelemetry-exporter-otlp-proto-grpc() {
  depends=(
    python
    python-deprecated
    python-googleapis-common-protos
    python-grpcio
    python-opentelemetry-api
    python-opentelemetry-exporter-otlp-proto-common
    python-opentelemetry-proto
    python-opentelemetry-sdk
  )
  pkgdesc="OpenTelemetry Collector Protobuf over gRPC Exporter"
  _package exporter/opentelemetry-exporter-otlp-proto-grpc
}

package_python-opentelemetry-exporter-otlp-proto-http() {
  depends=(
    python
    python-deprecated
    python-opentelemetry-api
    python-opentelemetry-exporter-otlp-proto-common
    python-opentelemetry-proto
    python-opentelemetry-sdk
    python-requests
  )
  pkgdesc="OpenTelemetry Collector Protobuf over HTTP Exporter"
  _package exporter/opentelemetry-exporter-otlp-proto-http
}

package_python-opentelemetry-exporter-prometheus() {
  depends=(
    python
    python-opentelemetry-api
    python-opentelemetry-sdk
    python-prometheus_client
  )
  pkgdesc="Prometheus Metric Exporter for OpenTelemetry"
  _package exporter/opentelemetry-exporter-prometheus
}

package_python-opentelemetry-exporter-zipkin() {
  depends=(
    python-opentelemetry-exporter-zipkin-json
    python-opentelemetry-exporter-zipkin-proto-http
  )
  pkgdesc="Zipkin Span Exporters for OpenTelemetry"
  _package exporter/opentelemetry-exporter-zipkin
}

package_python-opentelemetry-exporter-zipkin-json() {
  depends=(
    python
    python-opentelemetry-api
    python-opentelemetry-sdk
    python-requests
  )
  pkgdesc="Zipkin Span JSON Exporter for OpenTelemetry"
  _package exporter/opentelemetry-exporter-zipkin-json
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
  pkgdesc="Zipkin Span Protobuf Exporter for OpenTelemetry"
  _package exporter/opentelemetry-exporter-zipkin-proto-http
}

package_python-opentelemetry-propagator-b3() {
  depends=(
    python
    python-deprecated
    python-opentelemetry-api
  )
  pkgdesc="OpenTelemetry B3 Propagator"
  _package propagator/opentelemetry-propagator-b3
}

package_python-opentelemetry-propagator-jaeger() {
  depends=(
    python
    python-opentelemetry-api
  )
  pkgdesc="OpenTelemetry Jaeger Propagator"
  _package propagator/opentelemetry-propagator-jaeger
}

package_python-opentelemetry-proto() {
  depends=(
    python-grpcio
    python-protobuf
  )
  pkgdesc="OpenTelemetry Python Proto"
  _package opentelemetry-proto
}

package_python-opentelemetry-sdk() {
  depends=(
    python
    python-deprecated
    python-opentelemetry-api
    python-opentelemetry-semantic-conventions
    python-psutil
    python-typing_extensions
  )
  pkgdesc="OpenTelemetry Python SDK"
  _package opentelemetry-sdk
}

package_python-opentelemetry-semantic-conventions() {
  depends=(
    python
    python-deprecated
  )
  pkgdesc="OpenTelemetry Semantic Conventions"
  _package opentelemetry-semantic-conventions
}

package_python-opentelemetry-test-utils() {
  depends=(
    python
    python-asgiref
    python-opentelemetry-api
    python-opentelemetry-sdk
  )
  pkgdesc="Test utilities for OpenTelemetry unit tests"
  _package tests/opentelemetry-test-utils
}
