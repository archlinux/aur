# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=mingw-w64-directxtex
pkgdesc="Texture processing library (mingw-w64)"
# Version from CMakeLists.txt.
pkgver=2.0.9
_tag=oct2025
pkgrel=1
arch=('any')
depends=('mingw-w64-directx-headers' 'mingw-w64-directxmath')
makedepends=('mingw-w64-cmake' 'ninja')
url="https://go.microsoft.com/fwlink/?LinkId=248926"
license=('MIT')
options=('!buildflags' '!debug' 'staticlibs' '!strip')
source=(directxtex-${_tag}.tar.gz::https://github.com/microsoft/DirectXTex/archive/refs/tags/${_tag}.tar.gz)
sha256sums=('d3de2f2de6209dcd468e3d29612488034601cdcc22f6f9976a836ace75f84991')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

# Fix case/path issues when cross compiling
prepare() {
  cd "${srcdir}/DirectXTex-$_tag"
  grep -Frl Windows.h | xargs sed -i 's/Windows.h/windows.h/g'
  grep -Frl ShlObj.h | xargs sed -i 's/ShlObj.h/shlobj.h/g'
  grep -Frl 'wrl\client.h' | xargs sed -i 's/wrl\\client.h/wrl\/client.h/g'
}

# We disable d3d11/d3d12 and compile software only for now.
# This otherwise depends on a windows-based shader compiler by default.
build() {
  COMMON_OPTS=('-DBUILD_DX11=OFF' '-DBUILD_DX12=OFF' '-DBUILD_TOOLS=OFF')
  i686-w64-mingw32-cmake -S DirectXTex-$_tag -B build/i686-w64-mingw32-static -G Ninja \
  -DBUILD_SHARED_LIBS=OFF \
  -DDIRECTX_ARCH=x86 \
  ${COMMON_OPTS[@]}

  x86_64-w64-mingw32-cmake -S DirectXTex-$_tag -B build/x86_64-w64-mingw32-static -G Ninja \
  -DBUILD_SHARED_LIBS=OFF \
  -DDIRECTX_ARCH=x64 \
  ${COMMON_OPTS[@]}

  i686-w64-mingw32-cmake -S DirectXTex-$_tag -B build/i686-w64-mingw32 -G Ninja \
  -DBUILD_SHARED_LIBS=ON \
  -DDIRECTX_ARCH=x86 \
  ${COMMON_OPTS[@]}

  x86_64-w64-mingw32-cmake -S DirectXTex-$_tag -B build/x86_64-w64-mingw32 -G Ninja \
  -DBUILD_SHARED_LIBS=ON \
  -DDIRECTX_ARCH=x64 \
  ${COMMON_OPTS[@]}

  for _arch in ${_architectures}; do
    cmake --build build/${_arch}-static
    cmake --build build/${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build/${_arch}-static
    DESTDIR="${pkgdir}" cmake --install build/${_arch}
  done

  cd DirectXTex-$_tag
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
