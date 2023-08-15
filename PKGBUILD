# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-soxr
pkgver=0.3.6
pkgrel=1
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
  'b542868e10bee1af9296877b7ecf33cb99e4c4f1dc2d07324a465e3286933cf8a8d274cb58d7fd391889721f64de1ef787d35765dd2e02768126d8c31ec02861'
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
