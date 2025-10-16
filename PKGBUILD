# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SeleniumBase
pkgname=python-${_base,,}
pkgdesc="A complete web automation framework for end-to-end testing"
pkgver=4.42.6
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
  python-rich)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-rerunfailures selenium-manager chromium)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base,,}/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('bdb2f0aed18c9eacd5d4ec7fe3a4c2759355a9d29ee4acf9216ccc08a52716c788239da8c6c1de22442e8d41265b0f564e31292bceeac7f703ccb8bf738c614e')

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
