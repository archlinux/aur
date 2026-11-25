# Maintainer: banana-bred <j.forer@posteo.net>

pkgname='opencoarrays-mpich'
_name="OpenCoarrays"
pkgver=2.11.0
pkgrel=2
pkgdesc="A transport layer for coarray Fortran compilers, compiled with MPICH."
arch=('x86_64')
url="https://github.com/sourceryinstitute/${_name}"
license=('BSD-3-Clause')
groups=()
depends=('mpich'  'gcc-fortran' 'bash')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=('opencoarrays')
conflicts=("${pkgname%%-*}" "${pkgname%%-*}"-git "${pkgname}"-git)
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2444f2083df3654675cc5563d0391885969b03db94c5b6cb522c85918a48f878')

build() {

  cd "${srcdir}/${_name}-${pkgver}"

  export FC=gfortran
  export CC=gcc

  cmake \
    -B build \
    -DCMAKE_PREFIX_PATH=/opt/mpich \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DMPI_C_COMPILER=/opt/mpich/bin/mpicc \
    -DMPI_Fortran_COMPILER=/opt/mpich/bin/mpifort \
    -DMPIEXEC_EXECUTABLE=/opt/mpich/bin/mpiexec

  cmake --build build
}

check() {

  cd "${srcdir}/${_name}-${pkgver}"
  ctest --test-dir build -j"$(nproc)" --output-on-failure

}

package() {

  cd "${srcdir}/${_name}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install

  install -D -m 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim: ts=2 sw=2 et :
