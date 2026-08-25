# Maintainer: banana-bred <j.forer@posteo.net>

pkgname='opencoarrays'
_name='OpenCoarrays'
pkgver=2.10.3
pkgrel=5
pkgdesc="A transport layer for coarray Fortran compilers."
arch=('x86_64')
url="https://github.com/sourceryinstitute/OpenCoarrays"
license=('BSD')
groups=()
depends=('openmpi')
makedepends=('gcc-fortran' 'cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=("${pkgname}-git" "${pkgname}-mpich-git")
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
# source=("https://github.com/sourceryinstitute/OpenCoarrays/releases/download/${pkgver}/OpenCoarrays-${pkgver}.tar.gz")
source=("https://github.com/sourceryinstitute/OpenCoarrays/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=(f9f2fb6ac1fe92c1ea66976894b5cebe53812827b7d1238fed933e2845e8a022)


prepare() {

  # -- add '--use-hwthread-cpus' to test_parameters
  sed -i '/set(test_parameters -np ${num_caf_img} ${test_parameters})/i\
  set(test_parameters ${test_parameters} --use-hwthread-cpus)' "${srcdir}/${_name}-${pkgver}/CMakeLists.txt"

}

build() {

  cd "${srcdir}/${_name}-${pkgver}"

  export FC="$(command -v gfortran)"
  export CC="$(command -v gcc)"
  cmake \
    -B build \
    -D openmpi=TRUE \
    -D N_CPU="$(nproc)" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib

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
