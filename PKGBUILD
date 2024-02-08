# Maintainer: banana-bred <j.forer@posteo.net>

pkgname='opencoarrays-git'
_name="OpenCoarrays"
pkgver=2.10.2.r0.g5f09984
pkgrel=2
pkgdesc="A transport layer for coarray Fortran compilers."
arch=('x86_64')
url="https://github.com/sourceryinstitute/${_name}"
license=('BSD')
groups=()
depends=('openmpi' )
makedepends=('cmake' 'git' 'gcc-fortran')
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
    -DCMAKE_INSTALL_LIBDIR=lib

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
