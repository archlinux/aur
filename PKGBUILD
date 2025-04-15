# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexander Bruegmann <mail[at]abruegmann[dot]eu>

pkgname=python-restfly
_pkg="${pkgname#python-}"
pkgver=1.5.1
pkgrel=1
pkgdesc='RESTfly API Library Framework'
license=('MIT')
arch=('any')
url="https://github.com/librestfly/restfly"
depends=('python-arrow' 'python-box' 'python-requests' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-sphinx' 'python-wheel')
checkdepends=('python-pytest' 'python-responses' 'python-pytest-cov')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8f2bd011222a2749ba1ad1bdb2168220204812c7e92a4073ff562ff3c0c99ba9')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	make -C docs man
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dvm644 "docs/_build/man/$_pkg.1" -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
