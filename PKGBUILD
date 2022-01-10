# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pyetrade
pkgver=1.3.6
pkgrel=1
pkgdesc="Python E-Trade API wrapper"
arch=('any')
url="https://github.com/jessecooper/pyetrade"
license=('GPL3')
depends=(
	'python-dateutil'
	'python-requests'
	'python-requests-oauthlib'
	'python-xmltodict'
	'python-jxmlease')
makedepends=('python-setuptools' 'python-sphinx')
checkdepends=('python-pytest-runner' 'python-pytest-mock')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "__init__.py.patch::$url/commit/26f33ca6.diff")
sha256sums=('d13c785c76ffd13658d6a459bd81008167fb2222a4c24b92b27499b588d1fb80'
            '62e7f7370ac8f306fc6d729c9a83f3134df212533918b7dcffa94eaddac5883d')

prepare() {
	patch -p1 -d "pyetrade-$pkgver" < __init__.py.patch
}

build() {
	cd "pyetrade-$pkgver"
	python setup.py build
	cd docs
	make man
}

check() {
	cd "pyetrade-$pkgver"
	python setup.py pytest
}

package() {
	export PYTHONHASHSEED=0
	cd "pyetrade-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 docs/_build/man/pyetrade.1 -t "$pkgdir/usr/share/man/man1/"
}
