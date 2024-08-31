# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=simplematrixbotlib
pkgname="python-$_pkgname"
pkgver=2.12.0
pkgrel=1
pkgdesc="An easy to use bot library for the Matrix ecosystem written in Python"
arch=(any)
url="https://codeberg.org/imbev/$_pkgname"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry')
depends=('python' 'python-matrix-nio' 'python-cryptography-fernet-wrapper' 'python-pillow' 'python-markdown'
         'python-toml')
checkdepends=('python-pytest')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" "fix-unit-tests.patch")
sha256sums=('923c92e7bd02cc917997faae0fc727f7b8dc007003d928d70cdb4b2f2c809497'
            'e87fb74680bda00389c0260ffd8977d0530484e2cdb6a7a6937548ecf2d39ca2')

prepare() {
	cd "$_pkgname"

	patch -p1 < "$srcdir/fix-unit-tests.patch"
}

build() {
	cd "$_pkgname"

	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname"

	PYTHONPATH=. pytest
}

package() {
	cd "$_pkgname"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
