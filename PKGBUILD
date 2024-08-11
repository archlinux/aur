# Maintainer: Marijn Suijten <marijns95@gmail.com>
# Contributor: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=(
  amdvlk-git
  lib32-amdvlk-git
)
pkgver=2024.Q2.3.r0.10c37d4
pkgrel=1
pkgdesc="AMD's standalone Vulkan driver"
arch=(x86_64)
url="https://github.com/GPUOpen-Drivers"
license=('MIT')
makedepends=('xorgproto' 'xorg-server-devel' 'libxrandr' 'cmake' 'python' 'libxml2' 'wayland' 'libdrm' 'git' 'ninja' 'repo' 'directx-shader-compiler' 'python-jinja' 'python-ruamel-yaml')
source=()
sha256sums=()
# Don't emit a debug package: we already build a Release build without debug
# symbols so it would be next to empty.
options=(!debug)

pkgver() {
  pushd .repo/manifests/ > /dev/null
  printf "%s" "$(git describe --long | sed 's/^v-//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir"
  repo init -u 'https://github.com/GPUOpen-Drivers/AMDVLK.git' -b master
  repo sync

  # Don't turn Werror on for people will build with more recent compilers than you have.
  for i in drivers/pal/shared/devdriver/cmake/DevDriver.cmake drivers/xgl/cmake/XglCompilerOptions.cmake
  do
    sed -i "s/-Werror//g" "$srcdir"/$i
  done
}

build() {
  build_xgl() {
    bitness=$1
    shift

    cmake \
      -G Ninja \
      -S drivers/xgl \
      -B builds/Release$bitness \
      -DBUILD_WAYLAND_SUPPORT=On \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_XLIB_XRANDR_SUPPORT=On \
      "$@"

    cmake --build builds/Release$bitness
  }

  msg "building 64-bit xgl..."
  build_xgl 64
  msg "building xgl for 64-bit finished!"

  msg "building 32-bit xgl..."
  build_xgl 32 \
    -DCMAKE_C_FLAGS=-m32 \
    -DCMAKE_CXX_FLAGS=-m32 \
    -DLLVM_TARGET_ARCH:STRING=i686 \
    -DLLVM_DEFAULT_TARGET_TRIPLE="i686-pc-linux-gnu"
  msg "building xgl for 32-bit finished!"
}

package_amdvlk-git() {
  depends=('glibc' 'gcc-libs' 'zlib' 'zstd')
  provides=('vulkan-amdvlk' 'amdvlk' 'vulkan-driver')
  conflicts=('vulkan-amdvlk' 'amdvlk')

  install -m755 -d "${pkgdir}"/usr/lib
  install -m755 -d "${pkgdir}"/usr/share/vulkan/icd.d
  install -m755 -d "${pkgdir}"/usr/share/vulkan/implicit_layer.d
  install -m755 -d "${pkgdir}"/usr/share/licenses/${pkgname}

  install builds/Release64/icd/amdvlk64.so "${pkgdir}"/usr/lib/
  install builds/Release64/icd/amd_icd64.json "${pkgdir}"/usr/share/vulkan/icd.d/
  install builds/Release64/icd/amd_icd64.json "${pkgdir}"/usr/share/vulkan/implicit_layer.d/
  install drivers/xgl/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/
}

package_lib32-amdvlk-git() {
  depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-zlib' 'lib32-zstd')
  provides=('lib32-vulkan-amdvlk' 'lib32-amdvlk' 'lib32-vulkan-driver')
  conflicts=('lib32-vulkan-amdvlk' 'lib32-amdvlk')

  install -m755 -d "${pkgdir}"/usr/lib32
  install -m755 -d "${pkgdir}"/usr/share/vulkan/icd.d
  install -m755 -d "${pkgdir}"/usr/share/vulkan/implicit_layer.d
  install -m755 -d "${pkgdir}"/usr/share/licenses/${pkgname}

  install builds/Release32/icd/amdvlk32.so "${pkgdir}"/usr/lib32/
  install builds/Release32/icd/amd_icd32.json "${pkgdir}"/usr/share/vulkan/icd.d/
  install builds/Release32/icd/amd_icd32.json "${pkgdir}"/usr/share/vulkan/implicit_layer.d/
  install drivers/xgl/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/

  sed -i "s/\/lib/\/lib32/g" "${pkgdir}"/usr/share/vulkan/icd.d/amd_icd32.json
  sed -i "s/\/lib/\/lib32/g" "${pkgdir}"/usr/share/vulkan/implicit_layer.d/amd_icd32.json
}
