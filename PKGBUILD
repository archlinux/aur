# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=nasc
pkgver=0.7.5
_qalculate_ver=a5da3bf1bf384fd14ce2d993cdccace323ab7321
pkgrel=1
pkgdesc='Do maths like a normal person.'
arch=(i686 x86_64)
url=https://parnold-x.github.io/nasc/
license=(GPL3)
depends=(granite gtksourceview3 mpfr webkit2gtk)
optdepends=()
makedepends=(vala git meson intltool)
conflicts=(nasc-git nasc-bzr)
source=("$pkgname-$pkgver.tar.gz::https://github.com/parnold-x/nasc/archive/$pkgver.tar.gz"
		"libqalculate-$_qalculate_ver::git+https://github.com/parnold-x/libqalculate#commit=$_qalculate_ver")
sha512sums=('580fea7635ccf8e1f2cc0fc3b33648b4ef8848a5f1eeca87b090e8e011c3a156d3da9c074fb513f3a3da2188e086954ea324ba54e20b56cd41da3a3aa1e4cd42'
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
