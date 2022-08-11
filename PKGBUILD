# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-uqbar
_pkg="${pkgname#python-}"
pkgver=0.6.0
pkgrel=1
pkgdesc='Tools for building documentation with Sphinx, Graphviz and LaTeX'
arch=('any')
url="https://github.com/josiah-wolf-oberholtzer/uqbar"
license=('MIT')
depends=('python>=3.7' 'python-sphinx' 'python-unidecode' 'python-black')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7c0e0e908f43753b7aaf897f8105d23f1f7519dcb58e49c180252ea351ddc17c')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '/sphinx_immaterial/d' docs/source/conf.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	PYTHONPATH="$PWD" make -C docs man
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD" pytest --disable-warnings || true
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 "docs/build/man/$_pkg.1" -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
