# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

_name=pytango
pkgname=python-${_name}
pkgver=10.0.3
pkgrel=1
pkgdesc="A python binding for the Tango control system"
arch=("x86_64" "armv7h" "aarch64")
url="https://gitlab.com/tango-controls/${_name}"
license=("LGPL-3.0-or-later" "PSF-2.0")
groups=("tango-controls")
depends=(
  "tango-cpp>=10.0.0" "tango-cpp<=10.0.2" "boost" "boost-libs" "python-numpy" "python-packaging" "python-psutil" "python-coverage"
)
makedepends=(
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
  "https://gitlab.com/tango-controls/${_name}/-/releases/v${pkgver}/downloads/${_name}-with-submodules-v${pkgver}.tar.gz"
  "https://github.com/numpy/numpy/releases/download/v2.2.6/numpy-2.2.6.tar.gz"
)
sha256sums=(
  "3906979b5df74da89a86966bc1e1a121457b4b58a52bfacde3e68194308a6e14"
  "e29554e2bef54a90aa5cc07da6ce955accb83f21ab5de01a62c8478897b264fd"
)

prepare() {
  cd numpy-2.2.6
  python -m build --wheel --no-isolation
  install -d "${srcdir}/_buildpy"
  python -m pip install \
    --no-index --no-deps \
    --find-links="${srcdir}/numpy-2.2.6/dist" \
    --target="${srcdir}/_buildpy" \
    "numpy==2.2.6"
}

build() {
  cd "${_name}-with-submodules-v${pkgver}"
  export PYTHONPATH="${srcdir}/_buildpy${PYTHONPATH:+:$PYTHONPATH}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-with-submodules-v${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
