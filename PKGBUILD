# Maintainer: Egor Vorontsov <sdoregor@gmail.com>

pkgname=libfprint-egis0570-git
_pkgname=libfprint
_patchcommit=33a42c1ffc59693a049f70a19b1e7c52cac4407c
epoch=1
pkgver=1.90.1.r90.g1cd0985
pkgrel=1
pkgdesc="Library for fingerprint readers (egis0570 fork, patch for Acer Swift 1)"
arch=(x86_64)
url="https://fprint.freedesktop.org/"
license=(LGPL)
depends=(libgusb pixman nss systemd-libs)
makedepends=(git meson gtk-doc gobject-introspection systemd)
checkdepends=(python python-cairo python-gobject 'umockdev>=0.13.2')
provides=(libfprint libfprint-2.so)
conflicts=(libfprint)
groups=(fprint)
source=("git+https://gitlab.freedesktop.org/indev29/libfprint.git#branch=egis0570"
	"https://gitlab.freedesktop.org/libfprint/libfprint/-/commit/${_patchcommit}.diff"
	"egis0570.patch")
sha256sums=('SKIP'
            'd5f0546e4fe17625625a15ea0cfbe215779b38256fbefa9cb13da4b59de32295'
            '760e61e69075aa896330646b9a2e674d014a25bc022664dbbf986fd69d146fa8')

pkgver() {
	cd "${_pkgname}"
	git describe --tags | sed 's/^V_\|^v//;s/_/./g;s/-/.r/;s/-/./'
}

prepare() {
	cd "${_pkgname}"
	patch --forward --strip=1 --input="${srcdir}/${_patchcommit}.diff"
	patch --forward --strip=1 --input="${srcdir}/egis0570.patch"
}

build() {
	arch-meson "${_pkgname}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
