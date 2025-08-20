# Maintainer: sudoBash418 <sudoBash418 at gmail.com>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

_pkgbase=fuse
pkgname=lib32-fuse3
pkgver=3.17.4
pkgrel=1
pkgdesc="A library that makes it possible to implement a filesystem in a userspace program (32 bit)"
arch=('x86_64')
url="https://github.com/libfuse/libfuse"
license=('GPL-2.0-only')
depends=('lib32-glibc' 'fuse3')
makedepends=('gcc-multilib' 'meson' 'pkg-config')
source=("${url}/releases/download/${_pkgbase}-${pkgver}/${_pkgbase}-${pkgver}.tar.gz")
options=(!libtool)
sha256sums=('df9e40ae927b73dc702d0bce7925c0c618af47ad0b13204fbf2be66e54d8528b')

build() {
	# based off fuse3's build function

	export CFLAGS="-m32"
	export CXXFLAGS="-m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cd "${_pkgbase}-${pkgver}"
	rm -rf build
	meson --prefix=/usr --sbindir=bin --libdir=/usr/lib32 . build
	cd build
	ninja
}

package() {
	cd "${_pkgbase}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install

	# remove files that should be provided by other fuse packages
	rm -r "${pkgdir}"/{dev,etc,usr/{bin,include,share,lib}}
}
