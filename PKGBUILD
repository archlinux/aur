pkgname=libmodulemd
pkgver=2.8.1
pkgrel=1
pkgdesc="C Library for manipulating module metadata files"
arch=('i686' 'x86_64')
url="https://github.com/fedora-modularity/$pkgname"
license=('custom:MIT')
depends=('file' 'glib2' 'libyaml' 'rpm-org')
makedepends=('gobject-introspection' 'gtk-doc' 'meson>=0.47' 'python-gobject')
optdepends=('python-gobject: for python bindings')
source=("$url/releases/download/$pkgname-$pkgver/${pkgname#lib}-$pkgver.tar.xz")
md5sums=('969cddf3ebc88ffca67d7be20d03be2e')

prepare() {
	mv "${pkgname#lib}-$pkgver" "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	arch-meson build -Ddeveloper_build=false -Dwith_py2_overrides=false
	ninja -C build
}

check() {
	cd "$pkgname-$pkgver"
	ninja -C build test
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ninja -C build install

	install -Dp -m644 COPYING   "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
