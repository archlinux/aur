# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=guesslang
pkgdesc="Detect the programming language of a source code"
pkgver=2.2.1
pkgrel=2
arch=(any)
url="https://github.com/yoeo/${pkgname}"
license=(MIT)
depends=(python-tensorflow)
makedepends=(python-build python-installer python-setuptools python-wheel python-pytest-runner)
checkdepends=(python-typing_extensions)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('fceb1ac9bee2fa7d4cf19f79171baddba94c29374e5d488493e29e8ce38cde1f07a1a5d79b84477828f4d356afd59b7544b1f728e0c5a84f14c6c807d0f4c36d')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not guess_train'
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
