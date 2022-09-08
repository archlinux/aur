# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-coveralls
_pkg="${pkgname#python-}"
pkgver=3.3.1
pkgrel=1
_commit=c35bf51
pkgdesc="Python integration with coveralls.io"
url="https://github.com/thekevjames/coveralls-python"
arch=('any')
license=('MIT')
depends=('python-coverage' 'python-docopt' 'python-requests')
optdepends=('python-yaml')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('git' 'python-mock' 'python-pytest' 'python-responses')
changelog=CHANGELOG.md
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('ED35BBC75D8B80DA1949AABDB2B0BD2FE4EE84C5') ## Kevin James

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname"
	pytest -x
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/"
}
