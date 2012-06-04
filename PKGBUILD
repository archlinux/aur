# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=kvirtual-git
pkgver=20120604
pkgrel=1
pkgdesc="KDE4 GUI-frontend for kvm/qemu emulator"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KVirtual?content=150682"
license=('GPL2')
depends=('kdebase-runtime' 'qemu')
makedepends=('git' 'cmake' 'automoc4')
provides=('kvirtual')
conflicts=('kvirtual')
source=()

if [ -e .githash_$CARCH ] ; then
	_gitphash=$(cat .githash_$CARCH)
else
	_gitphash=""
fi

_gitname="kvirtual"
_gitroot="git://github.com/didier13150/kvirtual.git"

build() {
	if [ -d $srcdir/$_gitname/.git ] ; then
		( cd $srcdir/$_gitname && git pull origin )
		msg "The local files are updated."
	else
		( git clone --depth 1 $_gitroot $_gitname )
	fi
	msg "GIT checkout done or server timeout"

	cd $_gitname
	if [ "$_gitphash" == $(git show | grep -m 1 commit | sed 's/commit //') ]; then
		msg "Git hash is the same as previous build"
		return 1
	fi

	msg "creating build directory"
	cd "$srcdir"
	[ -d $_gitname-build ] && rm -rf $_gitname-build
	mkdir $_gitname-build

	msg "Starting make..."
	cd $_gitname-build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo ../$_gitname
	make
}
package() {
	cd "$_gitname-build"
	make DESTDIR="$pkgdir" install

	cd "$srcdir/$_gitname"
	git show | grep -m 1 commit | sed 's/commit //' > "$startdir/.githash_$CARCH"
}
