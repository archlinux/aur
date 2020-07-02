# Maintainer: Jonathan Kotta <jpkotta at gmail dot com>
pkgname=mpich2
pkgver=1.5
pkgrel=3
pkgdesc="An improved implementation of the Message Passing Interface (legacy version)."
arch=('x86_64')
url="http://mpich.org"
license=('custom')
groups=()
depends=(gcc8-fortran libxml2 numactl pciutils)
makedepends=(libtool make coreutils texlive-core sowing)
optdepends=(java-environment)
provides=()
conflicts=(mpich)
replaces=()
backup=()
options=(!libtool strip)
install=mpich2.install
changelog=
source=(
  http://www.mpich.org/static/downloads/$pkgver/$pkgname-$pkgver.tar.gz
  mpich2.install
  mpich2.profile
)
md5sums=('c60146aa6691005f2fb25973e144cfdc'
         '661f5a993e1afb6c51fdd5ad529d628b'
         '5cbf7c44567242e925ea3795262671e5')
noextract=()

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  unset MAKEFLAGS # -j2 causes trouble, http://trac.mcs.anl.gov/projects/mpich2/ticket/955

  # CFLAGS etc are normally written into the wrapper compilers.  This
  # gives surprising results, e.g. when the user wants to compile their
  # program without optimization.
  export MPICH2LIB_CFLAGS="$CFLAGS";      unset CFLAGS
  export MPICH2LIB_CXXFLAGS="$CXXFLAGS";  unset CXXFLAGS
  export MPICH2LIB_FFLAGS="$FFLAGS";      unset FFLAGS
  export MPICH2LIB_FCFLAGS="$FCFLAGS";  unset FCFLAGS
  export MPICH2LIB_LDFLAGS="$LDFLAGS";    unset LDFLAGS

  ./configure \
    --prefix=/opt/$pkgname \
    --enable-shared --enable-sharedlibs=gcc \
    --enable-error-checking=runtime --enable-error-messages=all \
    --enable-fc  --enable-f77 --enable-cxx \
    --enable-g=meminit \
    --with-pm=hydra:gforker:mpd \
    --enable-timer-type=clock_gettime \
    --disable-wrapper-rpath \
    --with-device=ch3:nemesis \
    CC=gcc-8 CXX=g++-8 F77=gfortran-8 FC=gfortran-8 \
    FFLAGS=-Wno-argument-mismatch \
    FCFLAGS=-Wno-argument-mismatch

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  ln -sf mpiexec.hydra "${pkgdir}/opt/$pkgname/bin/mpiexec"
  ln -sf mpiexec "${pkgdir}/opt/$pkgname/bin/mpirun"
  for pm in hydra mpd gforker; do
    ln -sf "mpiexec.${pm}" "${pkgdir}/opt/$pkgname/bin/mpirun.${pm}"
  done
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/COPYRIGHT ${pkgdir}/usr/share/licenses/$pkgname/license.txt
  install -D -m755 ${srcdir}/${pkgname}.profile ${pkgdir}/etc/profile.d/${pkgname}.sh
  mkdir -p ${pkgdir}/etc/ld.so.conf.d
  echo /opt/${pkgname}/lib > ${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf
}

# vim:set ts=2 sw=2 et:
