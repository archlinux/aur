# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Kazuo Teramoto <kaz.rag at gmail dot com>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-libcdio
_pkgname=libcdio
pkgver=0.93
pkgrel=1
pkgdesc="GNU Compact Disc Input and Control Library (32-bit)"
arch=("x86_64")
license=('GPL3')
url="http://www.gnu.org/software/libcdio/"
depends=('gcc-libs-multilib>=4.4.2' "libcdio")
options=('!libtool')
install=libcdio.install
source=(http://ftp.gnu.org/gnu/libcdio/${_pkgname}-${pkgver}.tar.gz{,.sig}
        libcdio-0.83-linking.patch)
md5sums=('d154476feaac5a7b5f180e83eaf3d689'
         'SKIP'
         '5a7f50209c03d5919d5b932f07871af7')

prepare() {
cd "${srcdir}/${_pkgname}-${pkgver}"
patch -Np1 -i $srcdir/libcdio-0.83-linking.patch
}	

build() {
export CC="gcc -m32"
export CXX="g++ -m32"
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

cd "${srcdir}/${_pkgname}-${pkgver}"
./configure --prefix=/usr --disable-vcd-info --enable-cpp-progs \
    --libdir=/usr/lib32 --without-cd-drive --without-cd-info \
    --without-cdda-player --without-cd-read --without-iso-info \
    --without-iso-read --disable-cddb
make
}
package() {
cd "${srcdir}/${_pkgname}-${pkgver}"
make -j1 DESTDIR="${pkgdir}" install

rm -rf ${pkgdir}/usr/bin ${pkgdir}/usr/include ${pkgdir}/usr/share
}
