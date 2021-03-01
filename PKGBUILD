pkgname=mingw-w64-imgui
pkgver=1.81
pkgrel=1
pkgdesc="Bloat-free Graphical User interface for C++ (mingw-w64)"
license=('MIT')
arch=('any')
url="https://github.com/ocornut/imgui"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/ocornut/imgui/archive/v${pkgver}.tar.gz")
sha256sums=('f7c619e03a06c0f25e8f47262dbc32d61fd033d2c91796812bf0f8c94fca78fb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd imgui-$pkgver
  wget https://raw.githubusercontent.com/microsoft/vcpkg/master/ports/imgui/CMakeLists.txt
  wget https://raw.githubusercontent.com/microsoft/vcpkg/master/ports/imgui/imgui-config.cmake.in  
}


build() {
  cd imgui-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do  
    cd "$srcdir/imgui-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

