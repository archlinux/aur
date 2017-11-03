# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=heasoft
pkgver=6.22.1
pkgrel=1
pkgdesc="NASA high energy astrophysics library"
makedepends=("gcc" "glibc" "gcc-fortran" "perl")
depends=("ncurses" "readline" "libxpm" )
url="https://heasarc.gsfc.nasa.gov/docs/software/lheasoft/"
arch=('x86_64')
license=('NASA' 'GPL')
source=(http://heasarc.gsfc.nasa.gov/FTP/software/lheasoft/release/${pkgname}-${pkgver}src_no_xspec_modeldata.tar.gz)
#source=(heasoft-6.22.1src_no_xspec_modeldata.tar.gz)
sha256sums=('86d5b0be442f4eb80cf60f2160a87527e615bb019d1dabdc102d9864b6ec8b96')


build() {

  export CC=/usr/bin/gcc
  export CXX=/usr/bin/g++
  export FC=/usr/bin/gfortran
  export PERL=/usr/bin/perl

  cd $srcdir/${pkgname}-${pkgver}/BUILD_DIR
  ./configure --prefix=${pkgdir}/opt/${pkgname}-${pkgver}
  
  make 

}

package(){

  cd $srcdir/${pkgname}-${pkgver}/BUILD_DIR
  make install

  _glibcver=$(pacman -Q glibc | cut -c7-10)

  mkdir -p $pkgdir/opt/${pkgname}-${pkgver}/x86_64-unknown-linux-gnu-libc${_glibcver}/bin/

  echo
  echo "***********************************************************************"
  echo

   printf "\n\nAdd following lines to your ~/.bashrc to initialize the software\n\n   export HEADAS=/opt/%s-%s/x86_64-unknown-linux-gnu-libc%s\n   alias heainit='source \$HEADAS/headas-init.sh\n\nThen load heasoft by the command:\n\n   >heainit\n\n" ${pkgname} ${pkgver} ${_glibcver}

  echo "Install complete..."
  echo
  echo "***********************************************************************"
  echo
 
}

