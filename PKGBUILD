# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-ax-platform
_pkg="${pkgname#python-}"
pkgver=0.2.6
pkgrel=1
pkgdesc='Adaptive Experimentation Platform'
arch=('any')
url='https://github.com/facebook/ax'
license=('MIT')
depends=(
	'python-botorch'
	'python-jinja'
	'python-pandas'
	'python-plotly'
	'python-scikit-learn'
	'python-scipy'
	'python-typeguard')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
	'python-sphinx'
	'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('d172fef07439c9c0e55e38bf3bf32b059a313d4c851e82281affaf047cf048e4')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '/packages=/s/()/(exclude=["*tests*", "*testing*"])/' setup.py
}

build() {
	cd "$_pkg-$pkgver"
	SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
	make -C sphinx man
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 sphinx/build/man/ax.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/${_pkg/-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
