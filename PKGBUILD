# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-gcc-base
pkgver=8.2.0
pkgrel=1
pkgdesc="Cross GCC for the MinGW-w64 cross-compiler (bootstrap)"
arch=('x86_64')
url="http://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
groups=('mingw-w64-bootstrap' 'mingw-w64')
depends=('zlib' 'libmpc' 'ppl' 'cloog' 'mingw-w64-binutils' 'mingw-w64-headers' 'mingw-w64-headers-bootstrap')
conflicts=('mingw-w64-gcc')
options=('staticlibs' '!emptydirs')
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig})
validpgpkeys=(33C235A34C46AA3FFB293709A328C3A2C3C45C06) # Jakub Jelinek <jakub@redhat.com>
sha256sums=('196c3c04ba2613f893283977e6011b2345d1cd1af9abeac58e916b1aab3e0080'
            'SKIP')

prepare() {
  cd ${srcdir}/gcc-${pkgver}

  #do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in
  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure
}

build() {
  for _target in ${_targets}; do
    msg "Building ${_target} GCC C compiler"
    mkdir -p ${srcdir}/gcc-build-${_target} && cd ${srcdir}/gcc-build-${_target}

    ${srcdir}/gcc-${pkgver}/configure --prefix=/usr \
        --target=${_target} \
        --enable-languages=c,lto \
        --enable-static \
        --with-system-zlib \
        --enable-lto --disable-dw2-exceptions \
        --disable-nls --enable-version-specific-runtime-libs \
        --disable-multilib --enable-checking=release
    make all-gcc
  done
}

package() {
  for _target in ${_targets}; do
    msg "Installing ${_target} GCC C compiler"
    cd ${srcdir}/gcc-build-${_target}
    make DESTDIR=${pkgdir} install-gcc
    strip ${pkgdir}/usr/bin/${_target}-*
    strip ${pkgdir}/usr/libexec/gcc/${_target}/${pkgver}/{cc1,collect2,lto*}
  done
  # remove unnecessary files
  msg "Removing man and info pages"
  rm -r ${pkgdir}/usr/share/man
  rm -r ${pkgdir}/usr/share/info
}
