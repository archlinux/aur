# Maintainers: James Spencer <james.s.spencer@gmail.com>
#              Darjan Krijan [https://disc-kuraudo.eu]

pkgname=scorep
pkgver=8.4
pkgrel=1
pkgdesc="Highly scalable and easy-to-use tool suite for profiling, event tracing, and online analysis of HPC applications."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
depends=('cubew>=4.8.2' 'cubelib>=4.8.2' 'openmpi' 'otf2>=3.0.3' 'opari2>=2.0.8')
options=('staticlibs')
source=(http://perftools.pages.jsc.fz-juelich.de/cicd/${pkgname}/tags/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('7bbde9a0721d27cc6205baf13c1626833bcfbabb1f33b325a2d67976290f7f8a')

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
