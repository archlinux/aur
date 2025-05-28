# Maintainer: banana-bred <j.forer@posteo.net>

pkgname='opencoarrays-mpich-git'
_name="OpenCoarrays"
pkgver=2.10.2.r32.g3d0fa68
pkgrel=2
pkgdesc="A transport layer for coarray Fortran compilers, compiled with MPICH."
arch=('x86_64')
url="https://github.com/sourceryinstitute/${_name}"
license=('BSD')
groups=()
depends=('mpich' )
makedepends=('cmake' 'git' 'gcc-fortran')
checkdepends=()
optdepends=()
provides=()
conflicts=("${pkgname%%-*}" "${pkgname%%-*}"-git)
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

  cmake \
    -B build \
    -DCMAKE_PREFIX_PATH=/opt/mpich \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -D openmpi=FALSE \
    -D N_CPU="$(nproc)" \
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
