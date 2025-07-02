# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SeleniumBase
pkgname=python-${_base,,}
pkgdesc="A complete web automation framework for end-to-end testing"
pkgver=4.39.6
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
sha512sums=('1c1eb37fc772fe2274ac21f319d60a67c00c6c4b9e3de5138433140a19be0988147261f4f1c2b68c8ced5d04a38eab5b3f143e111c5ee6b55b5956e41c350c62')

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
