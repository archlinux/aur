# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Chih-Hsuan Yen <yan12125 at gmail dot com>

pkgname=python-plaster
pkgver=1.0
pkgrel=5
pkgdesc="Loader interface for multiple config file formats"
arch=('any')
url="https://github.com/pylons/plaster"
license=('MIT')
depends=('python-setuptools')
makedepends=(
	'python-build'
	'python-install'
	'python-wheel'
	'python-sphinx'
	'python-pylons-sphinx-themes')
checkdepends=('python-pytest')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/plaster/plaster-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/p/plaster/plaster-$pkgver.tar.gz.asc")
sha256sums=('8351c7c7efdf33084c1de88dd0f422cbe7342534537b553c49b857b12d98c8c3'
            'SKIP')
validpgpkeys=('CC1A48C957AC6ABEF05B2C596BC977B056B829E5')

build() {
	cd "plaster-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
	cd docs
	PYTHONPATH=../src make man
}

check() {
	cd "plaster-$pkgver"
	PYTHONPATH=./src pytest -x
}

package() {
	export PYTHONHASHSEED=0
	cd "plaster-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 docs/_build/man/plaster.1 -t "$pkgdir/usr/share/man/man1/"
}
