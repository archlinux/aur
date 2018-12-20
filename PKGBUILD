# Maintainer: Romain Porte <microjoe@mailoo.org>
# Comaintainer: Max Bruckner <max at maxbruckner dot de>
# Creator: chefpeyo <pierre-olivier.huguet@asp64.com>
# Contributor: kuri <sysegv@gmail.com>

pkgname=cjson-git
pkgver=v1.7.10.r0.gc69134d
pkgrel=1
pkgdesc="Dave Gamble's cJSON library. Easily handle JSON data in C (git version)."
arch=('i686' 'x86_64')
url="https://github.com/DaveGamble/cJSON"
license=('MIT')
makedepends=('git' 'cmake')
conflicts=()
provides=('cjson')
options=('!libtool')
source=('git://github.com/DaveGamble/cJSON.git')
md5sums=('SKIP')

_gitname="cJSON"

pkgver() {
	cd "$srcdir/$_gitname" || return 1
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd $_gitname || return 1

	rm -rf build
	mkdir build
	cd build || return 1
	cmake .. -DENABLE_CJSON_UTILS=On -DCMAKE_INSTALL_PREFIX=/usr
	make || return 1
}

check() {
	cd $_gitname/build || return 1
	make check || return 1
}

package() {
	cd $_gitname/build || return 1

	make DESTDIR="$pkgdir" install || return 1

	# install license files
	install -Dm644 "$srcdir/$_gitname/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
