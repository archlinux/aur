# Maintainer: sudoBash418 <sudoBash418 at gmail.com>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

_pkgbase=fuse
pkgname=lib32-${_pkgbase}2
pkgver=2.9.9
pkgrel=2
pkgdesc="A library that makes it possible to implement a filesystem in a userspace program (32 bit)"
arch=('x86_64')
url="https://github.com/libfuse/libfuse"
license=('GPL2')
depends=('lib32-glibc' 'fuse2')
makedepends=('gcc-multilib' 'autoconf')
provides=('lib32-fuse')
options=(!libtool)
source=(
	${url}/releases/download/${_pkgbase}-${pkgver}/${_pkgbase}-${pkgver}.tar.gz{,.asc}

	# bugfix: "Correct errno comparison"
	"0000-5d38afc.patch::https://github.com/libfuse/libfuse/commit/5d38afc8a5b4a2a6e27aad7a1840046e99cd826d.patch"
	# bugfix: "util/ulockmgr_server.c: conditionally define closefrom (fix glibc-2.34+)"
	"0001-5a43d0f.patch::https://github.com/libfuse/libfuse/commit/5a43d0f724c56f8836f3f92411e0de1b5f82db32.patch"
)
sha256sums=('d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7c1b4b5'
            'SKIP'
            '7f3e8e54966aca8cb64096bea2cbd4d2679b47f9c1355fe9d442ba8464d74372'
            '1e8b0a1b2bbaa335d92a3c46e31c928dcd53abe011214a0cbbfa7c11a3a68f1a')


validpgpkeys=('ED31791B2C5C1613AF388B8AD113FCAC3C4E599F')

prepare() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"

	shopt -s nullglob

	for filepath in ../*.patch; do
		patch -up1 <"$filepath"
	done
}

build() {
	export CC="gcc -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cd "${srcdir}/${_pkgbase}-${pkgver}"

	autoreconf -i
	./configure \
		--prefix=/usr --enable-lib \
		--enable-util --libdir=/usr/lib32
	make
}

package() {
	make -C "${srcdir}/${_pkgbase}-${pkgver}" DESTDIR="${pkgdir}" install
	rm -r "${pkgdir}"/{dev,etc,sbin,usr/{bin,include,share}}
}
