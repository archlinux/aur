# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-mock
pkgver=3.10.0
pkgrel=1
pkgdesc="Thin-wrapper around the mock package for easier use with py.test"
arch=('any')
license=('LGPL3')
url="https://github.com/pytest-dev/pytest-mock/"
depends=('python38-pytest')
makedepends=('python38-setuptools-scm')
checkdepends=('python38-pytest-asyncio')
source=("https://github.com/pytest-dev/pytest-mock/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('50dbee13203bec24510a40d3e6dc1be29d1d12a342714f7b9fcd3d2be57b4f495eebb9b6330304e55a59a3515aa039143ab83c40b183a886a4068ae8e7456648')

build() {
  cd pytest-mock-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python3.8 setup.py build
}

check() {
  cd pytest-mock-$pkgver
  python3.8 setup.py egg_info
  export PYTHONPATH="src:${PYTHONPATH}"
  # disable all tests that require the plugin to be installed
  pytest -v --assert=plain \
    -k "not test_used_with_session_scope \
        and not test_used_with_package_scope \
        and not test_used_with_module_scope \
        and not test_used_with_class_scope \
        and not test_monkeypatch_ini \
        and not test_monkeypatch_native \
        and not test_standalone_mock \
        and not test_plain_stopall"
}

package() {
  cd pytest-mock-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
