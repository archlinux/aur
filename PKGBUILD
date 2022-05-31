# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=freefem-git
pkgver=4.11.r20220405
epoch=2
pkgrel=1
pkgdesc='A PDE oriented language using the finite element method from git'
arch=('x86_64')
url="https://freefem.org/index.html"
license=('LGPL')
depends=('fftw' 'freeglut' 'glu' 'suitesparse' 'hdf5' 'gsl' 'openmpi' 'lapack' 'arpack' 'parmetis' 'cblas' 'openblas' 'mumps')
makedepends=('git' 'texlive-core' 'gcc-fortran' 'unzip' 'openmpi' 'gsl')
provides=('freefem' 'freefem++')
conflicts=('freefem' 'freefem++')
source=('FreeFem::git+https://github.com/FreeFem/FreeFem-sources.git')
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd FreeFem
  printf "%s.r%s" $(grep AC_INIT configure.ac| cut -d, -f2|tr - .|tr -d [|tr -d ]) $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}

prepare() {
  cd FreeFem
  autoreconf -fi 
  ./configure CXXFLAGS=" --std=c++11" \
	      --prefix=/usr \
	      --sysconfdir=/etc \
	      --disable-download \
	      --disable-superlu \
	      --enable-optim \
	      --with-petsc_complex=/opt/petsc/linux-c-opt/lib/petsc/conf/petscvariables \
	      --with-petsc_complex=/opt/petsc/linux-c-opt/lib/petsc/conf/petscvariables
}

build() {
  cd FreeFem
  make 
}

check() {
  cd FreeFem
  make check || true
}

package() {
  cd FreeFem
  make -d DESTDIR="$pkgdir" install||true
  find "$pkgdir"/usr/lib/ff++/ -name "*.h" -exec chmod o+r {} \;
  # remove unneeded files
  rm -f "$pkgdir"/usr/share/freefem++/${_pkgver}/INSTALL*
  rm -f "$pkgdir"/usr/share/freefem++/${_pkgver}/README_*
  rm -f "$pkgdir"/usr/share/freefem++/${_pkgver}/mode-mi-edp.zip
  rm -rf "$pkgdir"/usr/share/freefem++/${_pkgver}/download
}
