# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgbase=python-ftputil
pkgname=('python-ftputil' 'python2-ftputil')
pkgver=5.0.1
pkgrel=1
pkgdesc="High-level FTP client library"
arch=('any')
url="https://ftputil.sschwarzer.net/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
# checkdepends=('python-pytest' 'python-freezegun' 'python2-pytest' 'python2-freezegun')
changelog=announcements.txt
source=("$pkgbase-$pkgver.tar.gz::$url/trac/attachment/wiki/Download/ftputil-$pkgver.tar.gz?format=raw")
sha256sums=('394997ccb3cd4825c6e22b5e349c62cf5016c35db4d60940f3513db66d205561')

prepare() {
	## setup.py installs docs to an incorrect directory; exclude them
	sed -i '/data_files/d' "ftputil-$pkgver/setup.py"
	cp -a "ftputil-$pkgver" "ftputil-$pkgver-py2"
}

build() {
	pushd "ftputil-$pkgver"
	python setup.py build
	popd

	pushd "ftputil-$pkgver-py2"
	python2 setup.py build
}

# check() {
# 	pushd "ftputil-$pkgver"
# 	python -m pytest -m 'not slow_test' test
# 	popd
#
# 	pushd "ftputil-$pkgver-py2"
# 	python2 -m pytest -m 'not slow_test' test
# }

package_python-ftputil() {
	depends=('python')

	cd "ftputil-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

	cd doc
	install -Dm 644 README.txt ftputil.txt contributors.txt -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_python2-ftputil() {
	depends=('python2')

	cd "ftputil-$pkgver-py2"
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

	cd doc
	install -Dm 644 README.txt ftputil.txt contributors.txt -t "$pkgdir/usr/share/doc/$pkgname/"
}
