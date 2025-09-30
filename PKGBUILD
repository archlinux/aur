# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eric Engestrom <aur@engestrom.ch>
# Contributor: Yevhenii Kolesnikov <sigexp.acc at gmail dot com>

pkgname=gfxreconstruct
pkgver=1.4.321.0
pkgrel=1
pkgdesc="Graphics API Capture and Replay Tools for Reconstructing Graphics Application Behavior"
arch=(x86_64 aarch64)
url="https://github.com/LunarG/gfxreconstruct"
license=(MIT)
depends=(python zlib lz4 zstd gcc-libs glibc)
makedepends=(cmake git ninja xcb-util-keysyms libx11 libxcb wayland libxrandr)
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
	# -DOPENXR_HEADER:FILEPATH=/usr/include/openxr # don't work
	-DGFXRECON_ENABLE_OPENXR:BOOL=OFF
	#  install(EXPORT "openxr_loader_export" ...) includes target "openxr_loader"
	# which requires target "jsoncpp_interface" that is not in any export set.
  )

  cmake -B build -S "gfxreconstruct" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D gfxreconstruct/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # 'Remove .py file extension from files that are going to /usr/bin/'
  for f in $pkgdir/usr/bin/*.py; do
    mv -v $f ${f%.py}
  done
}
