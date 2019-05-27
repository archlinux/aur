# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=libcmatrix
pkgver=3.11.0
pkgrel=3
pkgdesc="A library designed for numerical studies of problems in NMR"
arch=('x86_64')
url="https://www.dur.ac.uk/paul.hodgkinson/pNMRsim"
license=('GPL')
depends=('openmpi')
makedepends=('gcc' 'sed')
source=($url/libcmatrixR3_lite.tar.gz
        $pkgname-3.11.0-gcc5.2.patch
        $pkgname-3.11.0-shared.patch
        $pkgname-3.2.1-gcc4.7.patch
        $pkgname-3.9.0-atlas.patch)
sha256sums=('0cd4b1f921235ea64d7fbd8d814fbe639bf9ddb23e4a6d3182cf2788cc23f8b8'
            '58a1278a8f1323bd201979cdce8ecdc390ce8825f58a1d143264455d5bc0f80c'
            'e52c2adb42f5a2836db1e71e4ae2f3235e58bc5c92b04594069548201fd821cf'
            'bc4eec9967be3d9ad520d1750abb23f5b6732b8352c7ad61f54c78fb7c9d6312'
            'fc4463ff41d3a691b351f4891bcd2fb3177ce3c04f0f4d2f3d398e5b64c26b0a')

prepare() {
  mv $srcdir/libcmatrixR3 $srcdir/$pkgname-$pkgver
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < ../$pkgname-3.11.0-shared.patch
  patch -p1 < ../$pkgname-3.2.1-gcc4.7.patch
  patch -p1 < ../$pkgname-3.9.0-atlas.patch
  patch -p1 < ../$pkgname-3.11.0-gcc5.2.patch
  
  sed -i -e '/Warnings.h/a\' -e '#include <cstdio>' include/DynamicList.h
  sed -i 's#0x80000000#(int)0x80000000#g' include/lcm_ssecomplex.h
  sed -i 's#mutable space#space#' NMR/MetaPropagation.cc
  sed -i 's#-lMinuit#-lMinuit2#g' configure
  sed -i 's#Minuit,main#Minuit2,main#g' configure-libraries.ac
  sed -i 's#libMinuit#libMinuit2#g' configure-libraries.ac
}

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr \
              --includedir=/usr/include/libcmatrix \
              --without-atlas \
              --with-mpi \
              CXX=mpic++
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d -m 755 $pkgdir/usr/{include/libcmatrix,lib}
  install -m755 include/*.h $pkgdir/usr/include/libcmatrix
  install -m755 lib/libcmatrix.so.$pkgver $pkgdir/usr/lib
  cd $pkgdir/usr/lib
  ln -sf libcmatrix.so.$pkgver libcmatrix.so.3
  ln -sf libcmatrix.so.3 libcmatrix.so
}
