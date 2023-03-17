# Maintainer: Luke Short <ekultails at gmail dot com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgbase=lib32-mesa-steamos
pkgname=('lib32-vulkan-mesa-layers-steamos' 'lib32-opencl-mesa-steamos' 'lib32-vulkan-intel-steamos' 'lib32-vulkan-radeon-steamos' 'lib32-vulkan-swrast-steamos' 'lib32-libva-mesa-driver-steamos' 'lib32-mesa-vdpau-steamos' 'lib32-mesa-steamos')
pkgdesc="An open-source implementation of the OpenGL specification (32-bit)"
_tag=radeonsi-3.4.0-2
pkgver=22.2.0.157821.radeonsi_3.4.0_2
pkgrel=1
arch=('x86_64')
makedepends=('git' 'python-mako' 'lib32-libxml2' 'lib32-expat' 'lib32-libx11' 'xorgproto' 'lib32-libdrm'
             'lib32-libxshmfence' 'lib32-libxxf86vm' 'lib32-libxdamage' 'lib32-libvdpau'
             'lib32-libva' 'lib32-wayland' 'wayland-protocols' 'lib32-zstd' 'lib32-libelf'
             'lib32-llvm' 'libclc' 'clang' 'lib32-clang' 'lib32-libglvnd' 'lib32-libunwind'
             'lib32-lm_sensors' 'lib32-libxrandr' 'lib32-vulkan-icd-loader' 'glslang' 'cmake' 'meson')
url="https://www.mesa3d.org/"
license=('custom')
source=("steamos-jupiter-mesa::git+https://github.com/LukeShortCloud/steamos-jupiter-mesa.git#tag=$_tag"
        LICENSE)
sha512sums=('SKIP'
            'f9f0d0ccf166fe6cb684478b6f1e1ab1f2850431c06aa041738563eb1808a004e52cdec823c103c9e180f03ffc083e95974d291353f0220fe52ae6d4897fecc7')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D'  # Emil Velikov <emil.l.velikov@gmail.com>
              '946D09B5E4C9845E63075FF1D961C596A7203456'  # Andres Gomez <tanty@igalia.com>
              'E3E8F480C52ADD73B278EE78E1ECBE07D7D70895'  # Juan Antonio Suárez Romero (Igalia, S.L.) <jasuarez@igalia.com>
              'A5CC9FEC93F2F837CB044912336909B6B25FADFA'  # Juan A. Suarez Romero <jasuarez@igalia.com>
              '71C4B75620BC75708B4BDB254C95FAAB3EB073EC'  # Dylan Baker <dylan@pnwbakers.com>
              '57551DE15B968F6341C248F68D8E31AFC32428A6') # Eric Engestrom <eric@engestrom.ch>

pkgver() {
  cd steamos-jupiter-mesa

  _ver=$(cat VERSION)
  #echo ${_ver/-/_}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  echo "${_ver/-/_}.$(git rev-list --count HEAD).${_tag//-/_}"
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"
  cat >crossfile.ini <<END
[binaries]
llvm-config = '/usr/bin/llvm-config32'
END

  arch-meson steamos-jupiter-mesa build \
    --native-file crossfile.ini \
    --libdir=/usr/lib32 \
    -D b_lto=true \
    -D b_ndebug=true \
    -D platforms=x11,wayland \
    -D gallium-drivers=r300,r600,radeonsi,nouveau,svga,swrast,virgl,iris,zink,crocus \
    -D vulkan-drivers=amd,intel,swrast \
    -D vulkan-layers=device-select,intel-nullhw,overlay \
    -D dri3=enabled \
    -D egl=enabled \
    -D gallium-extra-hud=true \
    -D gallium-nine=true \
    -D gallium-opencl=icd \
    -D gallium-va=enabled \
    -D gallium-vdpau=enabled \
    -D gallium-xa=enabled \
    -D gallium-xvmc=disabled \
    -D gbm=enabled \
    -D gles1=disabled \
    -D gles2=enabled \
    -D glvnd=true \
    -D glx=dri \
    -D libunwind=enabled \
    -D llvm=enabled \
    -D lmsensors=enabled \
    -D osmesa=true \
    -D shared-glapi=enabled \
    -D microsoft-clc=disabled \
    -D valgrind=disabled

  # Print config
  meson configure build

  ninja -C build
  meson compile -C build

  # fake installation to be seperated into packages
  # outside of fakeroot but mesa doesn't need to chown/mod
  DESTDIR="${srcdir}/fakeinstall" meson install -C build
}

_install() {
  local src f dir
  for src; do
    f="${src#fakeinstall/}"
    dir="${pkgdir}/${f%/*}"
    install -m755 -d "${dir}"
    mv -v "${src}" "${dir}/"
  done
}

