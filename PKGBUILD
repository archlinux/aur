# Maintainer: Scott Tincman <sctincman at gmail dot com>

pkgname=nwchem
pkgver=6.8.1
pkgrel=1
pkgdesc="Ab initio computational chemistry software package"
arch=('x86_64')
url="http://www.nwchem-sw.org/index.php/Main_Page"
license=('ECL')
depends=('gcc-fortran' 'openmpi' 'python2' 'blas' 'lapack' 'scalapack')
makedepends=()
optdepends=()
install=nwchem.install
source=("https://github.com/nwchemgit/$pkgname/archive/$pkgver-release.tar.gz"
        "config.sh"
        "nwchemrc")
sha256sums=('ea3cf029d578729fe61041dcb63fa8d5a2d012b662c4f026d1fa22ef10401bf5'
            '7f3d791d31fc0bb734bb18d27773f317e6dc96a4ca8e4c7d026b09951f46e379'
            'd63fdfc44a8f44419748e029d031c91716635ac4f062cd835014cde04677b90f')

prepare(){
  mv $srcdir/$pkgname-$pkgver* $srcdir/$pkgname-$pkgver
  
  # Fix CUDA
  sed -i 's/$(CUDA_FLAGS)/$(CUDA_FLAGS) --compiler-options -fPIC/g' $srcdir/$pkgname-$pkgver/src/config/makefile.h
}

build() {
  cd $srcdir/$pkgname-$pkgver
  source $srcdir/config.sh
  cd src
  make nwchem_config
  make 64_to_32
  make
  ../contrib/getmem.nwchem
}

package() {
  cd $srcdir/$pkgname-$pkgver
  export TARGET=LINUX64
  install -d -m 755 $pkgdir/usr/bin
  install -d -m 755 $pkgdir/usr/share/$pkgname/
  install -d -m 755 $pkgdir/etc/skel/
  install -d -m 755 $pkgdir/usr/share/licenses/$pkgname
  install -d -m 755 $pkgdir/usr/share/$pkgname/libraryps
  install -m 755 $srcdir/$pkgname-$pkgver/bin/${TARGET}/$pkgname $pkgdir/usr/bin/
  cp -r $srcdir/$pkgname-$pkgver/src/basis/libraries $pkgdir/usr/share/$pkgname/
  cp -r $srcdir/$pkgname-$pkgver/src/data $pkgdir/usr/share/$pkgname/
  cp -r $srcdir/$pkgname-$pkgver/src/nwpw/libraryps/{development_psps,HGH_LDA,library1,library2,ofpw_default,paw_default,pspw_default,pspw_new,pspw_old,Spin_Orbit,TETER,TM} $pkgdir/usr/share/$pkgname/libraryps
  chmod -R go=rX $pkgdir/usr/share/$pkgname/
  chmod -R u=wrX $pkgdir/usr/share/$pkgname/
  install -m 644 $srcdir/nwchemrc $pkgdir/etc/skel/.nwchemrc
  install -m 0644 $srcdir/$pkgname-$pkgver/LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/
}
