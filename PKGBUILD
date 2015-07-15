# Mantainer: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-4.6-complete
pkgver=4.6.7
pkgrel=3
pkgdesc='GROMACS is a versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles.'
url='http://www.gromacs.org/'
license=("GPL")
arch=('i686' 'x86_64')
depends=('fftw' 'lesstif' 'perl' 'libxml2' 'libsm' 'libx11' 'doxygen')
options=('!libtool')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-${pkgver}.tar.gz
        GMXRC.bash.cmakein.patch)
sha1sums=('923ed238963027201c329ff34dbef414fe68f4e9'
          '014b2cbfa13db9b495c88f653805c330747117dc')


export VMDDIR=/usr/lib/vmd/ #If vmd is available at compilation time
                            #Gromacs will have the ability to read any
                            #trajectory file format that can be read by
                            #VMD installation (e.g. AMBER's DCD format). 

prepare() {
cd ${srcdir}/gromacs-${pkgver}/scripts/
ls
patch -p0 -i ${srcdir}/GMXRC.bash.cmakein.patch
}

build() {
  
  mkdir -p ${srcdir}/{single,double}

  msg2 "Building the single precision files"
  cd ${srcdir}/single
  cmake ../gromacs-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs/gromacs-${pkgver} \
    -DBUILD_SHARED_LIBS=ON \
    -DGMX_DEFAULT_SUFFIX=ON \
    -DREGRESSIONTEST_DOWNLOAD=ON \
    -DGMX_OPENMP=ON
  make

  msg2 "Building the double precision files"
  cd ${srcdir}/double
  cmake ../gromacs-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs/gromacs-${pkgver} \
    -DBUILD_SHARED_LIBS=ON \
    -DGMX_DEFAULT_SUFFIX=ON \
    -DREGRESSIONTEST_DOWNLOAD=ON \
    -DGMX_DOUBLE=ON \
    -DGMX_OPENMP=ON
  make
}

check () {
  cd ${srcdir}/single
  make test
  cd ${srcdir}/double
  make test
}

package() {
  msg2 "Making the single precision executables"
  cd ${srcdir}/single 
  make DESTDIR=${pkgdir} install

  msg2 "Making the double precision executables"
  cd ${srcdir}/double
  make DESTDIR=${pkgdir} install

  msg2 "Installing Sources"
  cp -r ${srcdir}/gromacs-${pkgver}/src  ${pkgdir}/usr/local/gromacs/gromacs-${pkgver}/
  cd ${pkgdir}/usr/local/gromacs/gromacs-${pkgver}/src 
  find . -type f -exec chmod 0644 {} \;
  find . -type d -exec chmod 0755 {} \;
}

