# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

_name=pytango
pkgname=python-${_name}
pkgver=10.1.0
pkgrel=1
pkgdesc="A python binding for the Tango control system"
arch=("x86_64" "armv7h" "aarch64")
url="https://gitlab.com/tango-controls/${_name}"
license=("LGPL-3.0-or-later" "PSF-2.0")
groups=("tango-controls")
depends=(
  "tango-cpp>=10.0.0" "boost" "boost-libs" "python-numpy" "python-packaging" "python-psutil" "python-coverage" "pybind11"
)
makedepends=(
  "cmake" "ninja"
  "python-build" "python-scikit-build-core" "python-pybind11-stubgen"
  "python-sphinx_rtd_theme" "python-sphinx" "python-installer"
)
optdepends=(
  "python-pytest: for testing"
  "python-gevent: for testing"
  "python-opentelemetry-sdk: to add telemetry"
  "python-opentelemetry-api: to add telemetry"
  "python-opentelemetry-exporter-otlp-proto-grpc: to add telemetry"
  "python-opentelemetry-exporter-otlp-proto-http: to add telemetry"
)
source=(
  "git+https://gitlab.com/tango-controls/pytango.git"
  "https://github.com/pybind/pybind11/archive/refs/tags/v2.13.6.tar.gz"
)
sha256sums=(
  SKIP
  "e08cb87f4773da97fa7b5f035de8763abc656d87d5773e62f6da0587d1f0ec20"
)

prepare() {
  cd pybind11-2.13.6
  echo BUILDING ...
  python -m build --wheel
  echo INSTALLING ...
  install -d "${srcdir}/_buildpy"
  python -m pip install \
    --no-index --no-deps \
    --find-links="${srcdir}/pybind11-2.13.6/dist" \
    --target="${srcdir}/_buildpy" \
    "pybind11==2.13.6"
}

build() {
  cd "${_name}"
  export PYTHONPATH="${srcdir}/_buildpy${PYTHONPATH:+:$PYTHONPATH}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
