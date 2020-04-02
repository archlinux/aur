pkgname=mingw-w64-nauty
pkgver=26r12
pkgrel=1
pkgdesc="A program for computing automorphism groups of graphs and digraphs (mingw-w64)"
arch=(any)
url="http://pallini.di.uniroma1.it/"
license=(Apache)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
options=(!strip !buildflags staticlibs)
source=("http://pallini.di.uniroma1.it/nauty$pkgver.tar.gz")
sha256sums=('862ae0dc3656db34ede6fafdb0999f7b875b14c7ab4fedbb3da4f28291eb95dc')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  for _arch in ${_architectures}; do
    rm -rf build-${_arch}
    cp -r nauty$pkgver build-${_arch}
    # lib prefix + use arch-ar 
    sed -i "s|ar crs |${_arch}-ar crs lib|g" build-${_arch}/makefile.in
  done
  
}

build() {
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    ${_arch}-configure .
    make
    ${_arch}-ranlib *.a

    # build shared libs, see makefile.in
    ${_arch}-cc -shared -o libnauty.dll nauty.o nautil.o nausparse.o naugraph.o schreier.o naurng.o traces.o gtools.o naututil.o nautinv.o gutil1.o gutil2.o gtnauty.o naugroup.o -Wl,--out-implib,libnauty.dll.a -Wl,-O1,--sort-common,--as-needed -fstack-protector
    ${_arch}-cc -shared -o libnauty1.dll nauty1.o nautil1.o nausparse.o naugraph1.o schreier.o naurng.o traces.o gtools.o naututil1.o nautinv1.o gutil1.o gutil2.o gtnauty.o naugroup.o -Wl,--out-implib,libnauty1.dll.a -Wl,-O1,--sort-common,--as-needed -fstack-protector
    ${_arch}-cc -shared -o libnautyW.dll nautyW.o nautilW.o nausparseW.o naugraphW.o schreierW.o naurng.o traces.o gtoolsW.o naututilW.o nautinvW.o gutil1W.o gutil2W.o gtnautyW.o naugroupW.o -Wl,--out-implib,libnautyW.dll.a -Wl,-O1,--sort-common,--as-needed -fstack-protector
    ${_arch}-cc -shared -o libnautyW1.dll nautyW1.o nautilW1.o nausparseW.o naugraphW1.o schreierW.o naurng.o traces.o gtoolsW.o naututilW1.o nautinvW1.o gutil1W1.o gutil2W1.o gtnautyW1.o naugroupW.o -Wl,--out-implib,libnautyW1.dll.a -Wl,-O1,--sort-common,--as-needed -fstack-protector
    ${_arch}-cc -shared -o libnautyL.dll nautyL.o nautilL.o nausparseL.o naugraphL.o schreierL.o naurng.o traces.o gtoolsL.o naututilL.o nautinvL.o gutil1L.o gutil2L.o gtnautyL.o naugroupL.o -Wl,--out-implib,libnautyL.dll.a -Wl,-O1,--sort-common,--as-needed -fstack-protector
    ${_arch}-cc -shared -o libnautyL1.dll nautyL1.o nautilL1.o nausparseL.o naugraphL1.o schreierL.o naurng.o traces.o gtoolsL.o naututilL1.o nautinvL1.o gutil1L1.o gutil2L1.o gtnautyL1.o naugroupL.o -Wl,--out-implib,libnautyL1.dll.a -Wl,-O1,--sort-common,--as-needed -fstack-protector
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    mkdir -p "$pkgdir"/usr/${_arch}/{bin,lib,include/nauty}
    install -m644 *.a "$pkgdir"/usr/${_arch}/lib
    install -m755 *.dll "$pkgdir"/usr/${_arch}/bin
    install -m644 *.h "$pkgdir"/usr/${_arch}/include/nauty
    popd
  done
}
