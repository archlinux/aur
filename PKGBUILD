# Maintainer: Andris Pavenis <andris.pavenis iki fi>

pkgname=djgpp-djcrx-cvs
pkgver=2.06.cvs20190901
pkgrel=2
pkgdesc="Headers and utilities for the djgpp cross-compiler (development version)"
arch=('i686' 'x86_64')
url="http://www.delorie.com/djgpp/"
depends=('glibc' 'gcc-libs')
provides=('djgpp-djcrx')
conflicts=('djgpp-djcrx-bootstrap' 'djgpp-djcrx')
license=('GPL' 'LGPL' 'custom:djgpp')
source=('dxegen.patch')
makedepends=('djgpp-gcc' 'djgpp-binutils' 'cvs')
sha256sums=('0debe0161e27aeb004e89a43915d6d77bcd07a5db2c67e2798568535fe9143f1')
options=('!buildflags' '!strip')
_target='i686-pc-msdosdjgpp'
_cvsroot=':pserver:anonymous:anonymous@cvs.delorie.com:/cvs/djgpp'
_cvsmod='djgpp'

pkgver() {
  date '+2.06.cvs%Y%m%d'
}

prepare() {
  _top=$(pwd)
  if [ -d ${_cvsmod}/CVS ] ; then
    cd $_cvsmod
    cvs -z3 -q -d ${_cvsroot} update -d
  else
    cvs -z3 -q -d ${_cvsroot} co -f ${_cvsmod}
  fi
  cd ${_top}

  rm -rf ${srcdir}/${_cvsmod}.build
  cp -r ${_cvsmod} ${srcdir}/${_cvsmod}.build

  cd ${srcdir}/${_cvsmod}.build
  patch -Np0 <${srcdir}/dxegen.patch
 }
  
 build() {
  cd ${srcdir}/${_cvsmod}.build/src
  make clean
  make -j1 CROSS_PREFIX=${_target}-

  cd dxe
  make -f makefile.dxe CROSS_PREFIX=${_target}-
}

package() {
  cd ${srcdir}/${_cvsmod}.build
  pwd
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/$_target/bin
  install -d "$pkgdir"/usr/$_target/sys-include

  cp -r include/* "$pkgdir"/usr/$_target/sys-include
  cp -r lib "$pkgdir"/usr/$_target

  cd hostbin
  for _file in djasm mkdoc stubedit stubify; do
    install -m0755 $_file.exe "$pkgdir"/usr/$_target/bin/$_file
    ln -s ../$_target/bin/$_file "$pkgdir"/usr/bin/$_target-$_file
  done

  cd ../src/dxe
  for _file in dxe3gen dxe3res; do
    install -m0755 $_file "$pkgdir"/usr/$_target/bin/$_file
    ln -s ../$_target/bin/$_file "$pkgdir"/usr/bin/$_target-$_file
  done
  ln -s dxe3gen "$pkgdir"/usr/$_target/bin/dxegen

  cd ${srcdir}/${_cvsmod}.build
  install -Dm644 copying.dj "$pkgdir"/usr/share/licenses/$pkgname/copying.dj

  cd info
  for _file in *.info; do
    install -Dm0644 $_file "$pkgdir"/usr/share/info/djgpp-$_file
  done
}
