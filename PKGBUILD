# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eric Engestrom <aur@engestrom.ch>
# Contributor: Yevhenii Kolesnikov <sigexp.acc at gmail dot com>

pkgname=lib32-gfxreconstruct
pkgver=1.4.321.0
pkgrel=1
pkgdesc="Graphics API Capture and Replay Tools for Reconstructing Graphics Application Behavior"
arch=(x86_64)
url="https://github.com/LunarG/gfxreconstruct"
license=(MIT)
depends=(gfxreconstruct lib32-libx11 lib32-libxcb lib32-wayland lib32-libxrandr lib32-zlib lib32-lz4 lib32-zstd lib32-glibc lib32-gcc-libs)
makedepends=(cmake git ninja xcb-util-keysyms)
source=("git+https://github.com/LunarG/gfxreconstruct.git#tag=vulkan-sdk-$pkgver"
        "git+https://github.com/KhronosGroup/Vulkan-Headers.git"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
        "git+https://github.com/KhronosGroup/SPIRV-Reflect.git")
sha256sums=('fd6877a0de9ec7f76a7bf15ce574c962206218a5a1954ce9ab760c61f2342d58'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd gfxreconstruct
  git submodule init
  git config submodule.external/Vulkan-Headers.url "$srcdir/Vulkan-Headers"
  git config submodule.external/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
  git config submodule.external/SPIRV-Reflect.url "$srcdir/SPIRV-Reflect"
  git config submodule.external/OpenXR-SDK.update none
  git config submodule.external/OpenXR-Docs.update none
  git -c protocol.file.allow=always submodule update
}

build() {
  local _flags=(
	-DGFXRECON_ENABLE_OPENXR:BOOL=OFF
  )

  CFLAGS="$CFLAGS -m32" \
  CXXFLAGS="$CXXFLAGS -m32" \
  LDFLAGS="$LDFLAGS -m32" \
  PKG_CONFIG_PATH=/usr/lib32/pkgconfig \
  cmake -B build -S "gfxreconstruct" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  install -Dm755 build/layer/libVkLayer_gfxreconstruct.so \
    "$pkgdir"/usr/lib32/libVkLayer_gfxreconstruct.so

  install -D gfxreconstruct/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
