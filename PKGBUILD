# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

pkgname=libfprint-acer-swift-1-git
_pkgname=libfprint
pkgver=1.94.0
pkgrel=1
pkgdesc="Library for fingerprint readers (patch for Acer Swift 1)"
arch=(x86_64)
url="https://fprint.freedesktop.org/"
license=(LGPL)
depends=(libgusb pixman nss systemd-libs)
makedepends=(git meson gtk-doc gobject-introspection systemd)
checkdepends=(python python-cairo python-gobject 'umockdev>=0.13.2')
provides=(libfprint libfprint-2.so)
conflicts=(libfprint)
groups=(fprint)
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git"
	'egis0570.patch')
sha256sums=('SKIP'
            '259a24e09f865340640be25bc7ea002504ca004c1aff2e3fc9cd51208e2cb378')

pkgver() {
	cd "${_pkgname}"
	git describe --tags | sed 's/^V_\|^v//;s/_/./g;s/-/.r/;s/-/./'
}

prepare() {
	cd "${_pkgname}"
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
