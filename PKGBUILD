# Maintainer: physkets <physkets // at // tutanota dot com>
# Contributor: Wes Barnett <wes AT w barnett DOT us>
_pkgname=lammps
pkgname=${_pkgname}-git
pkgver=r13672.f7cbdcf99
pkgrel=1
pkgdesc="Large-scale Atomic/Molecular Massively Parallel Simulator."
url='http://lammps.sandia.gov/'
license=("GPL2")
arch=('any')
depends=('openmpi')
makedepends=('cmake>=3.1')
conflicts=('lammps')
provides=('lammps')
optdepends=(
  'cuda: Nvidia GPU support' 
  'fftw: fast Fourier transform'
  'vmd: visualization and molfile support'
  'kim-api: support for OpenKIM potentials'
)
source=('git://github.com/lammps/lammps.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname}
  mkdir -p build
}

build() {
  cd ${_pkgname}/build
  cmake ../cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_INSTALL_LIBEXECDIR="/usr/lib" #\
    #-DPKG_KIM=yes # KIM package
  # Add packages here by using -DPKG_<NAME>=ON
  # See manual for list of packages
  # See https://github.com/lammps/lammps/blob/master/cmake/README.md
  make
}

package() {
  cd ${_pkgname}/build
  make DESTDIR=${pkgdir} install
}
