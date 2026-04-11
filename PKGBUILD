# Maintainer : Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=mingw-w64-gavl
_pkgname=gavl
pkgver=2.0.1
pkgrel=1
pkgdesc='Low level library, upon which multimedia APIs can be built (mingw-w64)'
arch=('any')
url='https://github.com/bplaum/gavl'
license=(GPL-2.0-or-later)
depends=(
  mingw-w64-crt
  mingw-w64-nettle
  mingw-w64-gnutls
)
options=(!strip !buildflags staticlibs !debug)
makedepends=(
  mingw-w64-configure
  mingw-w64-libpng
  git
)
source=("git+https://github.com/bplaum/gavl.git#tag=v$pkgver"
        "configure.patch"
        "opengl.patch"
        "win32-fixes.patch")
b2sums=('c47fa36b64bcf97f6453ec8cdb95a36eda04c2850afb8cd465db0d1c17e3905abe5f5a36e6a00ac5546daedd754238cec1841a09e91aed99ae4209fa0935003c'
        '249ec03073750ccdf7caaa19a35bb990ebfd1a37b164c4222eace89fa0a2f48319bc2562f02614899fcf90d3eb65b41ad5299fbff0f02d031e1fe2d5f6dad9c4'
        '2d8a3426f14cec024dcee40f5ee83e605de836aae2dd7f6fd19f92dcb9402727d78abaa625c2851b9a3fc253789b371657740339d70aaa966e009f00d84208a4'
        '7ad862678a9424891559f3ccd620ba1b5fc8206f43e078d4f2e50a137b25365bff2a9af7cfd936861dc2545acf3fbd949bbbba2e747572d3ee67bacebb953a9c')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd $_pkgname

  git cherry-pick -n 5b776fe265810ff98f3a4e918d2afb0d337aa965 # support nettle 4

  patch -Np1 -i "${srcdir}/configure.patch"
  patch -Np1 -i "${srcdir}/opengl.patch"
  patch -Np1 -i "${srcdir}/win32-fixes.patch"

  autoreconf -fi
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/$_pkgname/build-${_arch} && cd ${srcdir}/$_pkgname/build-${_arch}

    export LDFLAGS="-lssp"

    ${_arch}-configure --with-cpuflags=none --without-doxygen
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/$_pkgname/build-${_arch}

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
