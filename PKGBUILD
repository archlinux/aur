pkgname=libmodulemd
pkgver=2.6.0
pkgrel=1
pkgdesc="C Library for manipulating module metadata files"
arch=('i686' 'x86_64')
url="https://github.com/fedora-modularity/$pkgname"
license=('custom:MIT')
depends=('glib2' 'libyaml')
makedepends=('gobject-introspection' 'gtk-doc' 'meson>=0.47' 'python-gobject')
optdepends=('python-gobject: for python bindings')
source=("$url/releases/download/$pkgname-$pkgver/${pkgname#lib}-$pkgver.tar.xz")
md5sums=('d0c7ce321f83640b674a733d5a7de5f3')

prepare() {
	mv "${pkgname#lib}-$pkgver" "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	arch-meson build -Ddeveloper_build=false -Dbuild_api_v1=true
	ninja -C build

	# Trick to be able to link binaries against either v1 or v2 API
	sed -e '/Libs:/ s/-lmodulemd/&-2.0/' \
	    -i build/meson-private/modulemd-2.0.pc
}

check() {
	cd "$pkgname-$pkgver"
	ninja -C build test
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ninja -C build install

	# Trick to be able to link binaries against either v1 or v2 API
	ln -sf "$pkgname.so.1" "$pkgdir/usr/lib/$pkgname.so"
	ln -sf "$pkgname.so.2" "$pkgdir/usr/lib/$pkgname-2.0.so"

	install -Dp -m644 COPYING   "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

	chmod 644 "$pkgdir/"usr/share/gtk-doc/html/modulemd-[12].0/style.css
}

# vim: set ft=sh ts=4 sw=4 noet:
