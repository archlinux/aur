# Maintainer: Marijn Suijten <marijns95@gmail.com>
# Contributor: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=amdvlk-git
pkgver=2023.Q2.2.r0.ff6b9ba
pkgrel=1
pkgdesc="AMD's standalone Vulkan driver"
arch=(x86_64)
url="https://github.com/GPUOpen-Drivers"
license=('MIT')
depends=('vulkan-icd-loader')
provides=('vulkan-amdvlk' 'amdvlk' 'vulkan-driver')
conflicts=('vulkan-amdvlk' 'amdvlk')
makedepends=('xorgproto' 'xorg-server-devel' 'libxrandr' 'cmake' 'python' 'libxml2' 'wayland' 'libdrm' 'git' 'ninja' 'repo' 'directx-shader-compiler')
source=('0001-rdf-Include-cstdint-header-explicitly-for-std-int64_.patch')
sha256sums=('0943859eeab66bf24598cfba99e07d839bb018360e93ffb8b5c94b45ab36d389')

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

  msg 'Applying https://github.com/GPUOpen-Drivers/pal/pull/94'
  git -C drivers/pal am "$srcdir/0001-rdf-Include-cstdint-header-explicitly-for-std-int64_.patch"
}

build() {
  export CFLAGS="${CFLAGS/-fno-plt}"
  export CXXFLAGS="${CXXFLAGS/-fno-plt}"
  export LDFLAGS="${LDFLAGS/,-z,now}"

  msg "building xgl..."
  cmake \
    -G Ninja \
    -S drivers/xgl \
    -B builds/Release64 \
    -DBUILD_WAYLAND_SUPPORT=On \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_XLIB_XRANDR_SUPPORT=On

  cmake --build builds/Release64
  msg "building xgl finished!"
}

package() {
  install -m755 -d "${pkgdir}"/usr/lib
  install -m755 -d "${pkgdir}"/usr/share/licenses/amdvlk-git
  install -m755 -d "${pkgdir}"/etc/amd

  install -D -t "$pkgdir/usr/lib" builds/Release64/icd/amdvlk64.so
  install -D -m644 -t "${pkgdir}/usr/share/vulkan/icd.d" builds/Release64/icd/amd_icd64.json
  install -D -m644 -t "${pkgdir}/usr/share/licenses/amdvlk-git" drivers/xgl/LICENSE.txt
}
