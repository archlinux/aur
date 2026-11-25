# Maintainer: banana-bred <j.forer@posteo.net>

pkgname='opencoarrays-mpich-git'
_name="OpenCoarrays"
pkgver=2.11.0.r0.g91ea936
pkgrel=1
pkgdesc="A transport layer for coarray Fortran compilers, compiled with MPICH."
arch=('x86_64')
url="https://github.com/sourceryinstitute/${_name}"
license=('BSD-3-Clause')
groups=()
depends=('mpich'  'gcc-fortran' 'bash')
makedepends=('cmake' 'git')
checkdepends=()
optdepends=()
provides=('opencoarrays')
conflicts=("${pkgname%%-*}" "${pkgname%%-*}"-git "${pkgname%-*}")
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=("${pkgname%%-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {

  cd "${pkgname%%-*}"

  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {

  cd "${srcdir}/${pkgname%%-*}"

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

  cd "${srcdir}/${pkgname%%-*}"
  ctest --test-dir build -j"$(nproc)" --output-on-failure

}

package() {

  cd "${srcdir}/${pkgname%%-*}/build"

  make DESTDIR="${pkgdir}" install

  install -D -m 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim: ts=2 sw=2 et :
