# Maintainer: Wu Junyu (aka Tenshi65535) <wu.junyu.aur@outlook.com>
# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=plumed-mpi
pkgver=2.8.2
pkgrel=1
pkgdesc="An open source plugin for free energy calculations in molecular systems which works together with some of the most popular molecular dynamics engines (with MPI support)"
url="http://www.plumed.org/"
license=(GPL)
arch=(i686 x86_64)
depends=(lapack zlib gsl openmpi netcdf)
optdepends=('vmd-molfile-plugins: add capability to read vmd compatible trajectories'
            'xdrfile: GROMACS trajectory format support'
            'python-setuptools: Python module support'
            'cython: Python module support'
            'graphviz: diagrams in manual'
            'gawk: partial tempering support')
makedepends=(vim)
source=(https://github.com/plumed/plumed2/releases/download/v${pkgver}/plumed-${pkgver}.tgz)
sha256sums=('93a2779ce0abfcf6c29ed7db95a062912603e05bc46c56f5785f7eaf6a1bea23')

prepare() {
  # Extend support for trajectory analysis to formats understood by vmd (thx hseara!)
  if [ -d "/usr/lib/vmd-molfile-plugins" ]; then
    msg2 "Adding vmd-molfile plugin support"
    export LDFLAGS="$LDFLAGS -L/usr/lib/vmd-molfile-plugins -lnetcdf"
    export CPPFLAGS="$CPPFLAGS -I/usr/include/vmd-molfile-plugins"
  fi
}

build() {
  cd ${srcdir}/${pkgname%-mpi}-${pkgver}
  ./configure CC=mpicc CXX=mpic++ --prefix=/usr --enable-mpi --enable-asmjit --enable-modules=all --program-suffix=-mpi
  make
}

package() {
  cd ${srcdir}/${pkgname%-mpi}-${pkgver}
  make DESTDIR=${pkgdir} install
}
