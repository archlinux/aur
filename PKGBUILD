# Maintainer: Jed Brown <jed@59A2.org>
# Contributor: Jed Brown <jed@59A2.org>
# Contributor: George Eleftheriou <eleftg>

pkgname=mpich
pkgver=4.1
pkgrel=1
pkgdesc="An improved implementation of the Message Passing Interface."
url="https://mpich.org"
arch=(x86_64)
license=("custom")
replaces=(mpich2)
depends=('gcc-fortran' 'libxml2' 'openssh' 'numactl' 'pciutils' 'hwloc' 'bash')
makedepends=(texlive-core sowing autoconf python)
optdepends=(perl python)
install="${pkgname}.install"
source=("https://www.mpich.org/static/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"mpich.profile")
sha256sums=('8b1ec63bc44c7caa2afbb457bc5b3cd4a70dbe46baba700123d67c48dc5ab6a0'
            'b9716439a544511bf88618edeb40c3eb80f1b5d0d9369c30d750251feed02284')
options=('!libtool')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # https://github.com/openucx/ucx/pull/8450
  sed -i -e 's/\<PTR\>/void */' modules/ucx/src/ucs/debug/debug.c

  # CFLAGS etc are normally written into the wrapper compilers.  This
  # gives surprising results, e.g. when the user wants to compile their
  # program without optimization.
  export MPICHLIB_CFLAGS="${CFLAGS}";      unset CFLAGS
  export MPICHLIB_CXXFLAGS="${CXXFLAGS}";  unset CXXFLAGS
  export MPICHLIB_CPPFLAGS="${CPPFLAGS}";  unset CPPFLAGS
  export MPICHLIB_FFLAGS="${FFLAGS}";      unset FFLAGS
  export MPICHLIB_FCFLAGS="${FCFLAGS}";    unset FCFLAGS
  export MPICHLIB_LDFLAGS="${LDFLAGS}";    unset LDFLAGS

  mkdir -p build
  cd build

  ../configure --prefix=/opt/mpich \
               --with-device=ch4:ucx \
               --with-hwloc \
               --without-java \
               --without-ze \
               --enable-error-checking=runtime \
               --enable-error-messages=all \
               CC=gcc CXX=g++ FC=gfortran

  make
  make mandoc
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}/build

  # Disabled for mpich-3.4 due to json-c test failure
  # make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  ln -sf mpiexec.hydra "${pkgdir}/opt/mpich/bin/mpirun.hydra"

  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/COPYRIGHT" "${pkgdir}/usr/share/licenses/mpich/license.txt"
  install -D -m755 "${srcdir}/${pkgname}.profile" "${pkgdir}/etc/profile.d/mpich.sh"

  mkdir -p "${pkgdir}/etc/ld.so.conf.d"
  echo /opt/mpich/lib > "${pkgdir}/etc/ld.so.conf.d/mpich.conf"
}
