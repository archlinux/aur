# Maintainer: banana-bred <j.forer@posteo.net>
# Contributor: Jed Brown <jed@59A2.org>
# Contributor: George Eleftheriou <eleftg>

pkgname=mpich-fint64
_name=mpich
pkgver=4.3.2
pkgrel=1
pkgdesc="An improved implementation of the Message Passing Interface, built with 64-bit default Fortran integers."
url="https://mpich.org"
arch=(x86_64)
license=("custom")
replaces=(mpich2)
depends=('gcc-fortran' 'libxml2' 'openssh' 'numactl' 'pciutils' 'hwloc' 'bash')
makedepends=(texlive-core sowing autoconf python)
optdepends=(perl python)
install="${_name}.install"
source=("https://www.mpich.org/static/downloads/${pkgver}/${_name}-${pkgver}.tar.gz"
	      "mpich.profile")
sha256sums=('47d774587a7156a53752218c811c852e70ac44db9c502dc3f399b4cb817e3818'
            '30a08e3282031f03959d824b5db650548eda7e70d6893cc8ab4a4fc76e3e9dd0')

options=('!libtool')

build() {
  cd ${srcdir}/${_name}-${pkgver}

  # -- add default-integer-8 to current Fortran flags (which are allowed to be empty)
  export FFLAGS="${FFLAGS:+$FFLAGS }-fdefault-integer-8"
  export FCFLAGS="${FCFLAGS:+$FFLAS }-fdefault-integer-8"

  # CFLAGS etc are normally written into the wrapper compilers.  This
  # gives surprising results, e.g. when the user wants to compile their
  # program without optimization.
  export MPICHLIB_CFLAGS="${CFLAGS}";      unset CFLAGS
  export MPICHLIB_CXXFLAGS="${CXXFLAGS}";  unset CXXFLAGS
  export MPICHLIB_CPPFLAGS="${CPPFLAGS}";  unset CPPFLAGS
  export MPICHLIB_FFLAGS="${FFLAGS}";     # unset FFLAGS
  export MPICHLIB_FCFLAGS="${FCFLAGS}";   # unset FCFLAGS
  export MPICHLIB_LDFLAGS="${LDFLAGS}";    unset LDFLAGS

  mkdir -p build
  cd build

  ../configure --prefix=/opt/mpich-fint64 \
               --with-device=ch4:ucx \
               --with-hwloc \
               --without-java \
               --without-ze \
               --with-wrapper-fcflags='-fdefault-integer-8' \
               --enable-error-checking=runtime \
               --enable-error-messages=all \
               CC=gcc CXX=g++ FC=gfortran

  make
  make mandoc
}

check() {
  cd ${srcdir}/${_name}-${pkgver}/build

  # Disabled for mpich-3.4 due to json-c test failure
  # make check
}

package() {
  cd "${srcdir}/${_name}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  ln -sf mpiexec.hydra "${pkgdir}/opt/mpich-fint64/bin/mpirun.hydra"

  install -D -m644 "${srcdir}/${_name}-${pkgver}/COPYRIGHT" "${pkgdir}/usr/share/licenses/mpich-fint64/license.txt"
  install -D -m644 "${srcdir}/${_name}.profile" "${pkgdir}/etc/profile.d/mpich-fint64.sh"

  mkdir -p "${pkgdir}/etc/ld.so.conf.d"
  echo /opt/mpich-fint64/lib > "${pkgdir}/etc/ld.so.conf.d/mpich-fint64.conf"
}
