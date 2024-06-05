# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: taotieren <admin@taotieren.com>
# Contributor: glatavento <glatavento at outlook dot com>

pkgname=libjaylink-git
_pkg="${pkgname%-git}"
pkgver=0.3.1.r9.g32c5ef7
pkgrel=1
pkgdesc='Library for accessing SEGGER J-Link and compatible devices'
arch=('x86_64')
url='https://gitlab.zapb.de/libjaylink/libjaylink'
license=('GPL-3.0-or-later')
depends=('glibc'
	'libusb')
makedepends=('git' 'meson')
optdepends=('doxygen: Required for API documentation')
provides=("$_pkg.so")
conflicts=("$_pkg")
source=("$_pkg::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkg}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare()
{
    git -C "${srcdir}/${_pkg}" clean -dfx
    meson subprojects download --sourcedi=${_pkg}
}

build() {
	arch-meson ${_pkg} build -Dusb=enabled
	meson compile -C build
}

check() {
  meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"

	sed -i 's|plugdev|uucp|g' ${srcdir}/${_pkg}/contrib/60-libjaylink.rules
	install -Dm644 ${srcdir}/${_pkg}/contrib/60-libjaylink.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
}
