# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=libofa
pkgname=lib32-${_pkgname}
pkgver=0.9.3
pkgrel=4
pkgdesc="An open-source audio fingerprint by MusicIP (32 bit)"
arch=('x86_64')
url="http://code.google.com/p/musicip-libofa/"
license=('GPL2' 'custom')
depends=('lib32-expat' 'lib32-fftw' 'lib32-gcc-libs' "${_pkgname}")
makedepends=('gcc-multilib' 'lib32-curl')
source=("http://musicip-libofa.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz"
    'gcc-4.patch'
    'gcc4.3.patch'
    'gcc4.5.patch'
	'libofa-0.9.3-curl-7.21.patch'
	'libofa-0.9.3-gcc-4.7.patch')
md5sums=('51507d2c4b432bd2755f48d58471696e'
         'a6f78b90bd0f4354d022a71c3e58ef6c'
         'dd57db13770b8f8d196e8a3d3a50e713'
         'c245363368d0e6fa2b4676364b81b74f'
         '2e1579d74613cfbb1799d0ab5f1a4cba'
         'a53a0104f9b5bba220322c6d0b68bf96')

prepare() {
cd ${_pkgname}-${pkgver}
patch -p0 -i "${srcdir}/gcc-4.patch"
patch -p1 -i "${srcdir}/gcc4.3.patch"
patch -p1 -i "${srcdir}/gcc4.5.patch"
patch -p1 -i "${srcdir}/libofa-0.9.3-gcc-4.7.patch"
patch -p1 -i "${srcdir}/libofa-0.9.3-curl-7.21.patch"
}

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd ${_pkgname}-${pkgver}
  
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
cd ${_pkgname}-${pkgver}
make DESTDIR=${pkgdir} install
rm -rf "${pkgdir}/usr/include"
mkdir -p "${pkgdir}/usr/share/licenses"
install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
