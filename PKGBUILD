# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
pkgname=par2cmdline-git
pkgver=20121201
pkgrel=1
pkgdesc="A file verification and repair tool"
url="https://github.com/BlackIkeEagle/par2cmdline"
license="GPL"
makedepends=('git')
depends=('gcc-libs')
arch=('i686' 'x86_64')
provides=('par2cmdline')
conflicts=('par2cmdline')
source=()

if [ -e .githash_${CARCH} ] ; then
	_gitphash=$(cat .githash_${CARCH})
else
	_gitphash=""
fi

_gitname='par2cmdline'
_gitroot='git://github.com/BlackIkeEagle/par2cmdline.git'

build() {
	if [ -d ${srcdir}/${_gitname}/.git ] ; then
		( cd ${srcdir}/${_gitname} && git pull origin )
		msg "The local files are updated."
	else
		( git clone --depth 1 ${_gitroot} ${_gitname} )
	fi
	msg "GIT checkout done or server timeout"

	cd ${_gitname}
	if [ "${_gitphash}" == $(git show | grep -m 1 commit | sed 's/commit //') ]; then
		msg "Git hash is the same as previous build"
		return 1
	fi

	msg "creating build directory"
	cd ${srcdir}
	[ -d ${_gitname}-build ] && rm -rf ${_gitname}-build
	cp -a ${_gitname} ${_gitname}-build

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

check() {
	cd ${_gitname}-build
	make check
}

package() {
	cd ${_gitname}-build
	make DESTDIR=$startdir/pkg install

	git show | grep -m 1 commit | sed 's/commit //' > ${startdir}/.githash_${CARCH}
}
