# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Your Name <arch7nelliel@gmail.com>
# Developer: Taylor Marks <taylor@marksfam.com>

pkgname=python-playsound
_pkg=playsound
pkgver=1.3.0
pkgrel=2
pkgdesc="Pure Python library for playing sounds"
arch=('any')
url="https://github.com/TaylorSMarks/playsound"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
changelog=CHANGES
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$_pkg/$_pkg-$pkgver.tar.gz"
        'setup.py.patch')
sha256sums=('cc6ed11d773034b0ef624e6bb4bf50f4b76b8414a59ce6d38afb89b423297ced'
            '9dad08ea67730400466065d3b7db345b94bb581a55431baba9ad8350976f93c8')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < setup.py.patch
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
