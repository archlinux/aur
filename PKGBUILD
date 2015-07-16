# Contributor: Jed Brown <jed@59A2.org>
# Maintainer: George Eleftheriou <eleftg>

pkgname=mpich
pkgver=3.1.4
pkgrel=1
pkgdesc="An improved implementation of the Message Passing Interface."
url="https://mpich.org"
arch=('i686' 'x86_64')
license="custom"
depends=(python2 gcc-fortran libxml2 openssh numactl pciutils libpciaccess)
makedepends=(libtool make coreutils texlive-core sowing)
optdepends=(java-environment)
conflicts=()
replaces=(mpich2)
backup=()
install=install.mpich
source=(http://www.mpich.org/static/downloads/$pkgver/$pkgname-$pkgver.tar.gz
	install.mpich
	mpich.profile)
sha256sums=('f68b5330e94306c00ca5a1c0e8e275c7f53517d01d6c524d51ce9359d240466b'
            '73f282ada178d7299b21ba2263d094cb001c2768fa7f617633c84afe7ac27e16'
            'b9716439a544511bf88618edeb40c3eb80f1b5d0d9369c30d750251feed02284')
options=(!libtool)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # CFLAGS etc are normally written into the wrapper compilers.  This
  # gives surprising results, e.g. when the user wants to compile their
  # program without optimization.
  export MPICHLIB_CFLAGS="$CFLAGS";      unset CFLAGS
  export MPICHLIB_CXXFLAGS="$CXXFLAGS";  unset CXXFLAGS
  export MPICHLIB_CPPFLAGS="$CPPFLAGS";  unset CPPFLAGS
  export MPICHLIB_FFLAGS="$FFLAGS";      unset FFLAGS
  export MPICHLIB_F90FLAGS="$F90FLAGS";  unset F90FLAGS
  export MPICHLIB_LDFLAGS="$LDFLAGS";    unset LDFLAGS

  mkdir -p build
  cd build
  ../configure --prefix=/opt/mpich --enable-shared --enable-sharedlibs=gcc \
    --enable-error-checking=runtime --enable-error-messages=all \
    --enable-timer-type=clock_gettime \
    --with-python=python2
  make
  make mandoc
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install

  ln -sf mpiexec.hydra "${pkgdir}/opt/mpich/bin/mpiexec"
  ln -sf mpiexec "${pkgdir}/opt/mpich/bin/mpirun"
  for pm in hydra; do
    ln -sf "mpiexec.${pm}" "${pkgdir}/opt/mpich/bin/mpirun.${pm}"
  done
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/COPYRIGHT ${pkgdir}/usr/share/licenses/mpich/license.txt
  install -D -m755 ${srcdir}/${pkgname}.profile ${pkgdir}/etc/profile.d/mpich.sh
  mkdir -p ${pkgdir}/etc/ld.so.conf.d
  echo /opt/mpich/lib > ${pkgdir}/etc/ld.so.conf.d/mpich.conf
}
