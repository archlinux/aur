# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=ncl
pkgver=6.3.0
pkgrel=1
pkgdesc="Ncar Command Language, is an interpreted language designed specifically for scientific data analysis and visualization"
url="http://www.ncl.ucar.edu"
license=('custom:NCL Source Code License')
arch=('i686' 'x86_64')
depends=('libxext' 'cairo' 'pixman' 'fontconfig' 'expat' 'bzip2' 'zlib' 'netcdf' 'hdf5' 'triangle' 'hdf-eos-common' 'hdf-eos2' 'hdf-eos5' 'hdf4-nonetcdf' 'netcdf-fortran' 'libx11' 'imake' 'g2clib' 'gdal' 'openmotif' 'glibc' 'libjpeg' 'libpng' 'jasper' 'udunits' 'libxaw' 'tcsh' 'flex')
makedepends=('gcc' 'gcc-fortran' 'unzip' 'tcsh')
provides=('ncl')
install=${pkgname}.install
source=("ncl_ncarg-6.3.0.tar.gz::https://www.earthsystemgrid.org/download/fileDownload.htm?logicalFileId=bec58cb3-cd9b-11e4-bb80-00c0f03d5b7c" 'http://www.netlib.org/voronoi/triangle.zip' 'ncl.patch' 'includes.patch' 'ncl-libs.patch' 'Site.local' 'ncarg.sh' 'hluresfile' 'ncl.install')
optdepends=("ncl-highres: High-resolution coastlines (RANGS and GSHHS)")
md5sums=('4834df63d3b56778441246303ab921c4'
         '10aff8d7950f5e0e2fb6dd2e340be2c9'
         'b779f6a9cbd6f9f2494f9cd9d553bfc5'
         'a996694fec633798787cb3f288022125'
         '2dc539dc3133339aed425aa03f87f103'
         'b823840cdab9e6a0500d5ed8e0d4f5ba'
         '33fd270a3ea1b4beb770b3e89ada4f59'
         '7a2ef22854fa4c3308ee7369f04d89bb'
         '913322ce7d4ca5efed7674693e8a3124')
         
build() {
  #copy triangle library
  cd $srcdir
  cp triangle.c triangle.h ${pkgname}_ncarg-$pkgver/ni/src/lib/hlu/

  cd $srcdir/${pkgname}_ncarg-$pkgver
  
  #patch compile and install
  
  patch -Np1 --ignore-whitespace -i ../../ncl.patch
  patch -Np1 --ignore-whitespace -i ../../includes.patch
  patch -Np1 --ignore-whitespace -i ../../ncl-libs.patch
  
  export F77="gfortran"
  export F77_LD="gfortran"
  export CCompiler="gcc"
  export FCompiler="gfortran"
  export CtoFLibraries="-lgfortran"
  export CTOFLIBS="-lgfortran -fPIC -fno-second-underscore -fno-range-check -fno-strict-aliasing -fopenmp"
  export FcOptions="-fPIC -fno-second-underscore -fno-range-check -fopenmp"
  
  #configure
  #./Configure -ncar || return 1
  cp $srcdir/Site.local config/
  sed -i "s|YmakeRoot /usr|YmakeRoot ${pkgdir}/usr|g" config/Site.local
  ./config/ymkmf
  
  #build
  make  Build # >> log 2>&1 
}

package() {
  #install
  cd $srcdir/${pkgname}_ncarg-$pkgver
  make  install   # >> log 2>&1

  #fontcaps, and graphcaps
  cd $srcdir/${pkgname}_ncarg-$pkgver/common/src/fontcap
  make
  make install
  
  cd $srcdir/${pkgname}_ncarg-$pkgver/common/src/graphcap
  make
  make install

  # Use system udunits
  rm -rf ${pkgdir}/usr/lib/ncarg/udunits
  ln -s /usr/share/udunits ${pkgdir}/usr/lib/ncarg/

  #set variable ncarg in system
  install -dv ${pkgdir}/etc/profile.d
  install --mode=755 $srcdir/ncarg.sh --target-directory=${pkgdir}/etc/profile.d/  

  #copy hluresfile
  install --mode=644 $srcdir/hluresfile --target-directory=${pkgdir}/usr/lib/ncarg/

  #compress and put in order man files
  cd $pkgdir/usr/man
  for listman in `ls` 
  do
    mkdir -p $pkgdir/usr/share/man/$listman
    cd $pkgdir/usr/man/$listman
    for manfiles in `ls`
    do
      gzip $manfiles
      mv ${manfiles}.gz $pkgdir/usr/share/man/$listman/
    done
  done
  rm -Rf $pkgdir/usr/man/
}
