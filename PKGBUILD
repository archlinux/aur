# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Harley Wiltzer <harleyw@hotmail.com>

pkgname=python-omegaconf
_pkg="${pkgname#python-}"
pkgver=2.2.3
pkgrel=2
pkgdesc='Flexible Python configuration system'
arch=('any')
url='https://github.com/omry/omegaconf'
license=('BSD')
depends=('python-antlr4' 'python-pyaml')
makedepends=('antlr4' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=('python-pytest' 'python-pytest-mock' 'python-pytest-lazy-fixture')
changelog=NEWS.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/o/$_pkg/$_pkg-$pkgver.tar.gz"
        'antlr4-jar.patch')
sha256sums=('59ff9fba864ffbb5fb710b64e8a9ba37c68fa339a2e2bb4f1b648d6901552523'
            '9e27af3dfc66fbd239f16c000acb73adf872376d1c1b041ff31d1fc5b57389bb')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < antlr4-jar.patch
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "$_pkg-$pkgver"
# 	PYTHONPATH="$PWD" pytest -x
# }

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/omegaconf-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
