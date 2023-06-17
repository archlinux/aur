# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=mingw-w64-directxtex
pkgdesc="Texture processing library (mingw-w64)"
# Version from CMakeLists.txt.
pkgver=1.9.9
_tag=jun2023
pkgrel=1
arch=('any')
depends=('mingw-w64-directx-headers' 'mingw-w64-directxmath')
makedepends=('mingw-w64-cmake' 'ninja')
url="https://go.microsoft.com/fwlink/?LinkId=248926"
license=('MIT')
options=('staticlibs' '!strip' '!buildflags')
source=(directxtex-${_tag}.tar.gz::https://github.com/microsoft/DirectXTex/archive/refs/tags/${_tag}.tar.gz)
sha256sums=('51f0ff3bee0d1015c110e0c92ebdd9704aa6acd91185328fd92f10b9558f4c62')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  # Fix case/path issues
  cd "${srcdir}/DirectXTex-$_tag"
  grep -Frl Windows.h | xargs sed -i 's/Windows.h/windows.h/g'
  grep -Frl ShlObj.h | xargs sed -i 's/ShlObj.h/shlobj.h/g'
  grep -Frl 'wrl\client.h' | xargs sed -i 's/wrl\\client.h/wrl\/client.h/g'
}

# We disable d3d11/d3d12 and compile software only for now.
# This depends on a windows based shader compiler by default.

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
