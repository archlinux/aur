# Maintainers: James Spencer <james.s.spencer@gmail.com>
#              Darjan Krijan [https://disc-kuraudo.eu]

pkgname=scorep
pkgver=9.1
pkgrel=1
pkgdesc="Highly scalable and easy-to-use tool suite for profiling, event tracing, and online analysis of HPC applications."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
depends=('cubew>=4.9' 'cubelib>=4.9' 'openmpi' 'otf2>=3.1.1' 'opari2>=2.0.9' 'gotcha>=1.0.8')
options=('staticlibs')
source=(
	http://perftools.pages.jsc.fz-juelich.de/cicd/${pkgname}/tags/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz
)
sha256sums=(
	'a6593716e62c751937f3be78782bf09b3737a68c46cdbeabec7cff80d2fdc7c8'
)

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
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
