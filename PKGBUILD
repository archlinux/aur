# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=nasc
pkgver=0.6.1
_qalculate_ver=9587044297dfe0f6de02df0af77c511236406a2a
pkgrel=1
pkgdesc='Do maths like a normal person.'
arch=(i686 x86_64)
url=https://parnold-x.github.io/nasc/
license=(GPL3)
depends=(granite gtksourceview3 mpfr)
optdepends=()
makedepends=(vala git meson intltool)
conflicts=(nasc-git nasc-bzr)
source=("$pkgname-$pkgver.tar.gz::https://github.com/parnold-x/nasc/archive/$pkgver.tar.gz"
		"libqalculate-$_qalculate_ver::git+https://github.com/parnold-x/libqalculate#commit=$_qalculate_ver")
sha512sums=('fcb8b1c19349e18fdf81f3f6609c658b079880ff73caf40b8c8dd5e553cbb2cac11f6e58ea6caaf76105d83a44d9a9968bb6e2cfa06ccf1b425443ee6504c269'
            'SKIP')

prepare () {
	cd "$pkgname-$pkgver/subprojects"
	rm -rf libqalculate
	ln -vsnf "../../libqalculate-$_qalculate_ver" libqalculate
}

build () {
	rm -rf build
	arch-meson build "$pkgname-$pkgver"

	# The libqalculate static library is built as a subproject, but its Meson
	# build definitions do not try to detect a few things. In particular, not
	# adding HAVE_UNORDERED_MAP here results in a build error with newer GCC
	# versions.
	cat >> build/subprojects/libqalculate/config.h <<-EOF
	#define _DIRENT_HAVE_D_TYPE 1
	#define HAVE_PIPE2 1
	#define HAVE_UNORDERED_MAP 1
	EOF

	ninja -C build
}

check () {
	ninja -C build test
}

package () {
	DESTDIR="$pkgdir" ninja -C build install
}
