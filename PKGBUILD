# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=libmpcdec
pkgname=lib32-${_pkgname}
pkgver=0.1+r475
pkgrel=1
epoch=1
_rel=475
pkgdesc="Musepack decoding library (32 bit)"
arch=('x86_64')
url="http://musepack.net/"
license=('custom')
depends=('lib32-glibc' "${_pkgname}" 'lib32-libreplaygain' 'lib32-libcue')
makedepends=('gcc-multilib')
source=("http://files.musepack.net/source/musepack_src_r${_rel}.tar.gz"
	'01_am-maintainer-mode.patch'
	'02_link-libm.patch'
	'03_mpcchap.patch'
	'04_link-order.patch'
	'05_visibility.patch'
	'1001_missing_extern_kw.patch'
	'add_subdir-objects.patch')
md5sums=('754d67be67f713e54baf70fcfdb2817e'
         '6da8b85474fe2fcf55d4a3cfa68ddd8e'
         '57f9c8f1858008ac14b0d3cf2b7cf2dc'
         'b0b499dcdbb87b53eaf6db67e1592b51'
         'b1e5b6f8cb3c5b77e4438971c7a20797'
         '661783cf9ad4fed435d1c055b74b680b'
         'e7ab0ee8b1753d5986a2cefe233cc99a'
         'dc3e62894bf81dabd4451646b183a2e4')

prepare() {
cd musepack_src_r${_rel}
patch -Np1 -i ../01_am-maintainer-mode.patch
patch -Np1 -i ../02_link-libm.patch
patch -Np1 -i ../03_mpcchap.patch
patch -Np1 -i ../04_link-order.patch
patch -Np1 -i ../05_visibility.patch
patch -Np1 -i ../1001_missing_extern_kw.patch
patch -Np1 -i ../add_subdir-objects.patch
mv configure.in configure.ac
}

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

cd musepack_src_r${_rel}
autoreconf -fi
./configure --prefix=/usr --enable-mpcchap --libdir=/usr/lib32 --libexecdir=/usr/lib32

make
}

package() {

cd musepack_src_r${_rel}
make -C include DESTDIR="${pkgdir}" install
make -C libmpcdec DESTDIR="${pkgdir}" install
install -Dm644 libmpcdec/COPYING ${pkgdir}/usr/share/licenses/lib32-libmpcdec/COPYING

rm -rf "${pkgdir}/usr/include"
#mkdir -p "${pkgdir}/usr/share/licenses"
#ln -sf ${_pkgname} "${pkgdir}/usr/share/licenses/${pkgname}"
}
