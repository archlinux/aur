# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SeleniumBase
pkgname=python-${_base,,}
pkgdesc="A complete web automation framework for end-to-end testing"
pkgver=4.20.2
pkgrel=1
arch=(any)
url="https://${_base,,}.io"
license=(MIT)
depends=(python-filelock
  python-platformdirs
  python-parse-type
  python-charset-normalizer
  python-requests
  python-selenium
  python-cssselect
  python-fasteners
  python-execnet
  python-pytest-html
  python-parameterized
  python-behave
  python-beautifulsoup4
  python-pdbp
  python-colorama
  python-pyotp
  python-rich) # python-sbvirtualdisplay python-pynose
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-rerunfailures selenium-manager google-chrome)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base,,}/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('a908568ba23c2a9497e37cdd6658fba69b9a8600bb7ba16a4c74175178c3b672ab2270418d5fb687f82760bb7d26107625e0dadf4d683c642ec884bea74ebe8b')

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
