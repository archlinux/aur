# Maintainers: James Spencer <james.s.spencer@gmail.com>
#              Darjan Krijan [https://disc-kuraudo.eu]

pkgname=scorep
pkgver=9.0
pkgrel=1
pkgdesc="Highly scalable and easy-to-use tool suite for profiling, event tracing, and online analysis of HPC applications."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
depends=('cubew>=4.9' 'cubelib>=4.9' 'openmpi' 'otf2>=3.1.1' 'opari2>=2.0.9' 'gotcha>=1.0.8')
options=('staticlibs')
source=(
	http://perftools.pages.jsc.fz-juelich.de/cicd/${pkgname}/tags/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz
	#scorep-update-fake-gmp-header.patch
)
sha256sums=(
	'5d0a5db4cc6f31c30ae03c7e6f6245e83667b0ff38a7041ffe8b2e8e581e0997'
	#'36601285a46cafc35f3f821e884e1936e72442b084338d6d068308ff07d9d188'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #patch -Np1 < ${srcdir}/scorep-update-fake-gmp-header.patch
}

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
