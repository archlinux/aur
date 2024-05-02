# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
_base=pingparsing
pkgname=python-${_base}
pkgver=1.4.2
pkgrel=1
pkgdesc="CLI and library parser and transmitter for ping"
arch=(any)
url="https://github.com/thombashi/${_base}"
license=(MIT)
depends=(python-humanreadable python-pyparsing python-subprocrunner)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pytz)
provides=("${_base}")
replaces=("${_base}")
source=(${url}/releases/download/v${pkgver}/${_base}-${pkgver}.tar.gz{,.sigstore})
sha512sums=('abdef6f7d3fef3b793b9ec8c1a4276e4bd7dbb9caf5baf3b5e548105ad55559fe8a303ef28a541d0a9602f8a15560a70438babdd8bb43be228f28c4f94353531'
  'de05ff4a95d50af04913e8d8f589e163444ea820a3a2dc4100989e4d09db82f09f54885376cda318fd265815810c54bf1434114e2a12fc1acc6fcc4b39d8614f')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
