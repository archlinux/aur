# Maintainer: Xeonacid <h.dwwwwww@gmail.com>

pkgname=certomancer
pkgver=0.16.0
pkgrel=1
pkgdesc="Quickly construct, mock & deploy PKI test configurations using simple declarative configuration."
arch=(any)
url="https://github.com/MatthiasValvekens/$pkgname"
license=(MIT)
depends=(python python-aiohttp python-asn1crypto python-click python-pyyaml python-dateutil python-tzlocal python-cryptography python-requests-mock python-jinja python-werkzeug python-python-pkcs11)
makedepends=(git python-build python-installer python-setuptools python-setuptools-scm python-wheel)
checkdepends=(python-pytest python-pytz python-requests python-freezegun python-pytest-asyncio python-pyhanko-certvalidator)
source=(git+$url.git#tag=v$pkgver)
sha512sums=('b8e1168311240776a3cc17302ea1ecaf43acede092d6a419cb7a12af3b20b791b27e6f10ad2530e3d381f4339774f3f2c13ae9e33f4fcc2092c49747c4c9702a')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check(){
  cd $pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -vv tests
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  cp -r docs "$pkgdir/usr/share/doc/$pkgname"
}
