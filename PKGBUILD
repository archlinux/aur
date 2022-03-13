# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Arnaud Lier <zeprofdecoding@gmail.com>

pkgname=python-ghtopdep
pkgver=0.3.13
pkgrel=2
pkgdesc='CLI tool for sorting dependents repositories and packages by stars.'
arch=('any')
url='https://github.com/github-tooling/ghtopdep'
license=('MIT')
depends=(
	'python-appdirs'
	'python-cachecontrol'
	'python-click'
	'python-github3.py'
	'python-halo'
	'python-pipdate'
	'python-requests'
	'python-selectolax'
	'python-tabulate')
makedepends=('python-poetry' 'python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/ghtopdep/ghtopdep-$pkgver.tar.gz")
sha256sums=('c92026411beb38dec238871293c277b3ebb3c79d6366387bcb023aa6eed23714')

build() {
	cd "ghtopdep-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "ghtopdep-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/ghtopdep-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
