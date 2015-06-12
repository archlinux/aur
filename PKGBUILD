# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: McNoggins <gagnon88 at gmail>
pkgname=h5utils
pkgver=1.12.1
pkgrel=7
pkgdesc="Software for visualization/conversion of scientific data in the HDF5 format"
arch=('i686' 'x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/H5utils"
license=('MIT' 'GPL')
depends=('hdf5' 'libpng')
optdepends=('libmatheval: support symbolic expressions')
source=(http://ab-initio.mit.edu/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('7290290ca5d5d4451d757a70c86baaa70d23a28edb09c951b6b77c22b924a38d')


build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  
  #Fix for libpng upgrade problem adapted from https://gist.github.com/1626861
  mv writepng.c tmpfile1
  sed 's/png_ptr->jmpbuf/png_jmpbuf (png_ptr)/g' tmpfile1 > writepng.c 
  mv writepng.c tmpfile2
  sed 's/free(info_ptr->palette)\;/\/\* free(info_ptr->palette); \*\//g' tmpfile2 > writepng.c
 
  ./configure --prefix=/usr 
  make
 
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
