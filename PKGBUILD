# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SeleniumBase
pkgname=python-${_base,,}
pkgdesc="A complete web automation framework for end-to-end testing"
pkgver=4.15.11
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
checkdepends=(python-pytest-rerunfailures google-chrome)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base,,}/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('d43221ae0c6501249f4cda011da860fe907ae115ae1ef33838482bd6dcc08bbd7d9cdb226aed9b73a53f424b7d4713dc0443adbb39cb673f6209c37b2f4f0534')

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
