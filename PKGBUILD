#Maintainer James W. Barnett < jbarnet 4 at tulane dot edu >
pkgname=gromacs-mpi
_pkgname=gromacs
pkgver=2016
pkgrel=5
pkgdesc='A versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of
motion for systems with hundreds to millions of particles.'
url='http://www.gromacs.org/'
license=("LGPL")
arch=('i686' 'x86_64')
depends=('fftw' 'openmpi')
makedepends=('cmake')
conflicts=('gromacs')
optdepends=(
  'lapack: normal modes and matrix manipulation'
  'boost-libs: better implementation support for smart pointers and exception handling'
  'cuda: Nvidia GPU support' 
  'hwloc: improved run-time detection of hardware capabilities'
  'lesstif: needed for gmx view'
  'libx11: needed for gmx view'
  'libxml2: required for running test suite'
  'opencl-nvidia: OpenCL support for Nvidia GPU'
  'opencl-mesa: OpenCL support for AMD GPU'
  'pymol: visualization'
  'vmd: visualization'
)
options=('!libtool')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-${pkgver}.tar.gz)
md5sums=('302a87450cd8ba3eb2c2c29cd6232bf1')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DREGRESSIONTEST_DOWNLOAD=ON \
    -DGMX_MPI=ON \
    -DGMX_DEFAULT_SUFFIX=OFF \
    -DCMAKE_BUILD_TYPE=Release
  make
}

check() {
  cd build
  make check
}

package() {
  cd build
  make DESTDIR=${pkgdir} install

  # The following puts the bash completions in /etc/profile.d, so they are sourced automatically on user login
  sed -i "s:/usr/bin:/etc/profile.d:" ${pkgdir}/usr/bin/GMXRC
  sed -i -e "s:\$GMXBIN/gmx-completion.bash:/usr/share/bash-completion/completions/gmx-completion.bash:g" \
         -e "s:\$GMXBIN/gmx-completion-\*.bash:/usr/share/bash-completion/completions/gmx-completion-\*.bash:g" \
            ${pkgdir}/usr/bin/GMXRC.bash
  install -d ${pkgdir}/etc/profile.d/
  install -Dm 755 ${pkgdir}/usr/bin/GMXRC* ${pkgdir}/etc/profile.d/
  install -Dm 755 ${pkgdir}/usr/bin/GMXRC.bash ${pkgdir}/etc/profile.d/GMXRC.sh
  rm -f ${pkgdir}/usr/bin/GMXRC*
  install -d ${pkgdir}/usr/share/bash-completion/completions
  install -Dm 755 ${pkgdir}/usr/bin/gmx-completion* ${pkgdir}/usr/share/bash-completion/completions/
  rm -f ${pkgdir}/usr/bin/gmx-completion*
}

