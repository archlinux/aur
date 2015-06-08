pkgname=mingw-w64-tinyxml
pkgver=2.6.2
pkgrel=2
pkgdesc="Simple, small, C++ XML parser that can be easily integrated into other programs (mingw-w64)"
arch=(any)
url="http://www.grinninglizard.com/tinyxml"
license=("zlib")
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake)
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/tinyxml/tinyxml_${pkgver//./_}.tar.gz"
        "entity.patch"
        "tinyxml-2.5.3-stl.patch"
        "tinyxml.pc"
        "CMakeLists.txt")
sha256sums=('15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593'
            'ef493209b0a51160171fd834a7ecdddd02679463b85fb89a2ea254213e47f99b'
            '3baf2c4dbc2c8f54a151dac8860113d2f549174f83ed85d552b094dfaebb52af'
            '3a658c2d84d461cd64f48aa489baf78bcf06ad193d18455f3e9048a52a1f3b9d'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/tinyxml"
  patch -p0 -i "$srcdir"/entity.patch
  patch -p1 -i "$srcdir"/tinyxml-2.5.3-stl.patch
  cp "$srcdir"/CMakeLists.txt .
}

build() {
  cd "$srcdir/tinyxml"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake -DBUILD_SHARED_LIBS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/tinyxml/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    cd "$srcdir/tinyxml/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
