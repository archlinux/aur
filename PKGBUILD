# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=tang-git
pkgver=7.r2.fed9020
pkgrel=1
pkgdesc='Server for binding data to network presence'
arch=('x86_64')
url='https://github.com/latchset/tang'
license=('GPL3')
depends=('http-parser' 'jose')
makedepends=('git' 'asciidoc' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	# Use -Wformat in addition to -Wformat-security in add_project_arguments
	# (https://github.com/latchset/tang/pull/41)
	git cherry-pick --no-commit ceaaa98e91f9d2aaf89090f624ed969ab21c505a
}

build() {
	cd "${pkgname%-git}"
	meson --libexecdir=/usr/lib --buildtype=plain build
	ninja -C build
}

check() {
	cd "${pkgname%-git}"
	ninja -C build test
}

package() {
	cd "${pkgname%-git}"
	DESTDIR="$pkgdir" ninja -C build install
}
