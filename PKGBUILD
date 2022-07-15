# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-numpoly
_pkg="${pkgname#python-}"
pkgver=1.2.4
pkgrel=1
_commit=4c1c5fd
pkgdesc="NumPy compatible polynomial representation"
arch=('any')
url='https://github.com/jonathf/numpoly'
license=('BSD')
depends=('python-numpy' 'python-setuptools')
makedepends=('git' 'python-poetry' 'python-build' 'python-installer' 'python-sphinx')
checkdepends=('python-pytest' 'python-sympy')
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('558C5F4DBB8597A140DA91C53673F898D24A40A7') ## Jonathan Feinberg

prepare() {
	cd "$pkgname"
	sed -i '/version/s/3/4/' pyproject.toml ## fix semver
}

build() {
	cd "$pkgname"
	python -m build --wheel --skip-dependency-check --no-isolation
	PYTHONPATH="$PWD" make -C docs man
}

check() {
	cd "$pkgname"
	pytest -x --disable-warnings || true
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 docs/.build/man/numpoly.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/numpoly-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
