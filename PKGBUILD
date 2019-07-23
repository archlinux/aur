# Maintainer: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=lib32-amdvlk-git
pkgver=v.2019.Q3.2.r0.4f7b640
pkgrel=1
pkgdesc="AMD's standalone Vulkan driver (32-bit version)"
arch=(x86_64)
url="https://github.com/GPUOpen-Drivers"
license=('MIT')
depends=('lib32-vulkan-icd-loader')
provides=('lib32-vulkan-amdvlk' 'lib32-vulkan-driver')
conflicts=('lib32-vulkan-amdvlk')
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

  # Don't turn Werror on for people will build with more recent compilers than you have. Just don't.
  for i in drivers/xgl/icd/CMakeLists.txt drivers/llpc/CMakeLists.txt drivers/llpc/imported/metrohash/CMakeLists.txt drivers/llvm/utils/benchmark/CMakeLists.txt drivers/llvm/utils/benchmark/test/CMakeLists.txt drivers/pal/src/core/imported/addrlib/CMakeLists.txt drivers/pal/src/core/imported/vam/CMakeLists.txt drivers/pal/shared/gpuopen/cmake/AMD.cmake
  do
    sed -i "s/-Werror//g" "$srcdir"/$i
  done

  msg 'No patches to apply...'
}

build() {
  # /usr/lib/amdvlk64.so: undefined symbol: _ZN3Pal5Linux19DisplayWindowSystem30DeterminePresentationSupportedEPNS0_6DeviceEPvl
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS="${CXXFLAGS/-fno-plt}"
  export LDFLAGS=${LDFLAGS/,-z,now}
  export CPPFLAGS="$CXXFLAGS"

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  msg "building xgl..."
  pushd drivers/xgl > /dev/null
  cmake \
    -G Ninja \
    -H. \
    -B builds/Release32 \
    -DCMAKE_C_FLAGS=-m32 \
    -DCMAKE_CXX_FLAGS=-m32 \
    -DLLVM_TARGET_ARCH:STRING=i686 \
    -DLLVM_DEFAULT_TARGET_TRIPLE="i686-pc-linux-gnu" \
    -DBUILD_WAYLAND_SUPPORT=On \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_XLIB_XRANDR_SUPPORT=On

  cd builds/Release32
  ninja
  msg "building xgl finished!"
  popd > /dev/null

  #msg "building spvgen"
  #pushd drivers/spvgen > /dev/null
  #cmake \
  #  -G Ninja \
  #  -B builds/Release32 \
  #  -DCMAKE_BUILD_TYPE=Release \
  #  .
  #cd builds/Release32
  #ninja
  #msg "building spvgen finished!"
}

package() {
  install -D -t "$pkgdir/usr/lib32" drivers/xgl/builds/Release32/icd/amdvlk32.so
  install -D -m644 -t "${pkgdir}/usr/share/vulkan/icd.d" drivers/AMDVLK/json/Redhat/amd_icd32.json
  install -D -m644 -t "${pkgdir}/usr/share/licenses/$pkgname" drivers/AMDVLK/LICENSE.txt

  sed -i "s/\/lib/\/lib32/g" "${pkgdir}"/usr/share/vulkan/icd.d/amd_icd32.json
}
