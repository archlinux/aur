# Maintainer: Jed Brown <jed@59A2.org>
# Contributor: Jed Brown <jed@59A2.org>
# Contributor: George Eleftheriou <eleftg>

pkgname=mpich
pkgver=3.4.3
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
	"mpich.profile"
	"mpich-3.4.2-flags.diff")
sha256sums=('8154d89f3051903181018166678018155f4c2b6f04a9bb6fe9515656452c4fd7'
            'b9716439a544511bf88618edeb40c3eb80f1b5d0d9369c30d750251feed02284'
            'ce0b565b11a6abc2771e75b53ba84c17bf6534e7f83d20c0fc226ff468c40bae')
options=('!libtool')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # https://github.com/pmodels/mpich/issues/5360
  patch -p1 < ${srcdir}/mpich-3.4.2-flags.diff
  autoreconf -fi

  # CFLAGS etc are normally written into the wrapper compilers.  This
  # gives surprising results, e.g. when the user wants to compile their
  # program without optimization.
  export MPICHLIB_CFLAGS="${CFLAGS} -Wno-error=array-bounds";      unset CFLAGS
  export MPICHLIB_CXXFLAGS="${CXXFLAGS}";  unset CXXFLAGS
  export MPICHLIB_CPPFLAGS="${CPPFLAGS}";  unset CPPFLAGS
  export MPICHLIB_FFLAGS="${FFLAGS}";      unset FFLAGS
  export MPICHLIB_FCFLAGS="${FCFLAGS}";    unset FCFLAGS
  export MPICHLIB_LDFLAGS="${LDFLAGS}";    unset LDFLAGS

  mkdir -p build
  cd build

  ../configure --prefix=/opt/mpich \
               --with-device=ch4:ucx \
               --with-hwloc-prefix=system \
               --without-java \
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
