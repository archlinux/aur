# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=fftw
pkgname=lib32-${_pkgname}
pkgver=3.3.4
pkgrel=1
pkgdesc="A library for computing the discrete Fourier transform (DFT) (32 bit)"
arch=('x86_64')
license=('GPL2')
url="http://www.fftw.org/"
depends=('lib32-glibc' "${_pkgname}")
makedepends=('gcc-fortran-multilib')
options=('!libtool')
source=("http://www.fftw.org/${_pkgname}-${pkgver}.tar.gz")
md5sums=('2edab8c06b24feeb3b82bbb3ebf3e7b3')

# notes:
# http://www.fftw.org/fftw2_doc/fftw_6.html#SEC69
# http://www.fftw.org/faq/section2.html#singleprec
# http://www.fftw.org/fftw3_doc/Precision.html#Precision


build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cp -af ${_pkgname}-${pkgver} ${_pkgname}-${pkgver}-double
cp -af ${_pkgname}-${pkgver} ${_pkgname}-${pkgver}-long-double
mv -f ${_pkgname}-${pkgver} ${_pkgname}-${pkgver}-single

# use upstream default CFLAGS while keeping our -march/-mtune
CFLAGS+=" -O3 -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math"

CONFIGURE="./configure F77=gfortran --prefix=/usr \
	--enable-shared --enable-threads \
	--enable-openmp \
	--libdir=/usr/lib32"

msg "build double precision"
cd ${srcdir}/${_pkgname}-${pkgver}-double
$CONFIGURE --enable-sse2 --enable-avx
make

msg "build long double precision"
cd ${srcdir}/${_pkgname}-${pkgver}-long-double
$CONFIGURE --enable-long-double
make

msg "build single precision"
cd ${srcdir}/${_pkgname}-${pkgver}-single
$CONFIGURE --enable-float --enable-sse --enable-avx
make
}

package() {
cd ${srcdir}/${_pkgname}-${pkgver}-double
make DESTDIR="${pkgdir}" install

cd ${srcdir}/${_pkgname}-${pkgver}-long-double
make DESTDIR="${pkgdir}" install

cd ${srcdir}/${_pkgname}-${pkgver}-single
make DESTDIR="${pkgdir}" install

rm -rf "${pkgdir}/usr"/{bin,include,share}
}
