# Maintainer: Jesin <Jesin00@gmail.com>
pkgname=libb2
pkgver=0.0.15.g9a0d006
pkgrel=1
arch=(i686 x86_64)
pkgdesc='C library providing BLAKE2b, BLAKE2s, BLAKE2bp, BLAKE2sp hash functions'
url=https://blake2.net/
license=(custom:CC0)
makedepends=(git)
source=("git+https://github.com/BLAKE2/$pkgname")
sha256sums=(SKIP)

# libb2's build system discards the $CFLAGS variable.
# We can get around this by putting those flags in $CC.
export CC="${CC-cc} $CFLAGS"

prepare() {
	cd "$pkgname"
	# If there are no tags, tag the initial commit so pkgver() can work.
	[ -n "$(git tag)" ] || git tag 0.0 "$(git rev-list --max-parents=0 --reverse HEAD | head -n1)"
	autoreconf -fiv
}

pkgver() {
	cd "$pkgname"
	local v="$(git describe --tags)"
	printf %s\\n "${v//-/.}"
}

build() {
	cd "$pkgname"
	./configure --prefix=/usr --disable-static --enable-shared "--build=$CHOST" #--disable-native --enable-fat
	# Uncomment the flags at the end of the previous line if you intend
	# to distribute the binary package to other computers.
	make
}

package() {
	cd "$pkgname"
	make "DESTDIR=$pkgdir" install
}
