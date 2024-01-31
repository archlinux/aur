# Maintainer: banana-bred <j.forer@posteo.net>

pkgname='opencoarrays-git'
_name="OpenCoarrays"
pkgver=2.10.2.r0.g5f09984
pkgrel=1
pkgdesc="A transport layer for coarray Fortran compilers."
arch=('x86_64')
url="https://github.com/sourceryinstitute/${_name}"
license=('BSD')
groups=()
depends=('mpich' 'gcc-fortran')
makedepends=('cmake' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=("${pkgname%-*}::git+${url}.git")
sha256sums=(SKIP)
# validpgpkeys=('1DB1B5EDE32122B28E56810DCB21118C92A64702' # Izaak Beekman <zbeekman@gmail.com>
#               '9DB31CF0FF5209BF742555701C3986CA8C98C2DE') #

pkgver() {

  cd "${pkgname%-*}"

  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {

  cd "${srcdir}/${pkgname%-*}"

  export FC="$(command -v gfortran)"
  export CC="$(command -v gcc)"

  cmake \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DMPI_C_COMPILER=/opt/mpich/bin/mpicc \
    -DMPI_Fortran_COMPILER=/opt/mpich/bin/mpifort \
    -DMPIEXEC_EXECUTABLE=/opt/mpich/bin/mpiexec

  cd "${srcdir}/${pkgname%-*}/build"

  make

}

check() {

  cd "${srcdir}/${pkgname%-*}/build"

  make test

}

package() {

  cd "${srcdir}/${pkgname%-*}/build"

  make DESTDIR="${pkgdir}" install

  install -D -m 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim: ts=2 sw=2 et :
