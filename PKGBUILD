# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: McNoggins <gagnon88 at gmail>
# Maintainer: Eothred <yngve AT pm DOT me>
pkgname=h5utils
pkgver=1.13.2
pkgrel=1
pkgdesc="Software for visualization/conversion of scientific data in the HDF5 format"
arch=('i686' 'x86_64')
url="https://github.com/NanoComp/h5utils"
license=('MIT' 'GPL')
depends=('hdf5' 'libpng' 'gcc-libs' 'glibc')
optdepends=('libmatheval: support symbolic expressions')
options=('!makeflags')
source=(https://github.com/stevengj/h5utils/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('eea7855a8235facb7c454e61103098e55658da0ddf4b6de5b82a992e5f024351')


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
