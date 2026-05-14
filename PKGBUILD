# Maintainer: Jakub Smulski <hgonomeg@gmail.com>
# Maintainer: Alexander Minges <alexander.minges@gmail.com>

pkgname=libclipper
_pkgver_base=2.1
pkgver=2.1.20260505
_url=http://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/
_pkgname=clipper
pkgrel=5
pkgdesc="A set of object-oriented libraries for the organisation of crystallographic data"
arch=('i686' 'x86_64')
url="http://www.ysbl.york.ac.uk/~cowtan/clipper/clipper.html"
license=('LGPL')
makedepends=('gcc-fortran')
depends=('libccp4>=6.5.1-6' 'mmdb2>=2.0.19-1' 'fftw2-float' 'libssm')
source=(https://ccp4forge.rc-harwell.ac.uk/ccp4/clipper/-/archive/$_pkgver_base/clipper-$_pkgver_base.tar.gz
	    clipper-configure-2.patch)

sha256sums=('7e00a954b1501c28ad82ab17b53a9e01d98077f390d32f761810a9e3bcd43857'
            '3360bd62d5902ef6a740be02708d1a504c63ace3cf351ef380d1934111ef6978')

prepare() {
    cd "$srcdir/$_pkgname-$_pkgver_base"
    patch --forward --strip=0 --input="${srcdir}/clipper-configure-2.patch"
    # GCC 16 / libstdc++ removed the char* overload of operator>> for safety.
    # Pass the array directly so it matches the char(&)[N] overload.
    sed -i 's/from >> &word\[0\]/from >> word/' clipper/cif/cif_data_io.cpp

}

build() {
  cd "$srcdir/$_pkgname-$_pkgver_base"

  ./configure --prefix=/usr \
              --enable-shared \
              --disable-static \
              --enable-contrib \
              --enable-ccp4 \
              --enable-cif \
              --enable-mmdb \
              --enable-minimol \
              --enable-cns \
              --enable-phs \
              --enable-fortran
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver_base"

  make DESTDIR="$pkgdir/" install
}
