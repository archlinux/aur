# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-webdriver-manager
_name=webdriver_manager
pkgver=3.8.6
pkgrel=1
pkgdesc="Simplify management of binary drivers for different browsers in Selenium"
arch=(any)
url="https://github.com/SergeyPirogov/webdriver_manager"
license=(Apache)
makedepends=(python-setuptools)
checkdepends=(
  python-pytest
  python-pybrowsers
)
depends=(
  python-requests
  python-dotenv
  python-tqdm
  python-packaging
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b75ce174081a26a188d536aad487b8ee7b52ccfcdab35b0e4846b95abe42dc41')

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  rm tests/__init__.py tests_negative/__init__.py tests_xdist/__init__.py
}


build() {
  cd "$_archive"

  python setup.py build
}

check() {
  cd "$_archive"

  python -m pytest \
    tests/test_custom_http_client.py \
    tests/test_custom_logger.py \
    tests/test_silent_global_logs.py \
    tests/test_utils.py
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
