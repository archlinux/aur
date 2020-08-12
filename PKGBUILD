# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=nasc
pkgver=0.7.4
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
sha512sums=('23ed8e3facc20d8ae4a9f9d7927426ee298301254377af6318f5b22f48b30a400c64ecef5fbd81d62d53236ced7b39d47ef45c7d4c88473164483b57e81dc6a8'
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
