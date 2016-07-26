pkgname=chess_toolkit-git
pkgver=20150620
pkgrel=1
pkgdesc="Fast chess toolkit written in C. GIT repository."
arch=('i686' 'x86_64')
url="https://github.com/stevecancode/chess_toolkit"
license=('Apache')
depends=('glibc')
makedepends=('patch' 'gcc' 'make' 'autoconf' 'automake' 'texinfo' 'help2man' 'bison' 'flex' 'git' 'glibc' 'check')
_gitroot="https://github.com/stevecancode/chess_toolkit.git"
_gitname="chess_toolkit"

build() {
	if [ -d $srcdir/$_gitname ]
	then
		msg "Updating local repository."
		cd $srcdir/$_gitname && git pull
	else
		git clone $_gitroot
		cd $_gitname
	fi
    patch -p1 < ../../ct.patch
	./configure --prefix=/usr || return 1
	make clean || return 1
	make -j3 || return 1
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir/" install
}
