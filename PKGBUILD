# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SeleniumBase
pkgname=python-${_base,,}
pkgdesc="A complete web automation framework for end-to-end testing"
pkgver=4.24.4
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
  python-yaml
  python-rich) # python-sbvirtualdisplay python-pynose
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-rerunfailures selenium-manager chromium)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base,,}/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('88c5b73fd52e00781470a1b2a3029315dbde54df02c9153109b48c15ff05c3b46f95542bd78065588fc63ad9167ddccf783b2b2f001382eb568f7d8c253ddeeb')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --browser=chrome \
    --headless \
    -k 'not run_with_dashboard.py' \
    examples/unit_tests/verify_framework.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
