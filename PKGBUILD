pkgname=libmodulemd
pkgver=2.0.0
pkgrel=1
pkgdesc="C Library for manipulating module metadata files"
arch=('i686' 'x86_64')
url="https://github.com/fedora-modularity/$pkgname"
license=('custom:MIT')
depends=('glib2' 'libyaml')
makedepends=('gobject-introspection' 'gtk-doc' 'meson' 'python-gobject')
optdepends=('python-gobject: for python bindings')
source=("$url/releases/download/$pkgname-$pkgver/${pkgname#lib}-$pkgver.tar.xz")
md5sums=('cce2ddc925d08c9fb9a65681f227d1c8')

prepare() {
	mv "${pkgname#lib}-$pkgver" "$pkgname-$pkgver"
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
