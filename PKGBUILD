# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SeleniumBase
pkgname=python-${_base,,}
pkgdesc="A complete web automation framework for end-to-end testing"
pkgver=4.15.10
pkgrel=1
arch=(any)
url="https://${_base,,}.io"
license=(MIT)
depends=(python-yaml python-rich python-requests-toolbelt python-pdbp python-selenium
  python-fasteners python-cssselect python-beautifulsoup4 python-behave python-cffi
  python-charset-normalizer python-cryptography python-execnet python-filelock
  python-keyring python-parameterized python-parse-type python-pyotp python-colorama
  python-py python-pyopenssl python-pyparsing python-tqdm) # python-sbvirtualdisplay
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-html python-pytest-rerunfailures google-chrome)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base,,}/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('cae4683a0fbd2bfb55d94aab61319bb4d1297a81fa2528a5202116f8eab280f1f6a1985906b70e7010b915543523d8a14366c3233b7c0561cd9c4277a843e9df')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest examples/unit_tests/verify_framework.py --browser=chrome --headless
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
