# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=python-werkzeug2
_pkgname=python-werkzeug
pkgver=2.0.2
pkgrel=2
pkgdesc='Swiss Army knife of Python web development. Compatible with Odoo 17'
url='https://werkzeug.palletsprojects.com/'
arch=('any')
license=('custom:BSD')
depends=('python-markupsafe')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-pytest-xprocess' 'python-requests'
              'python-ephemeral-port-reserve' 'python-greenlet' 'python-watchdog'
              'python-cryptography')
conflicts=('python-werkzeug')
source=("https://github.com/pallets/werkzeug/archive/${pkgver}/$_pkgname-$pkgver.tar.gz"
         https://github.com/pallets/werkzeug/commit/4e5bdca7.patch)
b2sums=('15506d57a8545eb45cb0f4efb78bcc4dfc1faa68910f09dfdd14f4bbb2404078247a7f61475c5fff9058a1557f7f6541eec262fb274e7ed82e1a82b9f644cf8b'
        '3e546838e0d39e5b77af2e563e54ac1bf6c8804bfe44f1397ae3bdcd9ad7c9eea2bde5e159f0ea518d9d625d955a85ded7cd6de30a7c2c5706c09d238de5e801')

prepare() {
  patch -d werkzeug-$pkgver -p1 < 4e5bdca7.patch # Fix tests with pytest 8
}

build() {
  cd "werkzeug-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "werkzeug-$pkgver"
  PYTHONPATH="src" pytest \
    --deselect=tests/test_serving.py \
    --deselect=tests/test_debug.py::test_basic \
    --deselect=tests/middleware/test_http_proxy.py
}

package() {
  cd "werkzeug-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$_pkgname"
}

# vim:set ts=2 sw=2 et:
