# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-wrapio
pkgver=2.0.0
pkgrel=1
pkgdesc='Python library for handling event-based streams'
arch=('any')
url="https://github.com/Exahilosys/wrapio"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-sphinx')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c1426413d1b08fc52379b59c27b5a16d08f4995c46a21126a2696700a58d5de1')

prepare() {
	cd "wrapio-$pkgver/"
	sed -i "/__import__/c\version = '$pkgver'" docs/conf.py
}

build() {
	cd "wrapio-$pkgver"
	python setup.py build
	cd docs
	PYTHONPATH=../ make man
}

package() {
	cd "wrapio-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 docs/_build/man/wrapio.1 -t "$pkgdir/usr/share/man/man1/"
}
