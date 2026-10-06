# Maintainers: James Spencer <james.s.spencer@gmail.com>
#              Darjan Krijan [https://disc-kuraudo.eu]

pkgname=scorep
pkgver=10.1
pkgrel=1
pkgdesc="Highly scalable and easy-to-use tool suite for profiling, event tracing, and online analysis of HPC applications."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
depends=('cubew>=4.9.1' 'cubelib>=4.9.1' 'openmpi' 'otf2>=3.1.1' 'opari2>=2.0.9' 'gotcha>=1.0.8' 'papi')
options=('staticlibs')
source=(
	http://perftools.pages.jsc.fz-juelich.de/cicd/${pkgname}/tags/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz
)
sha256sums=('39edf6790c4af25679ab46e361091f177d40ad8f8cfff1b4bf81e775fc59f0c1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local _configure_flags=(
    --prefix=/usr
    --with-mpi=openmpi
    --with-shmem=openmpi
    --enable-gcc-plugin
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
  install -Dm644 README.LICENSES.md "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
