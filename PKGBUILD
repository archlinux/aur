# Maintainer: Samuel Balula <sbalula@ethz.ch>
# Contributor: Maik93 <michael.mugnai@gmail.com>

# Instructions / Troubleshoot
# Download the source from https://www.hsl.rl.ac.uk/ipopt/ and place it in the folder, alongside this PKGBUILD.
# Check package version and sha256sum of the downloaded tarball, it may be different from the one listed here.
# If so either use "SKIP" or replace with your tarball sha256sum.

pkgname=coin-or-hsl
_pkgname=coinhsl
pkgrel=1
pkgver=2021.05.05
pkgdesc="HSL Mathematical Software Library. Including solvers for sparse linear systems of equations and sparse eigenvalue problems. Compiled with coin-or-tools, supports Ipopt."
arch=('i686' 'x86_64')
url="http://www.hsl.rl.ac.uk/"
makedepends=('gcc' 'metis' 'gcc-fortran')
depends=('openblas-lapack' 'openmp')
optdepends=('coin-or-ipopt')
source=("ThirdParty-HSL::git+https://github.com/coin-or-tools/ThirdParty-HSL.git"
		"manual://${_pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP'
            'f77ad752a37de8695c02c81bcc503674af76689d40a9864b6f2a7a790c3efc95')

build() {
  cd $srcdir/ThirdParty-HSL
  ln -sf ../${_pkgname}-${pkgver} coinhsl
  OMP_NUM_THREADS=$(nproc) ./configure --prefix=/usr LIBS="-llapack" --with-blas="-L/usr/lib -lopenblas" CXXFLAGS="-O3 -fopenmp" FCFLAGS="-O3 -fopenmp" CFLAGS="-O3 -fopenmp"
  make DESTDIR=$pkgdir
}

package () {
  cd $srcdir/ThirdParty-HSL
  make DESTDIR=$pkgdir install

  # For Ipopt:
  ln -rs $pkgdir/usr/lib/libcoinhsl.so $pkgdir/usr/lib/libhsl.so
}
