# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=mingw-w64-directxtex
pkgdesc="Texture processing library (mingw-w64)"
# Version from CMakeLists.txt.
pkgver=2.0.3
_tag=mar2024
pkgrel=1
arch=('any')
depends=('mingw-w64-directx-headers' 'mingw-w64-directxmath')
makedepends=('mingw-w64-cmake' 'ninja')
url="https://go.microsoft.com/fwlink/?LinkId=248926"
license=('MIT')
options=('staticlibs' '!strip' '!buildflags')
source=(directxtex-${_tag}.tar.gz::https://github.com/microsoft/DirectXTex/archive/refs/tags/${_tag}.tar.gz)
sha256sums=('1a887a8e4b9a5ba6eff2f1b3ce31a8c3c269318a268d2278ce50b2461eb214c5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  # Fix case/path issues when cross compiling
  cd "${srcdir}/DirectXTex-$_tag"
  grep -Frl Windows.h | xargs sed -i 's/Windows.h/windows.h/g'
  grep -Frl ShlObj.h | xargs sed -i 's/ShlObj.h/shlobj.h/g'
  grep -Frl 'wrl\client.h' | xargs sed -i 's/wrl\\client.h/wrl\/client.h/g'
}

# We disable d3d11/d3d12 and compile software only for now.
# This otherwise depends on a windows-based shader compiler by default.

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -S DirectXTex-$_tag -B build/${_arch} -G Ninja \
    -DBUILD_DX11=OFF \
    -DBUILD_DX12=OFF \
    -DBUILD_TOOLS=OFF

    cmake --build build/${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build/${_arch}
  done
}
