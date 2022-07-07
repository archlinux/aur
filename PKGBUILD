# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>

pkgbase=justext
pkgname=python-justext
_pkg=jusText
pkgver=3.0.0
pkgrel=2
pkgdesc="Heuristic based boilerplate removal tool"
url="https://github.com/miso-belica/justext"
arch=('any')
license=('BSD')
depends=('python-lxml')
makedepends=('python-build' 'python-docutils' 'python-installer' 'python-pygments' 'python-setuptools' 'python-wheel')
provides=('justext')
replaces=('justext')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/j/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('7640e248218795f6be65f6c35fe697325a3280fcb4675d1525bcdff2b86faadf')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	rst2man README.rst "$srcdir/justext.7"
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "$srcdir/justext.7" -t "$pkgdir/usr/share/man/man7/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
