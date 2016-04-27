#Maintainer James W. Barnett < jbarnet 4 at tulane dot edu >
pkgname=gromacs-mpi
_pkgname=gromacs
pkgver=5.1.2
pkgrel=1
pkgdesc='A versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of
motion for systems with hundreds to millions of particles.'
url='http://www.gromacs.org/'
license=("LGPL")
arch=('i686' 'x86_64')
depends=('fftw' 'openmpi')
makedepends=('cmake')
optdepends=('lapack: normal modes and matrix manipulation'
            'boost-libs: better implementation support for smart pointers and exception handling'
            'libxml2: required for running test suite'
            'libx11: needed for gmx view'
            'lesstif: needed for gmx view'
            'vmd: visualization')
options=('!libtool')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-${pkgver}.tar.gz)
md5sums=('614d0be372f1a6f1f36382b7a6fcab98')

build() {
  mkdir -p ${srcdir}/${_pkgname}-${pkgver}/build
  cd ${srcdir}/${_pkgname}-${pkgver}/build
  cmake .. \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DCMAKE_INSTALL_LIBDIR=lib \
         -DREGRESSIONTEST_DOWNLOAD=ON \
         -DGMX_MPI=ON
  make
}

check() {
  cd ${srcdir}/${_pkgname}-${pkgver}/build
  make check
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/build

  make DESTDIR=${pkgdir} install

  sed -i "s:/usr/bin:/etc/profile.d:" ${pkgdir}/usr/bin/GMXRC
  sed -i -e "s:\$GMXBIN/gmx-completion.bash:/usr/share/bash-completion/completions/gmx-completion.bash:g" \
         -e "s:\$GMXBIN/gmx-completion-\*.bash:/usr/share/bash-completion/completions/gmx-completion-\*.bash:g" \
            ${pkgdir}/usr/bin/GMXRC.bash
  install -d ${pkgdir}/etc/profile.d/
  install -Dm 755 ${pkgdir}/usr/bin/GMXRC* ${pkgdir}/etc/profile.d/
  rm -f ${pkgdir}/usr/bin/GMXRC*

  install -d ${pkgdir}/usr/share/bash-completion/completions
  install -Dm 755 ${pkgdir}/usr/bin/gmx-completion.* ${pkgdir}/usr/share/bash-completion/completions/
  rm -f ${pkgdir}/usr/bin/completion.*

}