package_lib32-vulkan-mesa-layers-steamos() {
  pkgdesc="Mesa's Vulkan layers (32-bit)"
  depends=('lib32-libdrm' 'lib32-libxcb' 'lib32-wayland' 'vulkan-mesa-layers' 'python')
  conflicts=('lib32-vulkan-mesa-layer')
  provides=('lib32-vulkan-mesa-layer' 'lib32-vulkan-mesa-layers')

  rm -rv fakeinstall/usr/share/vulkan/explicit_layer.d
  rm -rv fakeinstall/usr/share/vulkan/implicit_layer.d
  rm -rv fakeinstall/usr/bin/mesa-overlay-control.py

  _install fakeinstall/usr/lib32/libVkLayer_*.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-opencl-mesa-steamos() {
  pkgdesc="OpenCL support for AMD/ATI Radeon mesa drivers (32-bit)"
  depends=('lib32-expat' 'lib32-libdrm' 'lib32-libelf' 'lib32-clang' 'lib32-zstd' 'opencl-mesa')
  optdepends=('opencl-headers: headers necessary for OpenCL development')
  provides=('lib32-opencl-driver' 'lib32-opencl-mesa')

  rm -rv fakeinstall/etc/OpenCL
  _install fakeinstall/usr/lib32/lib*OpenCL*
  _install fakeinstall/usr/lib32/gallium-pipe

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-vulkan-intel-steamos() {
  pkgdesc="Intel's Vulkan mesa driver (32-bit)"
  depends=('lib32-wayland' 'lib32-libx11' 'lib32-libxshmfence' 'lib32-libdrm' 'lib32-zstd')
  optdepends=('lib32-vulkan-mesa-layers: additional vulkan layers')
  conflicts=('lib32-vulkan-intel')
  provides=('lib32-vulkan-driver' 'lib32-vulkan-intel')

  _install fakeinstall/usr/share/vulkan/icd.d/intel_icd*.json
  _install fakeinstall/usr/lib32/libvulkan_intel.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-vulkan-radeon-steamos() {
  pkgdesc="Radeon's Vulkan mesa driver (32-bit)"
  depends=('lib32-wayland' 'lib32-libx11' 'lib32-libxshmfence' 'lib32-libelf' 'lib32-libdrm'
	   'lib32-zstd' 'lib32-llvm-libs')
  optdepends=('lib32-vulkan-mesa-layers: additional vulkan layers')
  conflicts=('lib32-vulkan-radeon')
  provides=('lib32-vulkan-driver' 'lib32-vulkan-radeon')

  _install fakeinstall/usr/share/vulkan/icd.d/radeon_icd*.json
  _install fakeinstall/usr/lib32/libvulkan_radeon.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-vulkan-swrast-steamos() {
  pkgdesc="Vulkan software rasteriser driver (32-bit)"
  depends=('lib32-wayland' 'lib32-libx11' 'lib32-libxshmfence' 'lib32-libdrm' 'lib32-zstd'
	   'lib32-llvm-libs')
  optdepends=('lib32-vulkan-mesa-layers: additional vulkan layers')
  conflicts=('lib32-vulkan-swrast')
  provides=('lib32-vulkan-driver' 'lib32-vulkan-swrast')

  _install fakeinstall/usr/share/vulkan/icd.d/lvp_icd*.json
  _install fakeinstall/usr/lib32/libvulkan_lvp.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-libva-mesa-driver-steamos() {
  pkgdesc="VA-API implementation for gallium (32-bit)"
  depends=('lib32-libdrm' 'lib32-libx11' 'lib32-llvm-libs' 'lib32-expat' 'lib32-libelf'
           'lib32-libxshmfence' 'lib32-zstd')
  provides=('lib32-libva-mesa')

  _install fakeinstall/usr/lib32/dri/*_drv_video.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-mesa-vdpau-steamos() {
  pkgdesc="Mesa VDPAU drivers (32-bit)"
  depends=('lib32-libdrm' 'lib32-libx11' 'lib32-llvm-libs' 'lib32-expat' 'lib32-libelf'
           'lib32-libxshmfence' 'lib32-zstd')
  provides=('lib32-mesa-vdpau')

  _install fakeinstall/usr/lib32/vdpau

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-mesa-steamos() {
  depends=('lib32-libdrm' 'lib32-wayland' 'lib32-libxxf86vm' 'lib32-libxdamage' 'lib32-libxshmfence'
           'lib32-libelf' 'lib32-libunwind' 'lib32-llvm-libs' 'lib32-lm_sensors' 'lib32-libglvnd'
           'lib32-zstd' 'lib32-vulkan-icd-loader' 'mesa-steamos')
  depends+=('libsensors.so')
  optdepends=('opengl-man-pages: for the OpenGL API man pages'
              'lib32-mesa-vdpau: for accelerated video playback'
              'lib32-libva-mesa-driver: for accelerated video playback')
  provides=('lib32-mesa-libgl' 'lib32-opengl-driver' 'lib32-mesa')
  conflicts=('lib32-mesa-libgl' 'lib32-mesa')

  rm -rv fakeinstall/usr/share/drirc.d/00-mesa-defaults.conf
  rm -rv fakeinstall/usr/share/drirc.d/00-radv-defaults.conf
  rm -rv fakeinstall/usr/share/glvnd/egl_vendor.d/50_mesa.json

  # ati-dri, nouveau-dri, intel-dri, svga-dri, swrast, swr
  _install fakeinstall/usr/lib32/dri/*_dri.so

  _install fakeinstall/usr/lib32/d3d
  _install fakeinstall/usr/lib32/lib{gbm,glapi}.so*
  _install fakeinstall/usr/lib32/libOSMesa.so*
  _install fakeinstall/usr/lib32/libxatracker.so*

  rm -rv fakeinstall/usr/include
  _install fakeinstall/usr/lib32/pkgconfig

  # libglvnd support
  _install fakeinstall/usr/lib32/libGLX_mesa.so*
  _install fakeinstall/usr/lib32/libEGL_mesa.so*

  # indirect rendering
  ln -s /usr/lib32/libGLX_mesa.so.0 "${pkgdir}/usr/lib32/libGLX_indirect.so.0"

  # make sure there are no files left to install
  find fakeinstall -depth -print0 | xargs -0 rmdir

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
