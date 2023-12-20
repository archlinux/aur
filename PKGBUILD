# Maintainer : Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=mingw-w64-gavl
_pkgname=gavl
pkgver=1.4.0
pkgrel=1
pkgdesc='Low level library, upon which multimedia APIs can be built (mingw-w64)'
arch=('any')
url='https://gmerlin.sourceforge.net/'
license=('GPL')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-configure')
source=("https://downloads.sourceforge.net/gmerlin/$_pkgname-$pkgver.tar.gz"
	"configure.patch"
        "x86_64_cputest.patch"
        "libtool.patch")
sha256sums=('51aaac41391a915bd9bad07710957424b046410a276e7deaff24a870929d33ce'
            'df2a64a3698856035c603bb28529208dc36b0d685c338a726c149d1157a6a0df'
            '86a7411fb43a6bb335661b1f38d6315efb3dc57cfafb274c911ee4a433837d1f'
	    '7cc4329580294fbf62ec892acd56a43b4d914e86d534f658964a5b5ea256bf6e')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd $_pkgname-$pkgver
  # ignore test program for clock monotonic
  # (maybe change to running with wine?)
  patch -Np1 -i "${srcdir}/configure.patch"
  # 64 bit assembly throws an error. Use fall back to pure C.
  patch -Np1 -i "${srcdir}/x86_64_cputest.patch"
  # add file magic for 64 bit
  patch -Np1 -i "${srcdir}/libtool.patch"

  # Fix build
  sed -i 's|volume_test_LDADD = ../gavl/libgavl.la|volume_test_LDADD = -lm ../gavl/libgavl.la|' src/Makefile.{am,in}
  sed -i 's/LDFLAGS="$GMERLIN_DEP_RPATH"/LDFLAGS="$LDFLAGS $GMERLIN_DEP_RPATH"/' configure{,.ac}
  sed -i 's|-Xlinker --out-implib -Xlinker \$lib|-Wl,--out-implib .libs/libgavl.dll.a|' aclocal.m4
  sed -i 's|-Xlinker --out-implib -Xlinker \$lib|-Wl,--out-implib .libs/libgavl.dll.a|' configure
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/$_pkgname-$pkgver/build-${_arch} && cd ${srcdir}/$_pkgname-$pkgver/build-${_arch}

    export LDFLAGS="-lssp"

    ${_arch}-configure --with-cpuflags=none --without-doxygen
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/$_pkgname-$pkgver/build-${_arch}

    # install shared libraries
    mkdir -p ${pkgdir}/usr/${_arch}/bin
    mkdir -p ${pkgdir}/usr/${_arch}/lib
    install -m755 gavl/.libs/libgavl*.dll ${pkgdir}/usr/${_arch}/bin
    install -m755 gavl/.libs/libgavl*.dll.a ${pkgdir}/usr/${_arch}/lib

    make DESTDIR="$pkgdir" install

    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}
