# Maintainer: Robert Manner <the_manni at users.sf.net>

pkgname=directx-shader-compiler
_pkgname=DirectXShaderCompiler
pkgdesc="A compiler for HLSL to DXIL (DirectX Intermediate Language)."
pkgver=1.4.1907
pkgrel=1
arch=('x86_64')
url="https://github.com/microsoft/${_pkgname}"
license=('BSD')  # NCSA
makedepends=('cmake')
conflicts=('directx-shader-compiler-git')
_pkgver_spirvheaders=1.4.2
_pkgver_spirvtools=2019.4
source=("https://github.com/microsoft/DirectXShaderCompiler/archive/v${pkgver}.tar.gz"
  "https://github.com/KhronosGroup/SPIRV-Headers/archive/${_pkgver_spirvheaders}.tar.gz"
  "https://github.com/KhronosGroup/SPIRV-Tools/archive/v${_pkgver_spirvtools}.tar.gz"
)
md5sums=('2605740814353381474792cb8e6f7112'
         'acbd2ca28d01ff86596378be18d37c6c'
         'c666f17aa0338af05918270885f81a6c')
sha256sums=('b741e15920618e1df07931dd8c3156a940acc86732615f702041e71e91df178d'
            '7dbdd805aeb142b153b8dccd8c70d705e55664a576ca58abca37f36ad5ab3244'
            '2ab4fa3dbff0aa263da9576beefa5d080ebaf3672b1215025504115d614caab5')

prepare() {
  cd "$srcdir/${_pkgname}-${pkgver}/external/"
  rm -rf "SPIRV-Headers" && ln -sf "$srcdir/SPIRV-Headers-${_pkgver_spirvheaders}" SPIRV-Headers
  rm -rf "SPIRV-Tools" && ln -sf "$srcdir/SPIRV-Tools-${_pkgver_spirvtools}" SPIRV-Tools
}

build() {
  mkdir -p "$srcdir/${_pkgname}-${pkgver}/build"
  cd "$srcdir/${_pkgname}-${pkgver}/build"

  cmake .. -DCMAKE_BUILD_TYPE=Release $(cat ../utils/cmake-predefined-config-params) -DCMAKE_INSTALL_LIBDIR=/opt/directx-shader-compiler/lib -DCMAKE_INSTALL_PREFIX=/opt/directx-shader-compiler
  make
}

package() {
  make -C "$srcdir/${_pkgname}-${pkgver}/build" DESTDIR="$pkgdir" install
}
