#Maintainer James W. Barnett < jbarnet 4 at tulane dot edu >
pkgname=gromacs-mpi
_pkgname=gromacs
pkgver=2016
pkgrel=7
pkgdesc='molecular dynamics simulation suite'
url='http://www.gromacs.org/'
license=("LGPL2")
arch=('any')
depends=('fftw' 'openmpi')
makedepends=('cmake>=2.8.8')
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

  # Bash completions go in /usr/share/bash-completion/completions
  sed -i -e "s:\$GMXBIN/gmx-completion.bash:/usr/share/bash-completion/completions/gmx-completion.bash:g" \
         -e "s:\$GMXBIN/gmx-completion-\*.bash:/usr/share/bash-completion/completions/gmx-completion-\*.bash:g" \
            ${pkgdir}/usr/bin/GMXRC.bash
  install -d ${pkgdir}/usr/share/bash-completion/completions
  install -m755 ${pkgdir}/usr/bin/gmx-completion* ${pkgdir}/usr/share/bash-completion/completions/
  rm -f ${pkgdir}/usr/bin/gmx-completion*

  # Environmental variables, etc are set in /etc/profile.d (must be suffixed
  # with .sh to be automatically sourced)
  install -d ${pkgdir}/etc/profile.d
  install -m755 ${pkgdir}/usr/bin/GMXRC.bash ${pkgdir}/etc/profile.d/GMXRC.sh
  install -m755 ${pkgdir}/usr/bin/GMXRC.csh ${pkgdir}/etc/profile.d/GMXRC.csh
  rm -f ${pkgdir}/usr/bin/GMXRC*

  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/COPYING "$pkgdir"/usr/share/licenses/gromacs/LICENSE
}

