# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgbase=heasoft
_mainpkg=heasoft
_mainver=6.21
_crntpkg=''
pkgname=('heasoft-base' 'xspec' 'ftools')
pkgver=6.21
pkgrel=1
makedepends=("gcc" "glibc" "gcc-fortran" "perl")
depends=("ncurses" "libtinfo" "readline" "libxpm" )
url="https://heasarc.gsfc.nasa.gov/docs/software/lheasoft/"
arch=('x86_64')
license=('NASA' 'GPL')
source=(http://heasarc.gsfc.nasa.gov/FTP/software/lheasoft/release/${pkgbase}-${pkgver}src_no_xspec_modeldata.tar.gz ${pkgbase}-${pkgver}_nolynx.patch)
sha1sums=('3a315e28f55df904b66a268dfc51b8d5f2c2a0b3'
	'c1d4940d1aa599bf3b8b61b3471ebf057869b517')

prepare() {
  # lynx conflict with ncurses and openssl. For now left it out.
  cd $srcdir/${pkgbase}-${pkgver}
  patch -Np1 -i ../${pkgbase}-${pkgver}_nolynx.patch 
}


build() {

  export CC=/usr/bin/gcc
  export CXX=/usr/bin/g++
  export FC=/usr/bin/gfortran
  export PERL=/usr/bin/perl

  cd $srcdir/${_mainpkg}-${pkgver}/BUILD_DIR
  ./configure --prefix=$pkgdir/opt/$pkgbase-$pkgver
  
  make 

}

package_heasoft-base(){

  _crntpkg='heasoft-base'
  pkgdesc='Base libraries for heasoft software'
  pkgver=6.21

  cd $srcdir/$pkgbase-${_mainver}/BUILD_DIR
  ./configure --prefix=$pkgdir/opt/$pkgbase-${_mainver}
  make "HD_SELECTED=heacore tcltk heatool heagen attitude" install

}

# Remove common files
_clean_conflict () {

  export _glibcver=$(ldd --version | head -n1 | cut -d' ' -f4)

  echo $pkgdir/opt/${_mainpkg}-$pkgver/x86_64-unknown-linux-gnu-libc${_glibcver}/BUILD_DIR/

  rm -rf $pkgdir/opt/${_mainpkg}-$pkgver/x86_64-unknown-linux-gnu-libc${_glibcver}/BUILD_DIR/
  rm -rf $pkgdir/opt/${_mainpkg}-$pkgver/x86_64-unknown-linux-gnu-libc${_glibcver}/bin/hd_install
  rm -rf $pkgdir/opt/${_mainpkg}-$pkgver/x86_64-unknown-linux-gnu-libc${_glibcver}/bin/hd_scanenv
  rm -rf $pkgdir/opt/${_mainpkg}-$pkgver/x86_64-unknown-linux-gnu-libc${_glibcver}/bin/hmake
  rm -rf $pkgdir/opt/${_mainpkg}-$pkgver/x86_64-unknown-linux-gnu-libc${_glibcver}/bin/lhea-fixperl
  rm -rf $pkgdir/opt/${_mainpkg}-$pkgver/x86_64-unknown-linux-gnu-libc${_glibcver}/headas-init.csh
  rm -rf $pkgdir/opt/${_mainpkg}-$pkgver/x86_64-unknown-linux-gnu-libc${_glibcver}/headas-init.sh

}

package_xspec(){

  _crntpkg='xspec'
  pkgdesc='X-ray spectral fitting software '
  pkgver=12.9.1
  depends=('heasoft-base')

  cd $srcdir/$pkgbase-${_mainver}/BUILD_DIR
  ./configure --prefix=$pkgdir/opt/$pkgbase-${_mainver} 
  make "HD_SELECTED=Xspec" install

  _clean_conflict

}

package_ftools(){

  _crntpkg='ftools'
  pkgdesc='A General Package of Software to Manipulate FITS Files'
  pkgver=6.21
  depends=('heasoft-base')

  cd $srcdir/$pkgbase-${_mainver}/BUILD_DIR
  ./configure --prefix=$pkgdir/opt/$pkgbase-${_mainver} 
  make "HD_SELECTED=ftools" install

  _clean_conflict

}

