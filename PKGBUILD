# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SeleniumBase
pkgname=python-${_base,,}
pkgdesc="A complete web automation framework for end-to-end testing"
pkgver=4.44.20
pkgrel=1
arch=(any)
url="https://${_base,,}.io"
license=(MIT)
depends=(python-websockets
  python-fasteners
  # python-mycdp
  # python-sbvirtualdisplay
  python-colorama
  python-yaml
  python-pygments
  python-pdbp
  python-urllib3
  python-requests
  python-selenium
  python-cssselect
  python-parameterized
  python-behave
  python-beautifulsoup4
  python-pyotp
  python-markdown-it-py
  python-rich
  python-pytest-html)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-rerunfailures selenium-manager chromium)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base,,}/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('dcf100f5324deeaa61ccd52bec7aed50bae6a8e00f49d744ae3df43ffcd4b16fc67ca15689e9658dd2ca083481240aa88021f61f0e24468078563517d35016a6')

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
    -k 'not run_with_dashboard.py and not simple_cases and not basecase and not run_with_dashboard and not sb_fixture and not request_sb_fixture and not rerun_failures' \
    examples/unit_tests/verify_framework.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
