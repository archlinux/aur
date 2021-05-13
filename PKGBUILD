# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=nasc
pkgver=0.7.6
_qalculate_ver=ad985fd77acfd54ee369d56f6066b1460b973cdb
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
sha512sums=('db1981b8b5bd745fdac3f55a72f13df13395dbaed55fb30f25a959c7a543f0ed2862fa0552727fa41f67b84ffe3b26e1986145bc922527646e8b220785d6f8bf'
            'SKIP')

prepare () {
	cd "$pkgname-$pkgver/subprojects"
	rm -rf libqalculate
	ln -vsnf "../../libqalculate-$_qalculate_ver" libqalculate
}

build () {
	rm -rf build
	arch-meson build "$pkgname-$pkgver"
	meson compile -C build

	return
	# The libqalculate static library is built as a subproject, but its Meson
	# build definitions do not try to detect a few things. In particular, not
	# adding HAVE_UNORDERED_MAP here results in a build error with newer GCC
	# versions.
	cat >> build/subprojects/libqalculate/config.h <<-EOF
	#define _DIRENT_HAVE_D_TYPE 1
	#define HAVE_PIPE2 1
	#define HAVE_UNORDERED_MAP 1
	EOF
}

check () {
	meson test -C build
}

package () {
	meson install -C build --destdir="$pkgdir"
}
