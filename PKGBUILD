# Maintainer: Jed Brown <jed@59A2.org>
# Contributor: Jed Brown <jed@59A2.org>
# Contributor: George Eleftheriou <eleftg>

pkgname=mpich
pkgver=3.4a2
pkgrel=1
pkgdesc="An improved implementation of the Message Passing Interface."
url="https://mpich.org"
arch=("any")
license=("custom")
replaces=(mpich2)
depends=('gcc-fortran' 'libxml2' 'openssh' 'numactl' 'pciutils')
makedepends=('texlive-core' 'sowing')
optdepends=("java-environment")
install="${pkgname}.install"
source=("http://www.mpich.org/static/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"mpich.profile")
sha256sums=('ca9b9a6d4d858f3f94d2ea1ed0b851fccbc6f2976eb08dfc3379be8c6278aa12'
            'b9716439a544511bf88618edeb40c3eb80f1b5d0d9369c30d750251feed02284')
options=('!libtool')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

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
               --with-device=ch3:nemesis \
               --enable-error-checking=runtime \
               --enable-error-messages=all \
               --enable-g=meminit \
               CC=gcc CXX=g++ FC=gfortran \
               FFLAGS=-fallow-argument-mismatch \
               FCFLAGS=-fallow-argument-mismatch

  make
  make mandoc
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}/build

  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  ln -sf mpiexec.hydra "${pkgdir}/opt/mpich/bin/mpiexec"
  ln -sf mpiexec "${pkgdir}/opt/mpich/bin/mpirun"
  ln -sf mpiexec.hydra "${pkgdir}/opt/mpich/bin/mpirun.hydra"

  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/COPYRIGHT" "${pkgdir}/usr/share/licenses/mpich/license.txt"
  install -D -m755 "${srcdir}/${pkgname}.profile" "${pkgdir}/etc/profile.d/mpich.sh"

  mkdir -p "${pkgdir}/etc/ld.so.conf.d"
  echo /opt/mpich/lib > "${pkgdir}/etc/ld.so.conf.d/mpich.conf"
}
