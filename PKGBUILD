# Maintainers: James Spencer <james.s.spencer@gmail.com>
#              Darjan Krijan [https://disc-kuraudo.eu]

pkgname=scorep
pkgver=8.3
pkgrel=3
pkgdesc="Highly scalable and easy-to-use tool suite for profiling, event tracing, and online analysis of HPC applications."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
depends=('cubew>=4.8.2' 'cubelib>=4.8.2' 'openmpi' 'otf2>=3.0.3' 'opari2>=2.0.8')
options=('staticlibs')
source=(http://perftools.pages.jsc.fz-juelich.de/cicd/${pkgname}/tags/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('76c914e6319221c059234597a3bc53da788ed679179ac99c147284dcefb1574a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local _configure_flags=(
    --prefix=/usr
    --with-mpi=openmpi
    --with-shmem=openmpi
    --enable-shared
  )
  ./configure "${_configure_flags[@]}"

  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # -j1 for some Fortran module dependency issue
  make -j1 --keep-going check |& tee -a make_check.log || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
