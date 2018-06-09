# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Merkil <merkil@savhon.org>
# Maintainer: GordonGR <gordongr@freemail.gr>


pkgname=lib32-libmad
_pkgname=libmad
pkgver=0.15.1b
pkgrel=2
pkgdesc="A high-quality MPEG audio decoder"
arch=('x86_64')
url="http://www.underbit.com/products/mad/"
license=('GPL')
depends=('glibc' "${_pkgname}")
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/mad/${_pkgname}-${pkgver}.tar.gz"
		"libmad.patch" "amd64-64bit.diff" "frame_length.diff" "optimize.diff")

sha512sums=('2cad30347fb310dc605c46bacd9da117f447a5cabedd8fefdb24ab5de641429e5ec5ce8af7aefa6a75a3f545d3adfa255e3fa0a2d50971f76bc0c4fc0400cc45'
            'ff815f5aa32aec4230351b258430ca2184c0a44f80845c92b46aedb9942b3cd85c7b3aa575f4f562a5e02f7fadf6f3d6fe06e64d2b65418dbcd10762214695b1'
            '4fc15af4ef497220ee75e3798fbf504be2495fded7202b202169440a387573a3b3105a278d6e5c2ae10d2351a6f9b61895ccde323787314605519ffa23bb080f'
            '94bcb95f97ba839ecc12d9610f3b6c867f3d732e567343989086b213108120af02f3ebcd2da92352ea2607b6890433df7576026ee92efc57623ab1a64801fa2b'
            'bae8ed5860859b3fc0391d24fb4d4dd1bb25ae46b7f2600dd10bf56d0f6a446c982df5748cf19bfa43020155de3bf6638053cb0596db35549db2186f46e09644')

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
