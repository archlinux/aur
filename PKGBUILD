# Maintainer: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=amdvlk-git
pkgver=v.2020.Q1.3.r2.bd57537
pkgrel=1
pkgdesc="AMD's standalone Vulkan driver"
arch=(x86_64)
url="https://github.com/GPUOpen-Drivers"
license=('MIT')
depends=('vulkan-icd-loader')
provides=('vulkan-amdvlk' 'vulkan-driver')
conflicts=('vulkan-amdvlk')
makedepends=('xorgproto' 'xorg-server-devel' 'libxrandr' 'cmake' 'python' 'libxml2' 'wayland' 'libdrm' 'git' 'ninja' 'repo')
source=()
sha512sums=()
            
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
  # fix building with commit f609020
  # sed -i "s/<drm/<libdrm/g" pal/src/core/os/lnx/display/displayWindowSystem.h
  # pushd "$srcdir/pal"
  # patch -p1 < ../0001-pal-clang.patch
  # popd
  # pushd "$srcdir/xgl"
  # patch -p1 < ../0002-xgl-clang.patch
  # popd

  # Don't turn Werror on for people will build with more recent compilers than you have. Just don't.
  for i in drivers/pal/shared/gpuopen/cmake/AMD.cmake #drivers/llpc/llpc/CMakeLists.txt
  do
    #sed -i "s/-Werror=unused-variable//g" "$srcdir"/$i
    #sed -i "s/-Werror=unused-function//g" "$srcdir"/$i
    sed -i "s/-Werror//g" "$srcdir"/$i
  done

  msg 'No patches to apply...'
}

build() {
  # /usr/lib/amdvlk64.so: undefined symbol: _ZN3Pal5Linux19DisplayWindowSystem30DeterminePresentationSupportedEPNS0_6DeviceEPvl
  # msg "Changing flags..."
  # msg2 "before: CFLAGS=$CFLAGS"
  export CFLAGS=${CFLAGS/-fno-plt}
  # msg2 "after: CFLAGS=$CFLAGS"
  # msg2 "before: CXXFLAGS=$CXXFLAGS"
  export CXXFLAGS="${CXXFLAGS/-fno-plt}"
  # msg2 "after: CXXFLAGS=${CXXFLAGS}"
  # msg2 "before: LDFLAGS=$LDFLAGS"
  export LDFLAGS=${LDFLAGS/,-z,now}
  # msg2 "after: LDFLAGS=${LDFLAGS}"
  # export CPPFLAGS="$CXXFLAGS"

  msg "building xgl..."
  pushd drivers/xgl > /dev/null
  cmake \
    -G Ninja \
    -H. \
    -B builds/Release64 \
    -DBUILD_WAYLAND_SUPPORT=On \
    -DCMAKE_BUILD_TYPE=Release
    -DBUILD_XLIB_XRANDR_SUPPORT=On \
    || true

  cd builds/Release64
  ninja
  msg "building xgl finished!"

  msg "building spvgen"
  pushd ../../../spvgen/external > /dev/null
  python2 fetch_external_sources.py
  popd > /dev/null
  ninja spvgen
  msg "building spvgen finished!"
  popd > /dev/null

  #msg "building spvgen"
  #pushd drivers/spvgen > /dev/null
  #cmake \
  #  -G Ninja \
  #  -B builds/Release64 \
  #  -DCMAKE_BUILD_TYPE=Release \
  #  .
  #cd builds/Release64
  #ninja
  #msg "building spvgen finished!"
}

package() {
  install -m755 -d "${pkgdir}"/usr/lib
  install -m755 -d "${pkgdir}"/usr/share/licenses/amdvlk-git
  install -m755 -d "${pkgdir}"/etc/amd

  install -D -t "$pkgdir/usr/lib" drivers/xgl/builds/Release64/icd/amdvlk64.so drivers/xgl/builds/Release64/spvgen/spvgen.so
  install -D -m644 -t "${pkgdir}/usr/share/vulkan/icd.d" drivers/AMDVLK/json/Redhat/amd_icd64.json
  install -D -m644 -t "${pkgdir}/usr/share/licenses/amdvlk-git" drivers/AMDVLK/LICENSE.txt

  sed -i "s/\/lib64/\/lib/g" "${pkgdir}"/usr/share/vulkan/icd.d/amd_icd64.json
}
