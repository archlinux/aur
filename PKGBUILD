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
source=('git://github.com/pohuguet/cJSON.git')
md5sums=(SKIP)

_gitname="cJSON"

pkgver() {
	cd "$srcdir/$_gitname"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd $_gitname

	./autogen.sh --prefix=/usr
	make || return 1
}

package() {
	cd $_gitname

	make DESTDIR=$pkgdir install || return 1

	# install license files
	install -Dm644 $srcdir/$_gitname/COPYING \
		$pkgdir/usr/share/licenses/$pkgname/COPYING
}
