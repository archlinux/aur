# Maintainer: banana-bred <j.forer@posteo.net>

pkgname='opencoarrays'
_name='OpenCoarrays'
pkgver=2.10.1
pkgrel=1
pkgdesc="A transport layer for coarray Fortran compilers."
arch=('x86_64')
url="https://github.com/sourceryinstitute/OpenCoarrays"
license=('BSD')
groups=()
depends=('mpich' 'gcc-fortran')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=("https://github.com/sourceryinstitute/OpenCoarrays/releases/download/${pkgver}/OpenCoarrays-${pkgver}.tar.gz")
sha256sums=('b04b8fa724e7e4e5addbab68d81d701414e713ab915bafdf1597ec5dd9590cd4')

build() {

  cd "${srcdir}/${_name}-${pkgver}"

  export FC="$(command -v gfortran)"
  export CC="$(command -v gcc)"
  cmake \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DMPI_C_COMPILER=/opt/mpich/bin/mpicc \
    -DMPI_Fortran_COMPILER=/opt/mpich/bin/mpifort \
    -DMPIEXEC_EXECUTABLE=/opt/mpich/bin/mpiexec

  cd "${srcdir}/${_name}-${pkgver}/build"

  make

}

check() {

  cd "${srcdir}/${_name}-${pkgver}/build"

  make test

}

package() {

  cd "${srcdir}/${_name}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install

  install -D -m 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim: ts=2 sw=2 et :
