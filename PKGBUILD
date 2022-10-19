# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Your Name <arch7nelliel@gmail.com>
# Developer: Taylor Marks <taylor@marksfam.com>

pkgname=python-playsound-git
_pkg=playsound
pkgver=1.3.0.r2.g9cf4af2
pkgrel=1
pkgdesc="Pure Python library for playing sounds"
arch=('any')
url="https://github.com/TaylorSMarks/playsound"
license=('MIT')
depends=('python-gobject')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url"
        'setup.py.patch')
sha256sums=('SKIP'
            '9dad08ea67730400466065d3b7db345b94bb581a55431baba9ad8350976f93c8')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	patch -p1 -d "$pkgname" < setup.py.patch
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-${pkgver%.r*}.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
