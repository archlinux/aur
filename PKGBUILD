# Maintainer: Wouter Haffmans <wouter@simply-life.net>
pkgname=doxygen-git
pkgver=Release_1_8_5.71.g94a299a
pkgrel=1
pkgdesc="A documentation system for C++, C, Java, IDL and PHP - git version"
arch=('i686' 'x86_64')
url="http://www.doxygen.org"
license=('GPL2')
# Qt4 required for doxywizard
depends=('qt4')
makedepends=('git' 'perl' 'flex' 'bison' 'python2')
optdepends=('graphviz')
conflicts=('doxygen')
provides=('doxygen')
replaces=('doxygen-svn')
source=("$pkgname"::'git+https://github.com/doxygen/doxygen.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	# Use the tag of the last commit
	local ver="$(git describe --long)"
	printf "%s" "${ver//-/.}"
}

build() {
	cd "$pkgname"
	./configure --prefix /usr --with-doxywizard
	# Use python2 where necessary for doxywizard, instead of python (which is python3)
	sed -i 's/^\(.*\)\.commands = python /\1.commands = python2 /' addon/doxywizard/doxywizard.pro
	make
}

package() {
	cd "$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}

