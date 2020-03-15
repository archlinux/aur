pkgname=libmodulemd
pkgver=2.9.1
pkgrel=1
pkgdesc="C Library for manipulating module metadata files"
arch=('i686' 'x86_64')
url="https://github.com/fedora-modularity/$pkgname"
license=('custom:MIT')
depends=('file' 'glib2' 'libyaml' 'rpm-tools')
makedepends=('gobject-introspection' 'gtk-doc' 'help2man' 'meson>=0.47' 'python-gobject')
optdepends=('python-gobject: for python bindings')
source=("$url/releases/download/$pkgname-$pkgver/${pkgname#lib}-$pkgver.tar.xz")
md5sums=('f7696db08afa26ca067051ba8e5f2f5b')

prepare() {
	mv "${pkgname#lib}-$pkgver" "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	arch-meson build -Ddeveloper_build=false
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
