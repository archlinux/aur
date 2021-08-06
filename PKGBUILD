pkgname=mingw-w64-hexer-hobu
pkgver=1.4.0
pkgrel=1
pkgdesc="LAS and OGR hexagonal density and boundary surface generation (mingw-w64)"
arch=('any')
url="https://github.com/hobu/hexer"
license=(LGPL)
depends=(mingw-w64-gdal)
makedepends=(mingw-w64-cmake)
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/hobu/hexer/archive/${pkgver}.tar.gz")
sha512sums=('4db94af7fe0a2cc3cd26202c4ec88fadd88408c92d14e11ac117af51ee267aa87cd82aa18b29867f318d272f644be60a826e7fb3c72908baba4124499f39579c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd hexer-${pkgver}
  curl -L https://github.com/hobu/hexer/pull/18.patch | patch -p1
  sed -i "s|get_git_head_revision|#|g" CMakeLists.txt
}

build() {
  cd hexer-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/hexer-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

