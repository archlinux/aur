# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: orumin <dev@orum.in>

pkgname=python-jxmlease
_pkg="${pkgname#python-}"
pkgver=1.0.3
pkgrel=2
pkgdesc="XML to Python object conversion library"
arch=('any')
url="https://github.com/Juniper/jxmlease"
license=('MIT')
depends=('python')
optdepends=('python-lxml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-sphinx' 'python-wheel')
changelog=CHANGES
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6b1fd14f192450601d4ea5d0fbb2c7e49f9bc6e9ab9530dcf91c8ef57f65ed4d')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	make -C docs man
}

check() {
	cd "$_pkg-$pkgver"
	python -m unittest discover
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	install -Dm644 docs/_build/man/jxmlease.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
