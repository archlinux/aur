# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: McNoggins <gagnon88 at gmail>
pkgname=h5utils
pkgver=1.13
pkgrel=1
pkgdesc="Software for visualization/conversion of scientific data in the HDF5 format"
arch=('i686' 'x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/H5utils"
license=('MIT' 'GPL')
depends=('hdf5' 'libpng')
optdepends=('libmatheval: support symbolic expressions')
options=('!makeflags')
source=(https://github.com/stevengj/h5utils/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('7e8b05942908975455e81e12b0dcbc7bc12e9560c29d5203fce3b25d7de6e494')


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
