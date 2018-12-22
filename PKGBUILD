# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=libmodulemd-git
_pkgname=libmodulemd
pkgver=2.0.0.r0.g3a7a000
pkgrel=1
pkgdesc="C Library for manipulating module metadata files"
arch=("any")
license=("MIT")
url="https://github.com/fedora-modularity/libmodulemd"
makedepends=("meson" "ninja" "pkgconfig" "python-gobject" "valgrind" "autopep8")
source=("${_pkgname}::git+https://github.com/fedora-modularity/libmodulemd.git")
provides=('libmodulemd')
conflicts=('libmodulemd')
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"

	git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e 's/libmodulemd.//'
}

build() {
	cd "${srcdir}/${_pkgname}"

	arch-meson build -Ddeveloper_build=false -Dbuild_api_v1=true
	ninja -C build
}

check() {
	cd "${srcdir}/${_pkgname}"

	ninja -C build test
}

package() {
	cd "${srcdir}/${_pkgname}"

	DESTDIR="$pkgdir/" ninja -C build install

	# Defaults to libmodulemd API v1 until more software are ported to API v2
	ln -sf "$pkgname.so.1" "$pkgdir/usr/lib/$pkgname.so"

	install -Dp -m644 COPYING   "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
