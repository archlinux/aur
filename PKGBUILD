# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=plumed-mpi
pkgver=2.5.0
pkgrel=2
pkgdesc="An open source plugin for free energy calculations in molecular systems which works together with some of the most popular molecular dynamics engines (with MPI support)"
url="http://www.plumed-code.org/"
license=("GPL")
arch=(i686 x86_64)
depends=('lapack' 'zlib' 'gsl' 'openmpi')
optdepends=('vmd-molfile-plugins: Add capability to read vmd compatible trajectories')
makedepends=('vim')
provides=('plumed')
source=( https://github.com/plumed/plumed2/releases/download/v${pkgver}/plumed-${pkgver}.tgz)
sha1sums=('0b93fcd39a4e5b1b81e24657438e3831faa53753')

# Extend support for trajectory analysis to formats undestood by vmd
if [ -d "/usr/lib/vmd-molfile-plugins" ]; then
  msg2 "Adding vmd-molfile plugin support"
  LDFLAGS+=" -L/usr/lib/vmd-molfile-plugins -lnetcdf"
  CPPFLAGS+=" -I/usr/include/vmd-molfile-plugins"
fi

build() {
  cd ${srcdir}/${pkgname%-mpi}-${pkgver}
  ./configure --prefix=/opt/${pkgname} --enable-mpi
  make
}


package() {
  cd ${srcdir}/${pkgname%-mpi}-${pkgver}
  make DESTDIR=${pkgdir} install
}
