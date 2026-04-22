# Maintainer: Layne Pedersen <layne.pedersen at gmail dot com>

pkgname=mingw-w64-cspice
pkgver="N0067"
pkgrel=1
pkgdesc="A comprehensive toolkit and api to design, simulate and analyse space missions"
arch=("x86_64")
url="https://naif.jpl.nasa.gov/naif/aboutspice.html"
depends=("mingw-w64-f2c")
makedepends=("tcsh" "mingw-w64-gcc")
source=("http://naif.jpl.nasa.gov/pub/naif/toolkit/C/PC_Linux_GCC_64bit/packages/cspice.tar.Z"
        "mingw.patch")
sha1sums=('a104e4795abdd0aae3b6e8163fbfea8f08558c79'
          '1045813433928cc34c5586d68c05a7a58b24ac4a')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


prepare() {
  cd "cspice"
  patch -i "$srcdir"/mingw.patch -p 1
}

build() {
  #export TKCOMPILER="x86_64-w64-mingw32-gcc"
  for _arch in ${_architectures}; do
    export TKCOMPILER="${_arch}-gcc"

    mkdir -p "cspice-${_arch}"
    cp -a cspice/* "cspice-${_arch}"

    pushd "cspice-${_arch}"

    if [ "${_arch}" == "i686-w64-mingw32" ]; then
      find -name mkprodct.csh -exec sed -i '/TKCOMPILEOPTIONS/s/-m64/-m32/' {} ';'
      find -name mkprodct.csh -exec sed -i '/TKLINKOPTIONS/s/-m64/-m32/' {} ';'
    fi

    ./makeall.csh
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    mkdir -p "$pkgdir/usr/${_arch}/bin"
    mkdir -p "$pkgdir/usr/${_arch}/usr/share/doc"
    mkdir -p "$pkgdir/usr/${_arch}/usr/lib"

    cp -a "cspice-${_arch}"/data "$pkgdir/usr/${_arch}/usr/share/cspice"
    cp -a "cspice-${_arch}"/doc "$pkgdir/usr/${_arch}/usr/share/doc/cspice"
    cp -a "cspice-${_arch}"/exe/*.exe "$pkgdir/usr/${_arch}/bin/"
    cp -a "cspice-${_arch}"/include "$pkgdir/usr/${_arch}/usr"
    cp -a "cspice-${_arch}"/lib/* "$pkgdir/usr/${_arch}/usr/lib"

    #we remove the vendorized header and rely on the library package to supply it instead
    rm -f "$pkgdir/usr/${_arch}/include/f2c.h"
  done
}
