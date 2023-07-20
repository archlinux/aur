# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-soxr
pkgver=0.3.5
pkgrel=2
pkgdesc='High quality, one-dimensional sample-rate conversion library for Python'
arch=('x86_64')
url='https://github.com/dofuuz/python-soxr'
license=('custom')
depends=(
  'libsoxr'
  'python-numpy'
)
checkdepends=('python-pytest')
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-oldest-supported-numpy'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/dofuuz/python-soxr/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '400bf1b79f8177627acef19751d52c890e2352b1bb65b05514a17e356753b268610a670adc7ec52afaaac10befa4ed9d5a28bbf2561075ed0f22abacc3cf48f3'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -rf libsoxr
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation \
    -C=--build-option=--use-system-libsoxr
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python_version="$(
    python -c 'import sys; print("".join(map(str, sys.version_info[:2])))'
  )"
  export PYTHONPATH="build/lib.linux-${CARCH}-cpython-${python_version}"
  python -m pytest tests/
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt"
}
