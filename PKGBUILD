# Maintainer: Samuel Balula <sbalula@ethz.ch>
# Contributor: Maik93 <michael.mugnai@gmail.com>

# Instructions / Troubleshoot
# Download the source from https://www.hsl.rl.ac.uk/ipopt/ and place it in the folder, alongside this PKGBUILD.
# Check package version and sha256sum of the downloaded tarball, it may be different from the one listed here.
# If so either use "SKIP" or replace with your tarball sha256sum.

pkgname=coin-or-hsl
_pkgname=coinhsl
pkgrel=1
pkgver=2023.05.26
pkgdesc="HSL Mathematical Software Library. Including solvers for sparse linear systems of equations and sparse eigenvalue problems. Compiled with coin-or-tools, supports Ipopt."
arch=('i686' 'x86_64')
url="http://www.hsl.rl.ac.uk/"
makedepends=('gcc' 'metis' 'gcc-fortran')
depends=('blas-openblas' 'openmp')
optdepends=('coin-or-ipopt')
source=("ThirdParty-HSL::git+https://github.com/coin-or-tools/ThirdParty-HSL.git"
		"manual://${_pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP'
            'e39faf1edb5ce83ff80e443f6d7ebb322fa6abfc5286cb54d6a6030c4a826306')

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
