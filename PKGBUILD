# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Mathijs Kadijk <maccain13@gmail.com>

pkgname=python-azkaban
_pkg="${pkgname#python-}"
pkgver=0.9.14
pkgrel=2
pkgdesc="Lightweight Azkaban client"
arch=('any')
url="https://github.com/mtth/azkaban"
license=('MIT')
depends=('python-six' 'python-docopt' 'python-requests' 'python-urllib3')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-sphinx' 'python-wheel')
checkdepends=('python-nose')
changelog=CHANGES
source=("$pkgname::git+$url#tag=$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('5E58F75A5DA44C4BCD6713A07800266DA107476A')

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
	cd doc
	PYTHONPATH=../ sphinx-build -b man . _build/man
}

check() {
	cd "$pkgname"
	nosetests
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 "doc/_build/man/$_pkg.1" -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/AUTHORS" "$pkgdir/usr/share/doc/$pkgname/"
}
