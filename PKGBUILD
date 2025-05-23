# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SeleniumBase
pkgname=python-${_base,,}
pkgdesc="A complete web automation framework for end-to-end testing"
pkgver=4.38.3
pkgrel=1
arch=(any)
url="https://${_base,,}.io"
license=(MIT)
depends=(python-filelock
  python-platformdirs
  python-fasteners
  python-pdbp
  python-parse-type
  python-colorama
  python-yaml
  python-pygments
  python-idna
  python-charset-normalizer
  python-urllib3
  python-requests
  python-sniffio
  python-h11
  python-outcome
  python-trio
  python-trio-websocket
  python-wsproto
  python-websocket-client
  python-selenium
  python-cssselect
  python-sortedcontainers
  python-execnet
  python-iniconfig
  python-pluggy
  python-parameterized
  python-behave
  python-soupsieve
  python-beautifulsoup4
  python-pyotp
  python-xlib
  python-markdown-it-py
  python-mdurl
  python-rich) # python-sbvirtualdisplay python-pynose
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-rerunfailures selenium-manager chromium)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base,,}/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('68a3d9f79340a569c542561ccf5d65c3ee675314d88da9eec91c53bd4dce325f872016240939c8eaa529098ee6cb9b7f0d49d7281adc939b2a6dedcc96f9260d')

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
