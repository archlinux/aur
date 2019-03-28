pkgname=libmodulemd
pkgver=2.2.2
pkgrel=1
pkgdesc="C Library for manipulating module metadata files"
arch=('i686' 'x86_64')
url="https://github.com/fedora-modularity/$pkgname"
license=('custom:MIT')
depends=('glib2' 'libyaml')
makedepends=('gobject-introspection' 'gtk-doc' 'meson>=0.47' 'python-gobject')
optdepends=('python-gobject: for python bindings')
source=("$url/releases/download/$pkgname-$pkgver/${pkgname#lib}-$pkgver.tar.xz"
        "$pkgname-2.2.2-disable-python2.patch::$url/pull/258.patch")
md5sums=('5591eaa539444d43e9d61c5f7315e943'
         'cf09a032f530f9197f20174370d1d279')

prepare() {
	mv "${pkgname#lib}-$pkgver" "$pkgname-$pkgver"

	cd "$pkgname-$pkgver"

	# Disable python2 stuff
	patch -p1 < "$srcdir/$pkgname-2.2.2-disable-python2.patch"
}

build() {
	cd "$pkgname-$pkgver"
	arch-meson build -Ddeveloper_build=false -Dbuild_api_v1=true
	ninja -C build
}

check() {
	cd "$pkgname-$pkgver"
	ninja -C build test
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ninja -C build install

	# Defaults to libmodulemd API v1 until more software are ported to API v2
	ln -sf "$pkgname.so.1" "$pkgdir/usr/lib/$pkgname.so"

	install -Dp -m644 COPYING   "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
