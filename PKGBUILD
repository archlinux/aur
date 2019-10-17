pkgname=libmodulemd1
_pkgname=libmodulemd
pkgver=1.8.16
pkgrel=1
pkgdesc="C Library for manipulating module metadata files (v1 API)"
arch=('i686' 'x86_64')
url="https://github.com/fedora-modularity/$_pkgname"
license=('custom:MIT')
depends=('glib2' 'libyaml')
makedepends=('gobject-introspection' 'gtk-doc' 'meson>=0.47' 'python-gobject')
optdepends=('python-gobject: for python bindings')
source=("$url/releases/download/$_pkgname-$pkgver/${_pkgname#lib}-$pkgver.tar.xz")
md5sums=('f94a217c1e9f4feb383b8ef15bcf0e54')

prepare() {
	mv "${_pkgname#lib}-$pkgver" "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	arch-meson build -Ddeveloper_build=false
	ninja -C build

	# Trick to be able to link binaries against either v1 or v2 API
	sed -e '/Libs:/ s/-lmodulemd/&1/' \
	    -i build/meson-private/modulemd.pc

}

check() {
	cd "$pkgname-$pkgver"
	ninja -C build test
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ninja -C build install

	# Trick to be able to link binaries against either v1 or v2 API
	rm -f "$pkgdir/usr/lib/$_pkgname.so"
	ln -sf "$_pkgname.so.1" "$pkgdir/usr/lib/$pkgname.so"

	install -Dp -m644 COPYING   "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
