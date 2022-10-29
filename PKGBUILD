# Maintainer: endlesseden <ask>
# Upstream-Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# 
# Note: this is just a copy and merge of new and old python-ftputil.

pkgname=python2-ftputil
_pkgname=python-ftputil
_pkg="${_pkgname#python-}"
pkgver=5.0.4
pkgrel=1
pkgdesc="High-level FTP client library"
arch=('any')
url="https://ftputil.sschwarzer.net/"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools' 'python2-wheel')
checkdepends=('python2-pytest' 'python2-freezegun')
changelog=announcements.txt
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('6889db8649dd20d9b6d40a6c5f0f84ccf340a7dac1e0bfc0f0024090fc2afb33')

prepare() {
	## setup.py installs docs to an incorrect directory; exclude them
	sed -i '/data_files/d' "$_pkg-$pkgver/setup.py"
}

build() {
	cd "$_pkg-$pkgver"
	python2 setup.py install --root="$srcdir/pkg" --optimize=1
}

## tests don't run
check() {
	cd "$_pkg-$pkgver"
	pytest2 -m 'not slow_test' test --disable-warnings || true
}

package() {
	cd "$_pkg-$pkgver"
	mv "$srcdir/pkg/usr" "$pkgdir/"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	install -d  "$pkgdir/usr/share/doc/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
