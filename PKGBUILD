# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Merkil <merkil@savhon.org>
# Maintainer: GordonGR <gordongr@freemail.gr>


pkgname=lib32-libmad
_pkgname=libmad
pkgver=0.15.1b
pkgrel=1
pkgdesc="A high-quality MPEG audio decoder"
arch=('x86_64')
url="http://www.underbit.com/products/mad/"
license=('GPL')
depends=('glibc' "${_pkgname}")
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/mad/${_pkgname}-${pkgver}.tar.gz"
		"libmad.patch" "amd64-64bit.diff" "frame_length.diff" "optimize.diff")
md5sums=('1be543bc30c56fb6bea1d7bf6a64e66c'
         'fbcca0267a423bae45389666f4cb04d5'
         '8d8bd64a2842dd59153b3a6642059e23'
         '3329b032118a68e18908197e65b3198d'
         '3e52afe2103f367810a18bef9e82eb9f')

prepare() {
cd "${srcdir}/${_pkgname}-${pkgver}"
patch -p1 -i "${srcdir}/libmad.patch"
patch -p1 -i "${srcdir}/amd64-64bit.diff"
patch -p1 -i "${srcdir}/frame_length.diff"
patch -p1 -i "${srcdir}/optimize.diff"
}

build() {
cd "${srcdir}/${_pkgname}-${pkgver}"
export CC="gcc -m32"
export CXX="g++ -m32"
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
CFLAGS="$CFLAGS -ftree-vectorize -ftree-vectorizer-verbose=1"
autoconf
./configure --prefix=/usr --libdir=/usr/lib32 --libexecdir=/usr/lib32
make
}

package() {
cd "${srcdir}/${_pkgname}-${pkgver}"
make DESTDIR="${pkgdir}" install
cd "$pkgdir/usr"
rm -rf include/
}
