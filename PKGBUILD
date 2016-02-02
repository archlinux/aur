# Maintainer: M Novick <mnovick1988@gmail.com>
# Contributor: matthiaskrgr <matthiaskrgr _strange_curverd_character_ freedroid D0T org>
#
# NOTE: Copied from AUR3 and updated.
#


pkgname=gmqcc-git
pkgver=r1.3714a50
pkgrel=1
pkgdesc="An Improved Quake C Compiler"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('glibc')
conflicts=('gmqcc')
provides=('gmqcc=0.2.4')
makedepends=('git')
url="https://github.com/graphitemaster/gmqcc.git"
license=('MIT')

_gitroot="git://github.com/graphitemaster/gmqcc.git"
_gitname="gmqcc"

pkgver() {
  cd "$srcdir"/"$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir
	msg "Connecting to the GIT server..."
	if [[ -d $srcdir/$_gitname ]] ; then
		cd $_gitname
		msg "Removing build files..."
		git clean -dfx
		msg "Updating..."
		git pull --no-tags
		msg "The local files are updated."
	else
		msg "Cloning..."
		git clone $_gitroot $_gitname --depth 1
		msg "Clone done."
	fi

	msg "Starting compilation..."
	cd "$srcdir"/"$_gitname"
        
        msg "Configuring..."
        cmake .
        
	msg "Compiling..."
	make
}

#check() {
#	cd "$srcdir"/"$_gitname"
#	make test
#}

package() {
	cd "$srcdir"/"$_gitname"
	msg "Building Pkg."
	#make install DESTDIR=$pkgdir PREFIX=/usr
	#msg "Compiling done."
	mkdir -p ${pkgdir}/usr/lib
        mkdir -p ${pkgdir}/usr/bin
        install -D "$srcdir"/"$_gitname"/gmqcc ${pkgdir}/usr/bin/gmqcc
        install -D "$srcdir"/"$_gitname"/testsuite ${pkgdir}/usr/bin/testsuite
        install -D "$srcdir"/"$_gitname"/qcvm ${pkgdir}/usr/bin/qcvm
        install -D "$srcdir"/"$_gitname"/libgmqcclib.a ${pkgdir}/usr/lib/libgmqcclib.a
	install -D LICENSE ${pkgdir}/usr/share/licenses/gmqcc/LICENSE
}
