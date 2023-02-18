# Maintainer: sudoBash418 <sudoBash418 at gmail.com>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

_pkgbase=fuse
pkgname=lib32-fuse3
pkgver=3.14.0
pkgrel=1
pkgdesc="A library that makes it possible to implement a filesystem in a userspace program (32 bit)"
arch=('x86_64')
url="https://github.com/libfuse/libfuse"
license=('GPL2')
depends=('lib32-glibc' 'fuse3')
makedepends=('gcc-multilib' 'meson' 'pkg-config')
source=(${url}/releases/download/${_pkgbase}-${pkgver}/${_pkgbase}-${pkgver}.tar.xz{,.asc})
options=(!libtool)
sha256sums=('96115b2a8ff34bd1e0c7b00c5dfd8297571d7e165042b94498c9a26356a9a70a'
            'SKIP')
validpgpkeys=(ED31791B2C5C1613AF388B8AD113FCAC3C4E599F)

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
