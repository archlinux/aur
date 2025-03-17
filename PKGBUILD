
_pkgname=sdl3_shadercross
pkgname=$_pkgname-git
_pkgver=3.0.0
pkgver=3.0.0.r105.g6302645
pkgrel=1
pkgdesc="Shader translation library for SDL's GPU API"
arch=('x86_64')
url="https://github.com/libsdl-org/SDL_shadercross"
license=('Zlib')
depends=('sdl3' 'spirv-cross' 'directx-shader-compiler')
options=(!debug)
makedepends=('cmake')
conflicts=('sdl3_image-git')
_pkgsrc="SDL_shadercross"
source=("${_pkgsrc}::git+$url.git"
#        "${_pkgsrc}-SPIRV-Cross::git+https://github.com/KhronosGroup/SPIRV-Cross.git"
#        "${_pkgsrc}-SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git"
#        "${_pkgsrc}-SPIRV-Tools::git+https://github.com/KhronosGroup/SPIRV-Tools.git"
#        "${_pkgsrc}-DirectXShaderCompiler::git+https://github.com/microsoft/DirectXShaderCompiler.git"
)
sha256sums=('SKIP' 
#  'SKIP' 
#  'SKIP' 
#  'SKIP' 
#  'SKIP'
)


pkgver() {
  cd "$_pkgsrc"

  local ver="$_pkgver"
  local rev=$(git rev-list --count HEAD)
  local hash=$(git rev-parse --short HEAD)
  echo "$ver.r$rev.g$hash"
}

prepare() {
  cd "$_pkgsrc"
 # git submodule update --init
  # git config submodule."external/SPIRV-Cross".url "$srcdir/${_pkgsrc}-SPIRV-Cross"
  # git config submodule."external/SPIRV-Headers".url "$srcdir/${_pkgsrc}-SPIRV-Headers"
  # git config submodule."external/SPIRV-Tools".url "$srcdir/${_pkgsrc}-SPIRV-Tools"
  # git config submodule."external/DirectXShaderCompiler".url "$srcdir/${_pkgsrc}-DirectXShaderCompiler"

  # git -c protocol.file.allow=always submodule update
}

build() {
    # : 'removing support for DXC, as it wont build otherwise atm' \
  cmake -B build -S "$_pkgsrc" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
    # -DSDLSHADERCROSS_DXC=ON \
    # -DSDLSHADERCROSS_INSTALL=ON \
    # -DSDLSHADERCROSS_SHARED=ON

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
