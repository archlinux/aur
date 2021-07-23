# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Jan Tojnar <jtojnar@gmail.com>

_pkgname=hamster-lib
pkgname="python-$_pkgname-git"
_branch=develop
pkgver=0.13.1.r32.gea3ec9a
pkgrel=1
pkgdesc='A library for common timetracking functionality'
arch=(any)
url="https://github.com/projecthamster/$_pkgname"
license=(GPL3)
depends=(python
         python-appdirs
         python-future
         python-icalendar
         python-sqlalchemy
         python-six)
makedepends=(git
             python-setuptools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$_pkgname::git+$url.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --always --long --tags --abbrev=7 HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	sed -i -e 's/find_packages()/find_packages(exclude=["tests"])/;s/.*configparser.*//g' setup.py
	sed -i -e 's!setup.py install!setup.py install --root="$(DESTDIR)"!g' Makefile
}

package() {
	cd "$_pkgname"
	make install DESTDIR="$pkgdir/"
}
