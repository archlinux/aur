# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=nasc
pkgver=0.8.0
_qalculate_ver=ad985fd77acfd54ee369d56f6066b1460b973cdb
pkgrel=2
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
sha512sums=('25afcb704da002e49879027e5df3ed045331f972d2c51ef12bd6936d58e0b81427e1d7744536f815981f5ded83f71940ff37403f5ee17f7f2b69c8ab1c8a3d10'
            'SKIP')

prepare () {
	cd "$pkgname-$pkgver/subprojects"
	rm -rf libqalculate
	ln -vsnf "../../libqalculate-$_qalculate_ver" libqalculate
	sed -i "s/link_with: 'libqalculate_lib_static'/link_with: libqalculate_lib_static/g" \
		libqalculate/libqalculate/meson.build
}

build () {
	rm -rf build
	arch-meson build "$pkgname-$pkgver"
	meson compile -C build
}

check () {
	meson test -C build
}

package () {
	meson install -C build --destdir="$pkgdir"
}
