# vim:set ft=sh:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
pkgname=par2cmdline-git
_gitname='par2cmdline'
pkgver=20130106.5ffa40e
pkgrel=1
pkgdesc="A file verification and repair tool"
url="https://github.com/BlackIkeEagle/par2cmdline"
license="GPL"
makedepends=('git')
depends=('gcc-libs')
arch=('i686' 'x86_64')
provides=('par2cmdline')
conflicts=('par2cmdline')
source=("$_gitname::git://github.com/BlackIkeEagle/par2cmdline.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(git log -1 --format="%ci" | sed 's/.*\([0-9]\{4\}\)-\([0-9]\{2\}\)-\([0-9]\{2\}\).*/\1\2\3/').$(git rev-parse --short HEAD)
}

build() {
	msg "creating build directory"
	cd ${srcdir}
	[ -d ${_gitname}-build ] && rm -rf ${_gitname}-build
	/usr/share/git/workdir/git-new-workdir ${_gitname} ${_gitname}-build master

	msg "Starting make..."
	cd ${_gitname}-build

	# automake
	aclocal
	automake --add-missing
	autoconf
	# configure
	./configure --prefix=/usr
	# make
	make
}

#check() {
	#cd ${_gitname}-build
	#make check
#}

package() {
	cd ${_gitname}-build
	make DESTDIR=$startdir/pkg install
}
