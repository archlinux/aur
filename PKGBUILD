# PKGBUILD template to install Espresso 
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=plumed
pkgver=2.5.3
pkgrel=1
pkgdesc="An open source plugin for free energy calculations in molecular systems which works together with some of the most popular molecular dynamics engines."
url="http://www.plumed.org/"
license=("GPL")
arch=("x86_64")
depends=('lapack' 'zlib' 'gsl' 'netcdf' 'gcc8')
optdepends=('vmd-molfile-plugins: Add capability to read vmd compatible trajectories')
makedepends=('vim')
provides=('plumed')
#install=$pkgname.install
source=( https://github.com/plumed/plumed2/releases/download/v${pkgver}/plumed-${pkgver}.tgz)
sha256sums=('e59fb5d7c4ee9a21cd0a82c361bbab472cddf07475db8e70ed83549ba7e41331')
#options=(!buildflags)

#Using gcc8 as compiler due to linking problems with gromacs-plumed
export CC=gcc-8
export CXX=g++-8

# Extend support for trajectory analysis to formats undestood by vmd
if [ -d "/usr/lib/vmd-molfile-plugins" ]; then
  msg2 "Adding vmd-molfile plugin support"
  LDFLAGS+=" -L/usr/lib/vmd-molfile-plugins -lnetcdf"
  CPPFLAGS+=" -I/usr/include/vmd-molfile-plugins"
fi

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-mpi
  make
}


package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

### Please Remember to set the following environment variable ###
# PLUMED_KERNEL=/usr/lib/libplumedKernel.so"
