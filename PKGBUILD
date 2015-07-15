# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-4.5-complete
pkgver=4.5.7
pkgrel=1
pkgdesc='A versatile package to perform molecular dynamics. Last stable release of 4.5.x version series. Single and Double precision; Sources; Doxygen documentation'
url='http://www.gromacs.org/'
license=("GPL")
arch=('i686' 'x86_64')
depends=('fftw' 'lesstif' 'perl' 'libxml2' 'libsm' 'libx11' 'doxygen')
options=('!libtool')
makedepends=('cmake')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-$pkgver.tar.gz)
md5sums=('24febafaf51be785b1c755ef679bea08')
sha1sums=('f2fb59bcfb45043d8dd72122629fc23d7e2b800f')

build() {
  mkdir -p ${srcdir}/{single,double}

  msg2 "Building the single precision files"
  cd ${srcdir}/single
  cmake ../gromacs-$pkgver \
    -DCMAKE_PREFIX=/usr/local/gromacs/gromacs-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs/gromacs-$pkgver \
    -DGMX_SHARED_LIBS=ON
  make

  msg2 "Building the doulbe precision files"
  cd ${srcdir}/double
  cmake ../gromacs-$pkgver \
    -DCMAKE_PREFIX=/usr/local/gromacs/gromacs-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs/gromacs-$pkgver \
    -DGMX_SHARED_LIBS=ON \
    -DGMX_DOUBLE=ON
  make

  msg2 "Building doxygen documentation"
  cd ../gromacs-$pkgver
  ./configure
  doxygen
}

package() {
  msg2 "Making the single precision executables"
  cd ${srcdir}/single 
  make DESTDIR=${pkgdir} install

  msg2 "Making the double precision executables"
  cd ${srcdir}/double
  make DESTDIR=${pkgdir} install

  msg2 "Installing doxygen documentation"
  cd ${srcdir}/gromacs-$pkgver
  cp -r doxygen-doc $pkgdir/usr/local/gromacs/gromacs-$pkgver

  msg2 "Installing Sources"
  cd ${srcdir}/gromacs-$pkgver 
  cp -r src  $pkgdir/usr/local/gromacs/gromacs-$pkgver
  chown -R 644 $pkgdir/usr/local/gromacs/gromacs-$pkgver/src
}
