# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SeleniumBase
pkgname=python-${_base,,}
pkgdesc="A complete web automation framework for end-to-end testing"
pkgver=4.44.16
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
sha512sums=('0a315792b355ae7e88a67b7952f9f34f01d87d82858940c7bde11a6bcc29d1fce5a17c7848a63d47b68e41ce6fd2389f4ce0fdd1e53627eaab0afc532e8fbdc6')

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
