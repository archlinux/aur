# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-agithub
_pkg="${pkgname#python-}"
pkgver=2.2.2
pkgrel=2
epoch=1
pkgdesc="EDSL for connecting to REST servers"
arch=('any')
url="https://github.com/mozilla/agithub"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz.asc"
        "COPYING-$pkgver::$url/raw/v$pkgver/COPYING")
sha256sums=('321aa5fc688fde2970562b35c991881b69a13f57372d554a0fab184df85fa8a7'
            'SKIP'
            'a9f7d886b8a6dc7371d0a2ddae9c20e0dd797887881be393d0de6b3dd7d8a967')
validpgpkeys=('17C0E798512E2ED181E24FF4F0A9E7DCD39E452E') ## Eugene Wood

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 "$srcdir/COPYING-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
