#_     _            _                                _____
#| |__ | | __ _  ___| | ___ __ ___   ___   ___  _ __ |___ /
#| '_ \| |/ _` |/ __| |/ / '_ ` _ \ / _ \ / _ \| '_ \  |_ \
#| |_) | | (_| | (__|   <| | | | | | (_) | (_) | | | |___) |
#|_.__/|_|\__,_|\___|_|\_\_| |_| |_|\___/ \___/|_| |_|____/

#Maintainer: blackmoon3 <https://github.com/blacksky3>
#Credits: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-vulkan-validation-layers-git
pkgdesc='Vulkan Validation Layers (32-bit) (git version)'
pkgver=1.3.254.r20.gcb9c77d
pkgrel=1
arch=(i686 x86_64)
url='https://github.com/KhronosGroup/Vulkan-ValidationLayers'
license=(Apache-2.0)
makedepends=(cmake python lib32-libx11 lib32-libxrandr lib32-wayland vulkan-headers-git git ninja make)
depends=(lib32-gcc-libs lib32-libx11 vulkan-headers-git lib32-vulkan-icd-loader-git)
conflicts=(lib32-vulkan-validation-layers)
provides=(lib32-vulkan-validation-layers lib32-vulkan-validation-layers-git libVkLayer_khronos_validation.so)
source=(git+https://github.com/KhronosGroup/Vulkan-ValidationLayers.git)
md5sums=(SKIP)

pkgver(){
  cd ${srcdir}/Vulkan-ValidationLayers

  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --tags --abbrev=7 --exclude sdk-* | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare(){
#export CC='gcc -m32'
#export CXX='g++ -m32'
#export ASFLAGS=--32
#export CFLAGS=-m32
#export CXXFLAGS=-m32
#export CFLAGS+=" -m32 -ffat-lto-objects"
#export CXXFLAGS+=" -m32 -ffat-lto-objects -Wno-error=restrict"
#export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
#
#  cd ${srcdir}/Vulkan-ValidationLayers
#
#  #rm -rf {glslang,Vulkan-Headers,SPIRV-Headers,SPIRV-Tools,robin-hood-hashing,googletest}
#
#  #sed -i s'/"commit": "release-1.8.1",/"commit": "release-1.11.0",/' scripts/known_good.json
#
#  ./scripts/update_deps.py --config release --arch 32
#}

build(){
export CC='gcc -m32'
export CXX='g++ -m32'
export ASFLAGS=--32
export CFLAGS=-m32
export CXXFLAGS=-m32
export CFLAGS+=" -m32 -ffat-lto-objects"
export CXXFLAGS+=" -m32 -ffat-lto-objects -Wno-error=restrict"
export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  cd ${srcdir}/Vulkan-ValidationLayers

  rm -rf build_32

  ./scripts/update_deps.py --config release --arch 32

  cmake -C helper.cmake -H. -G Ninja -Bbuild_32 \
  -DCMAKE_CXX_FLAGS=-m32 \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DVULKAN_HEADERS_INSTALL_DIR=/usr \
  -DCMAKE_INSTALL_LIBDIR=lib32 \
  -DCMAKE_INSTALL_SYSCONFDIR=/etc \
  -DCMAKE_INSTALL_DATADIR=/share \
  -DCMAKE_INSTALL_INCLUDEDIR="/usr/include/" \
  -DBUILD_LAYERS=ON \
  -DBUILD_LAYER_SUPPORT_FILES=ON \
  -DCMAKE_SKIP_RPATH=True \
  -DBUILD_TESTS=OFF \
  -DBUILD_WSI_XCB_SUPPORT=On \
  -DBUILD_WSI_XLIB_SUPPORT=On \
  -DBUILD_WSI_WAYLAND_SUPPORT=On \
  -DCMAKE_BUILD_TYPE=Release \
  -DUSE_ROBIN_HOOD_HASHING=OFF

  ninja -C build_32
}

package(){
  DESTDIR="$pkgdir" ninja -C ${srcdir}/Vulkan-ValidationLayers/build_32/ install

  rm -rf "${pkgdir}"/usr/{include,share}

  # install licence
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/Vulkan-ValidationLayers/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim:set ts=8 sts=2 sw=2 et:
