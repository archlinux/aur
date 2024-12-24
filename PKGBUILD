# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-wasabi
_pkg="${pkgname#python-}"
pkgver=1.1.3
pkgrel=4
pkgdesc='Lightweight console printing and formatting toolkit'
arch=('any')
url='https://github.com/explosion/wasabi'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'jupyter-nbconvert')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/w/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('4bb3008f003809db0c3e28b4daf20906ea871a2bb43f9914197d540f4f2e0878')

prepare() {
	cd "$_pkg-$pkgver"
#	sed -i '/packages=/c\packages=["wasabi"],' setup.py
}

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
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
#	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
