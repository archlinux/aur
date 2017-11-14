# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
pkgname=h5utils-git
pkgver=1.13.r7.g830b7f9
pkgrel=1
pkgdesc='A set of utilities for visualization and conversion of scientific data in the free, portable HDF5 format'
arch=('i686' 'x86_64')
url='https://github.com/stevengj/h5utils'
license=('MIT' 'GPL')
depends=('hdf5' 'libpng')
optdepends=('libmatheval: support symbolic expressions')
options=('!makeflags')
provides=('h5utils')
conflicts=('h5utils')
source=('git+https://github.com/stevengj/h5utils.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/h5utils"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/h5utils"
  
  #Fix for libpng upgrade problem adapted from https://gist.github.com/1626861
  mv writepng.c tmpfile1
  sed 's/png_ptr->jmpbuf/png_jmpbuf (png_ptr)/g' tmpfile1 > writepng.c 
  mv writepng.c tmpfile2
  sed 's/free(info_ptr->palette)\;/\/\* free(info_ptr->palette); \*\//g' tmpfile2 > writepng.c
 
  ./autogen.sh --prefix=/usr 
  make
 
}

package() {
  cd "${srcdir}/h5utils"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
