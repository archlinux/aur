# Maintainer: Wes Barnett <wes AT w barnett DOT us>
pkgname=lammps-git
_pkgname=lammps
pkgver=r13609.f2c117274
pkgrel=1
pkgdesc='versatile package to perform molecular dynamics'
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
)
source=('git://github.com/lammps/lammps.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  cd "$srcdir/${_pkgname}"
  # Fix to cmake file (won't build without patch)
  git apply <(curl -L https://github.com/lammps/lammps/pull/660.patch)
}

build() {
  cd build
  # Add packages here by using -DENABLE_PACKAGE_NAME=ON
  # See manual for list of packages
  # See https://github.com/lammps/lammps/blob/master/cmake/README.md
  cmake ../${_pkgname}/cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_MPI=ON
  make
}

package() {
  cd build
  make DESTDIR=${pkgdir} install
}
