# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=plumed-mpi
pkgver=2.5.2
pkgrel=1
pkgdesc="An open source plugin for free energy calculations in molecular systems which works together with some of the most popular molecular dynamics engines (with MPI support)"
url="http://www.plumed.org/"
license=("GPL")
arch=(i686 x86_64)
depends=('lapack' 'zlib' 'gsl' 'openmpi' 'netcdf')
optdepends=('vmd-molfile-plugins: add capability to read vmd compatible trajectories'
            'xdrfile: GROMACS trajectory format support'
            'python-setuptools: Python module support'
            'cython: Python module support'
            'graphviz: diagrams in manual')
makedepends=('vim')
source=( https://github.com/plumed/plumed2/releases/download/v${pkgver}/plumed-${pkgver}.tgz)
sha1sums=('5f0944c126e00e27601aca841a94dd397fd33dc6')

# Extend support for trajectory analysis to formats understood by vmd (thx hseara!)
if [ -d "/usr/lib/vmd-molfile-plugins" ]; then
  msg2 "Adding vmd-molfile plugin support"
  LDFLAGS+=" -L/usr/lib/vmd-molfile-plugins -lnetcdf"
  CPPFLAGS+=" -I/usr/include/vmd-molfile-plugins"
fi

build() {
  cd ${srcdir}/${pkgname%-mpi}-${pkgver}
  ./configure --prefix=/usr --enable-mpi --program-suffix=-mpi
  make
}


package() {
  cd ${srcdir}/${pkgname%-mpi}-${pkgver}
  make DESTDIR=${pkgdir} install
}
