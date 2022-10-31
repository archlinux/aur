_targets="x86_64-apple-darwin"

pkgname="${_targets}"-binutils
pkgver=2.39
pkgrel=2
pkgdesc="Cross binutils for the Apple Darwin cross-compiler"
arch=('x86_64')
url="http://www.gnu.org/software/binutils"
license=('GPL')
#groups=
depends=('zlib')
makedepends=(rsync)
options=('!libtool' '!emptydirs')
source=("rsync://mirrors.ocf.berkeley.edu/gnu/binutils/binutils-${pkgver}.tar.xz"{,.sig})
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F')
sha512sums=('68e038f339a8c21faa19a57bbc447a51c817f47c2e06d740847c6e9cc3396c025d35d5369fa8c3f8b70414757c89f0e577939ddc0d70f283182504920f53b0a3'
            'SKIP')

prepare() {
  cd ${srcdir}/binutils-${pkgver}
  #do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in
  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  for _target in $_targets; do
    msg "Building ${_target} cross binutils"
    mkdir -p ${srcdir}/binutils-${_target} && cd "${srcdir}/binutils-${_target}"
    $srcdir/binutils-${pkgver}/configure --prefix=/usr \
        --target=${_target} \
        --infodir=/usr/share/info/${_target} \
        --enable-lto --enable-plugins \
        --enable-64-bit-bfd \
        --disable-multilib --disable-nls \
        --disable-werror
     make
  done
}

package() {
  for _target in ${_targets}; do
    msg "Installing ${_target} cross binutils"
    cd ${srcdir}/binutils-${_target}
    make DESTDIR=${pkgdir} install
  done
}
