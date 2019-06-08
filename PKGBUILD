# Maintainer: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=amdvlk-git
pkgver=v.2019.Q2.5.r0.193a788
pkgrel=1
pkgdesc="AMD's standalone Vulkan driver"
arch=(x86_64)
url="https://github.com/GPUOpen-Drivers"
license=('MIT')
depends=('vulkan-icd-loader')
provides=('vulkan-amdvlk' 'vulkan-driver')
conflicts=('vulkan-amdvlk')
makedepends=('dri2proto' 'xorg-server-devel' 'libxrandr' 'cmake' 'python' 'libxml2' 'wayland' 'libdrm' 'git' 'ninja' 'repo')
source=('git+https://github.com/GPUOpen-Drivers/wsa.git#branch=master')
sha512sums=('SKIP')
            
pkgver() {
  pushd drivers/AMDVLK > /dev/null
  AMDVLK_VER=$(printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')")
  popd > /dev/null
  if [ -z "$AMDVLK_VER" ]; then
    pushd drivers/xgl > /dev/null
    XGL_VER=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
    popd > /dev/null
  else
    XGL_VER=$AMDVLK_VER
  fi
  #PAL_VER=$(cd pal; printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  echo "$XGL_VER"
}

prepare() {
  cd "$srcdir"
  repo init -u 'https://github.com/GPUOpen-Drivers/AMDVLK.git' -b master
  repo sync
  if [ ! -e ./drivers/wsa ]; then
    ln -rs ./wsa ./drivers/wsa
  fi
  # fix building with commit f609020
  # sed -i "s/<drm/<libdrm/g" pal/src/core/os/lnx/display/displayWindowSystem.h
  # pushd "$srcdir/pal"
  # patch -p1 < ../0001-pal-clang.patch
  # popd
  # pushd "$srcdir/xgl"
  # patch -p1 < ../0002-xgl-clang.patch
  # popd

  msg 'No patches to apply...'
}

build() {
  # /usr/lib/amdvlk64.so: undefined symbol: _ZN3Pal5Linux19DisplayWindowSystem30DeterminePresentationSupportedEPNS0_6DeviceEPvl
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  msg "building xgl..."
  cd drivers/xgl
  cmake -G Ninja -H. -Bbuilds/Release64 \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DBUILD_WAYLAND_SUPPORT=On \
	  -DBUILD_WSA=On

  cd builds/Release64
  ninja
  msg "building xgl finished!"
}

package() {
  install -m755 -d "${pkgdir}"/usr/lib
  install -m755 -d "${pkgdir}"/usr/share/licenses/amdvlk-git
  install -m755 -d "${pkgdir}"/etc/amd

  install drivers/xgl/builds/Release64/icd/amdvlk64.so "${pkgdir}"/usr/lib/
  install -D -m644 -t "${pkgdir}/usr/share/vulkan/icd.d" drivers/AMDVLK/json/Redhat/amd_icd64.json
  install -D -m644 -t "${pkgdir}/usr/share/licenses/amdvlk-git" drivers/AMDVLK/LICENSE.txt

  sed -i "s/\/lib64/\/lib/g" "${pkgdir}"/usr/share/vulkan/icd.d/amd_icd64.json
}
