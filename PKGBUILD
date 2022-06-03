# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=libmodulemd-git
pkgver=2.14.0.r13.ga0741ff
pkgrel=1
pkgdesc="C Library for manipulating module metadata files"
arch=("any")
license=("MIT")
url="https://github.com/fedora-modularity/libmodulemd#branch=main"
makedepends=("meson" "ninja" "pkgconfig" "python-gobject" "valgrind" "autopep8")
source=("${pkgname}::git+https://github.com/fedora-modularity/libmodulemd.git")
provides=('libmodulemd')
conflicts=('libmodulemd')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
	cd "${srcdir}/${pkgname}"

	arch-meson build
	ninja -C build
	ninja -C build modulemd-2.0-doc
}

check() {
	cd "${srcdir}/${pkgname}"

	#ninja -C build test
}

package() {
	cd "${srcdir}/${pkgname}"

	DESTDIR="${pkgdir}/" ninja -C build install

	# Defaults to libmodulemd API v1 until more software are ported to API v2
	ln -sf "${pkgname%%-git}.so.1" "${pkgdir}/usr/lib/${pkgname%%-git}.so"

	install -Dp -m644 COPYING   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dp -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
