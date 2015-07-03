# Maintainer: Romain Porte <microjoe@mailoo.org>
# Creator: chefpeyo <pierre-olivier.huguet@asp64.com>
# Contributor: kuri <sysegv@gmail.com>

pkgname=cjson-git
pkgver=r12.72beac9
pkgrel=1
pkgdesc="Dave Gamble's cJSON library. Easily handle JSON data in C."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/cjson/"
license=('LGPL2')
depends=()
makedepends=('git')
conflits=()
provides=('cjson')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://github.com/chefpeyo/cJSON.git"
_gitname="cjson"

pkgver() {
	cd "$srcdir/$_gitname"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd $srcdir

	if [ $NOEXTRACT -eq 0 ]; then
		msg "Connecting to $_gitroot GIT server...."
		if [ -d $_gitname/.git ]; then
			(cd $_gitname && git pull origin)
		else
			git clone $_gitroot $_gitname
		fi

		msg "GIT checkout done or server timeout"
		msg "Starting make..."

	fi
	cp -r $_gitname $_gitname-build
	cd $_gitname-build
}

package() {
	cd $_gitname-build

	./autogen.sh --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install || return 1

# install license files
	install -Dm644 $srcdir/$_gitname-build/COPYING \
		$pkgdir/usr/share/licenses/$pkgname/COPYING

	rm -r $startdir/src/$_gitname-build
}
