# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Yevhenii Kolesnikov <sigexp.acc at gmail dot com>

pkgname=gfxreconstruct-git
pkgver=1.4.321.0.r106.g614fbd35c
pkgrel=1
pkgdesc="Graphics API capture and replay tools for reconstructing graphics application behavior"
arch=(x86_64)
url="https://github.com/LunarG/gfxreconstruct"
license=(MIT)
depends=(glibc gcc-libs python zlib lz4 zstd)
makedepends=(git cmake libx11 libxcb wayland xcb-util-keysyms)
provides=(gfxreconstruct)
conflicts=(gfxreconstruct)
source=("git+https://github.com/LunarG/gfxreconstruct.git"
        "git+https://github.com/KhronosGroup/Vulkan-Headers.git"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
        "git+https://github.com/KhronosGroup/SPIRV-Reflect.git"
		#"git+https://github.com/KhronosGroup/OpenXR-SDK.git"
		#"git+https://github.com/KhronosGroup/OpenXR-Docs.git"
		)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd gfxreconstruct
  git describe --long --tags | sed 's/^vulkan-sdk-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gfxreconstruct
  git submodule init
  git config submodule.external/Vulkan-Headers.url "$srcdir/Vulkan-Headers"
  git config submodule.external/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
  git config submodule.external/SPIRV-Reflect.url "$srcdir/SPIRV-Reflect"
  #git config submodule.external/OpenXR-SDK.url "$srcdir/OpenXR-SDK"
  #git config submodule.external/OpenXR-Docs.url "$srcdir/OpenXR-Docs"
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

  # Remove .py file extension from files that are going to /usr/bin/
  for f in ${pkgdir}/usr/bin/*.py; do
    mv -v $f `echo $f | sed 's/\.py//'`
  done
}
