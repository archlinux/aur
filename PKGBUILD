# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>

pkgname=cppman-git
_pkg="${pkgname%-git}"
pkgver=0.5.3.r2.g5b39e69
pkgrel=1
pkgdesc="C++ 98/11/14 manual pages for Linux/MacOS"
arch=('any')
url='https://github.com/aitjcize/cppman'
license=('GPL3')
depends=('python-beautifulsoup4' 'python-html5lib')
optdepends=('vim: Pager option')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("$_pkg=${pkgver%.r*}")
conflicts=("$_pkg")
source=("$_pkg::git+$url"
        'setup.py.patch')
sha256sums=('SKIP'
            '525deb610fae6c6222164154c34c3290663bcd522b339c659f338f2cbc120033')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare() {
	patch -p1 -d "$_pkg" < setup.py.patch
}

build() {
	cd "$_pkg"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
