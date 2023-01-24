# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>

pkgname=python-ndeflib
_pkg="${pkgname#python-}"
pkgver=0.3.3
pkgrel=4
pkgdesc="Python package for parsing and generating NFC Data Exchange Format messages"
arch=('any')
url="https://github.com/nfcpy/ndeflib"
license=('custom:ISC')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/n/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('1d56828558b9b16f2822a4051824346347b66adf5320ea86070748b6f2454a88')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD/src/" pytest -x || echo ':: Tests failed'
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
