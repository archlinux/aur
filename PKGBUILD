# PKGBUILD template to install Espresso 
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=plumed
pkgver=2.8.1
pkgrel=1
pkgdesc="An open source plugin for free energy calculations in molecular systems which works together with some of the most popular molecular dynamics engines."
url="http://www.plumed.org/"
license=("GPL")
arch=("x86_64")
depends=('lapack' 'zlib' 'gsl' 'netcdf')
optdepends=('vmd-molfile-plugins: Add capability to read vmd compatible trajectories')
makedepends=('vim')
provides=('plumed')
#install=$pkgname.install
source=( https://github.com/plumed/plumed2/releases/download/v${pkgver}/plumed-${pkgver}.tgz)
sha256sums=('95f6cbc9134d3ad05ad4652e5e6f12dfbd6313a95a47d7ca6c8bfca147ecd7d5')
#options=(!buildflags)

#Using gcc9 as compiler due to linking problems with cuda
#export CC=gcc-9
#export CXX=g++-9

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
