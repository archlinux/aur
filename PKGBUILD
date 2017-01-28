# Maintainer: Romain Porte <microjoe@mailoo.org>
# Creator: chefpeyo <pierre-olivier.huguet@asp64.com>
# Contributor: kuri <sysegv@gmail.com>

pkgname=cjson-git
pkgver=v1.2.0.r2.gc49ffbf
pkgrel=1
pkgdesc="Dave Gamble's cJSON library. Easily handle JSON data in C (git version)."
arch=('i686' 'x86_64')
url="https://github.com/DaveGamble/cJSON"
license=('LGPL2.1')
depends=('glibc')
makedepends=('git' 'cmake')
conflicts=()
provides=('cjson')
options=('!libtool')
source=('git://github.com/DaveGamble/cJSON.git')
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

	rm -rf build
	mkdir build
	cd build
	cmake .. -DENABLE_CJSON_UTILS=On -DENABLE_CJSON_TEST=Off -DCMAKE_INSTALL_PREFIX=/usr
	make || return 1
}

package() {
	cd $_gitname/build

	make DESTDIR=$pkgdir install || return 1

	# install license files
	install -Dm644 $srcdir/$_gitname/LICENSE \
		$pkgdir/usr/share/licenses/$pkgname/LICENSE
}
