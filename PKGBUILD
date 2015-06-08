# Contributor: tobias <tobias@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: JD Steffen <jd@steffennet.org>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=xvidcore
pkgname=lib32-$_pkgname
pkgver=1.3.3
pkgrel=1
pkgdesc="XviD is an open source MPEG-4 video codec (32-bit)"
arch=('x86_64')
license=('GPL')
url="http://www.xvid.org/"
depends=('lib32-glibc' "$_pkgname")
makedepends=('nasm')
source=("http://downloads.xvid.org/downloads/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('f0a77572ac4694038e8519726b2883d9')

build() {

export CC="gcc -m32"
export CXX="g++ -m32"
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
cd ${srcdir}/${_pkgname}/build/generic
./configure --prefix=/usr \
     --libdir=/usr/lib32 \
     --host=x86_64-unknown-linux-gnu \
     --target=i686-unknown-linux-gnu

make
}

package() {

cd ${srcdir}/${_pkgname}/build/generic
make DESTDIR=${pkgdir} install

rm -rf "${pkgdir}"/usr/{include,share,bin}

#Fix dynamic libraries
cd ${pkgdir}/usr/lib32
mylib=$(basename libxvidcore.so.*)
ln -sf ${mylib} libxvidcore.so.4
ln -sf ${mylib} libxvidcore.so
}
