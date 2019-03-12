# Maintainer: Jesin <Jesin00@gmail.com>
pkgname=libb2-git
_name="${pkgname%-git}"
pkgver=0.98.1
pkgrel=1
arch=(x86_64)
pkgdesc='C library providing BLAKE2b, BLAKE2s, BLAKE2bp, BLAKE2sp hash functions'
url=https://blake2.net/
license=(custom:CC0)
makedepends=(git)
provides=("$_name=${pkgver%%+*}")
conflicts=("$_name")
source=("git+https://github.com/BLAKE2/$_name")
sha256sums=(SKIP)

# libb2's build system discards the $CFLAGS variable.
# We can get around this by putting those flags in $CC.
export CC="${CC-cc} $CFLAGS"

prepare() {
	cd "$_name"
	# If there are no tags, tag the initial commit so pkgver() can work.
	[ -n "$(git tag)" ] || git tag 0.0 "$(git rev-list --max-parents=0 --reverse HEAD | head -n1)"
	autoreconf -fisv
}

pkgver() {
	cd "$_name"
	local v="$(git describe --tags)"
	v="${v#v}"
	printf %s "${v//-/+}"
}

build() {
	cd "$_name"
	./configure --prefix=/usr --disable-static --enable-shared "--build=$CHOST" #--disable-native --enable-fat
	# Uncomment the flags at the end of the previous line if you intend
	# to distribute the binary package to other computers.
	make
}

check() {
	cd "$_name"
	make check
}

package() {
	cd "$_name"
	make "DESTDIR=$pkgdir" install
	install -Dm644 "-t$pkgdir/usr/share/licenses/$_name" COPYING
}
