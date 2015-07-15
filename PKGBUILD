#Maintainer James W. Barnett < jbarnet 4 at tulane dot edu >
pkgname=gromacs-mpi
_pkgname=gromacs
pkgver=5.0.5
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
source=(https://kth.box.com/shared/static/eze1d9smwgwgnox4k71xjl9ga1ua43d1.gz)
md5sums=('206884042be656dc06fb73847a9af97f')

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
  mkdir -p ${pkgdir}/etc/profile.d/
  mkdir -p ${pkgdir}/usr/share/bash-completion/completions
  mv ${pkgdir}/usr/bin/gmx-completion.bash "${pkgdir}/usr/share/bash-completion/completions/gmx-completion.bash"
  mv ${pkgdir}/usr/bin/gmx-completion-gmx.bash "${pkgdir}/usr/share/bash-completion/completions/gmx-completion-gmx.bash"
  sed -e "s:\$GMXBIN/gmx-completion.bash:/usr/share/bash-completion/completions/gmx-completion.bash:g" \
      -e "s:\$GMXBIN/gmx-completion-\*.bash:/usr/share/bash-completion/completions/gmx-completion-\*.bash:g" \
        ${pkgdir}/usr/bin/GMXRC.bash > ${pkgdir}/etc/profile.d/GMXRC.bash
  chmod 755 ${pkgdir}/etc/profile.d/GMXRC.bash
  rm -f ${pkgdir}/usr/bin/GMXRC.bash
  sed "s:/usr/bin:/etc/profile.d:" ${pkgdir}/usr/bin/GMXRC > ${pkgdir}/etc/profile.d/GMXRC
  chmod 755 ${pkgdir}/etc/profile.d/GMXRC
  mv ${pkgdir}/usr/bin/GMXRC.* ${pkgdir}/etc/profile.d/
  rm -f ${pkgdir}/usr/bin/completion.*
  rm -f ${pkgdir}/usr/bin/GMXRC
}

