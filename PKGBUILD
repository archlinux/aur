# Maintainer: éclairevoyant
# Contributor: Dave Reisner <d at falconindy dot com>

_pkgname=pkgfile
pkgname="$_pkgname-git"
pkgver=21.r52.9c45690
pkgrel=1
epoch=1
pkgdesc="a pacman .files metadata explorer"
arch=('x86_64' 'i686')
url="https://github.com/falconindy/$_pkgname"
license=('MIT')
depends=(curl libarchive pacman pcre systemd-libs)
makedepends=(git meson perl)
checkdepends=(gmock gtest python)
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("git+$url.git"
        0001-Fix-build-failure-missing-include-of-optional.patch)
b2sums=('SKIP'
        'eb2bc196cbd1c084ed81c4664bbffa2c57f5aa743a9928347003ed062479bb78cc9bfed6fd9346067f0e2fae062d9707f90662a70a93d6d6b9706380339c2f75')

pkgver() {
	cd $_pkgname
	git describe | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	patch -Np1 -i ../0001-Fix-build-failure-missing-include-of-optional.patch
}

build() {
	cd $_pkgname
	arch-meson build
	ninja -C build
}

check() {
	cd $_pkgname
	meson test -C build
}

package() {
	cd $_pkgname
	DESTDIR="$pkgdir" ninja -C build install
}
