# $Id$
# Maintainer: Vi0L0 <vi0l093@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgbase=lib32-mesa-noglvnd
pkgname=('lib32-vulkan-intel-noglvnd' 'lib32-vulkan-radeon-noglvnd' 'lib32-libva-mesa-driver-noglvnd' 'lib32-mesa-vdpau-noglvnd' 'lib32-mesa-noglvnd' 'lib32-mesa-libgl-noglvnd')
pkgver=18.0.2
pkgrel=1
arch=('x86_64')
makedepends=('python2-mako' 'lib32-libxml2' 'lib32-expat' 'lib32-libx11' 'glproto' 'lib32-libdrm' 'dri2proto' 'dri3proto' 'presentproto'
             'lib32-libxshmfence' 'lib32-libxxf86vm' 'lib32-libxdamage' 'gcc-multilib' 'lib32-libelf' 'lib32-llvm' 'lib32-libvdpau'
             'lib32-wayland'
             'lib32-lm_sensors' 'wayland-protocols' 'lib32-libva' 'meson')
url="https://www.mesa3d.org/"
license=('custom')
source=(https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz{,.sig}
        LICENSE
        0001-glvnd-fix-gl-dot-pc.patch
        0004-meson-Add-library-versions-to-swr-drivers.patch
        0005-meson-Version-libMesaOpenCL-like-autotools-does.patch)
sha512sums=('77d24d01c4c22596d28421aeb74932ff232730a4f556ae1a2e8777ece2876e4e352679575385c065505df4a2a83d2c1cf30db92dcf88038417e36a2768332d7e'
            'SKIP'
            'f9f0d0ccf166fe6cb684478b6f1e1ab1f2850431c06aa041738563eb1808a004e52cdec823c103c9e180f03ffc083e95974d291353f0220fe52ae6d4897fecc7'
            '75849eca72ca9d01c648d5ea4f6371f1b8737ca35b14be179e14c73cc51dca0739c333343cdc228a6d464135f4791bcdc21734e2debecd29d57023c8c088b028'
            '0f5da6e48885713c7ddef9e5715e178e0a499bcb622d7f19e15b9e4b4647331d7bf14829218b6ab80f17bae90fd95b8df6a0a81203d8081686805ca5329531ff'
            'd3c01f61a0a0cc2f01e66e0126ad8b6386d4a53c1dc1b3b134800e4cd25507e458bac860cbed10cf4b46b04e8d50aba233870587b89c058fffd57436b48289bf')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D'  # Emil Velikov <emil.l.velikov@gmail.com>
              '946D09B5E4C9845E63075FF1D961C596A7203456'  # Andres Gomez <tanty@igalia.com>
              'E3E8F480C52ADD73B278EE78E1ECBE07D7D70895') # Juan Antonio Suárez Romero (Igalia, S.L.) <jasuarez@igalia.com>"

prepare() {
  cd mesa-${pkgver}

  # glvnd support patches - from Fedora
  # non-upstreamed ones
  patch -Np1 -i ../0001-glvnd-fix-gl-dot-pc.patch

  # Upstreamed meson fixes
  patch -Np1 -i ../0004-meson-Add-library-versions-to-swr-drivers.patch
  patch -Np1 -i ../0005-meson-Version-libMesaOpenCL-like-autotools-does.patch
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export LLVM_CONFIG="/usr/bin/llvm-config32"
  
  arch-meson mesa-$pkgver build \
    --libdir=/usr/lib32 \
    -D b_lto=false \
    -D b_ndebug=true \
    -D platforms=x11,wayland,drm,surfaceless \
    -D dri-drivers=i915,i965,r100,r200,nouveau \
    -D gallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,swrast,swr \
    -D vulkan-drivers=amd,intel \
    -D swr-arches=avx,avx2 \
    -D dri3=true \
    -D egl=true \
    -D gallium-extra-hud=true \
    -D gallium-nine=true \
    -D gallium-omx=false \
    -D gallium-opencl=disabled \
    -D gallium-va=true \
    -D gallium-vdpau=true \
    -D gallium-xa=true \
    -D gallium-xvmc=false \
    -D gbm=true \
    -D gles1=true \
    -D gles2=true \
    -D glvnd=false \
    -D glx=dri \
    -D libunwind=false \
    -D llvm=true \
    -D lmsensors=true \
    -D osmesa=gallium \
    -D shared-glapi=true \
    -D texture-float=true \
    -D valgrind=false

  # Print config
  meson configure build

  ninja -C build

  # fake installation to be seperated into packages
  # outside of fakeroot but mesa doesn't need to chown/mod
  DESTDIR="${srcdir}/fakeinstall" ninja -C build install
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

package_lib32-vulkan-intel-noglvnd() {
  pkgdesc="Intel's Vulkan mesa driver (32-bit) - non-libglvnd version"
  depends=('lib32-wayland' 'lib32-libx11' 'lib32-gcc-libs' 'lib32-libxshmfence')
  provides=('lib32-vulkan-driver' 'lib32-vulkan-intel')
  conflicts=('lib32-vulkan-intel' 'lib32-vulkan-intel-git')
  replaces=('lib32-vulkan-intel' 'lib32-vulkan-intel-git')

  _install fakeinstall/usr/share/vulkan/icd.d/intel_icd*.json
  _install fakeinstall/usr/lib32/libvulkan_intel.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-vulkan-radeon-noglvnd() {
  pkgdesc="Radeon's Vulkan mesa driver (32-bit) - non-libglvnd version"
  depends=('lib32-wayland' 'lib32-libx11' 'lib32-llvm-libs' 'lib32-libdrm' 'lib32-libelf' 'lib32-libxshmfence')
  provides=('lib32-vulkan-driver' 'lib32-vulkan-radeon')
  conflicts=('lib32-vulkan-radeon' 'lib32-vulkan-radeon-git')
  replaces=('lib32-vulkan-radeon' 'lib32-vulkan-radeon-git')

  _install fakeinstall/usr/share/vulkan/icd.d/radeon_icd*.json
  _install fakeinstall/usr/lib32/libvulkan_radeon.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-libva-mesa-driver-noglvnd() {
  pkgdesc="VA-API implementation for gallium (32-bit) - non-libglvnd version"
  depends=('lib32-libdrm' 'lib32-libx11' 'lib32-expat' 'lib32-llvm-libs' 'lib32-libelf' 'lib32-libxshmfence')
  provides=('lib32-libva-mesa-driver')
  conflicts=('lib32-libva-mesa-driver' 'lib32-libva-mesa-driver-git')
  replaces=('lib32-libva-mesa-driver' 'lib32-libva-mesa-driver-git')

  _install fakeinstall/usr/lib32/dri/*_drv_video.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-mesa-vdpau-noglvnd() {
  pkgdesc="Mesa VDPAU drivers (32-bit) - non-libglvnd version"
  depends=('lib32-libdrm' 'lib32-libx11' 'lib32-expat' 'lib32-llvm-libs' 'lib32-libelf' 'lib32-libxshmfence')
  provides=('lib32-mesa-vdpau')
  conflicts=('lib32-mesa-vdpau')
  replaces=('lib32-mesa-vdpau')

  _install fakeinstall/usr/lib32/vdpau

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-mesa-noglvnd() {
  pkgdesc="an open-source implementation of the OpenGL specification (32-bit) - non-libglvnd version"
  depends=('lib32-libdrm' 'lib32-libxxf86vm' 'lib32-libxdamage' 'lib32-libxshmfence' 'lib32-lm_sensors'
           'lib32-libelf' 'lib32-llvm-libs' 'lib32-wayland' 'lib32-libtxc_dxtn' 'mesa')
  optdepends=('opengl-man-pages: for the OpenGL API man pages'
              'lib32-mesa-vdpau-noglvnd: for accelerated video playback')
  provides=('lib32-ati-dri' 'lib32-intel-dri' 'lib32-nouveau-dri' 'lib32-mesa-dri' 'lib32-opengl-driver' 'lib32-mesa')
  conflicts=('lib32-ati-dri' 'lib32-intel-dri' 'lib32-nouveau-dri' 'lib32-mesa-dri' 'lib32-mesa' 'lib32-mesa-git')
  replaces=('lib32-ati-dri' 'lib32-intel-dri' 'lib32-nouveau-dri' 'lib32-mesa-dri' 'lib32-mesa' 'lib32-mesa-git')

  # ati-dri, nouveau-dri, intel-dri, svga-dri, swrast
  _install fakeinstall/usr/lib32/dri/*_dri.so

  _install fakeinstall/usr/lib32/d3d
  _install fakeinstall/usr/lib32/lib{gbm,glapi}.so*
  _install fakeinstall/usr/lib32/libOSMesa.so*
  _install fakeinstall/usr/lib32/libwayland*.so*
  _install fakeinstall/usr/lib32/libxatracker.so*
  _install fakeinstall/usr/lib32/libswrAVX*.so*

#   # in libglvnd
#   rm -v fakeinstall/usr/lib32/libGLESv{1_CM,2}.so*

  install -m755 -d ${pkgdir}/usr/lib32/mesa
  # move libgl/EGL/glesv*.so to not conflict with blobs - may break .pc files ?
  mv -v ${srcdir}/fakeinstall/usr/lib32/libGL.so*    ${pkgdir}/usr/lib32/mesa/
  mv -v ${srcdir}/fakeinstall/usr/lib32/libEGL.so*   ${pkgdir}/usr/lib32/mesa/
  mv -v ${srcdir}/fakeinstall/usr/lib32/libGLES*.so* ${pkgdir}/usr/lib32/mesa/

  _install fakeinstall/usr/lib32/pkgconfig

#   # libglvnd support
#   _install fakeinstall/usr/lib32/libGLX_mesa.so*
#   _install fakeinstall/usr/lib32/libEGL_mesa.so*

#   # indirect rendering
#   ln -s /usr/lib32/libGLX_mesa.so.0 "${pkgdir}/usr/lib32/libGLX_indirect.so.0"
# 
#   rm -rv fakeinstall/etc
#   rm -rv fakeinstall/usr/include
#   rm -rv fakeinstall/usr/share

#   # make sure there are no files left to install
#   find fakeinstall -depth -print0 | xargs -0 rmdir

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-mesa-libgl-noglvnd() {
  pkgdesc="Mesa 3-D graphics library (32-bit) - non-libglvnd version"
  depends=('lib32-mesa')
  provides=('lib32-libgl' 'lib32-libegl' 'lib32-libgles' 'lib32-mesa-libgl')
  conflicts=('lib32-mesa-libgl' 'lib32-mesa-libgl-git' 'lib32-libglvnd')
  replaces=('lib32-mesa-libgl' 'lib32-mesa-libgl-git')

  install -m755 -d ${pkgdir}/usr/lib32

  ln -s /usr/lib32/mesa/libGL.so.1.2.0 ${pkgdir}/usr/lib32/libGL.so.1.2.0
  ln -s libGL.so.1.2.0	               ${pkgdir}/usr/lib32/libGL.so.1
  ln -s libGL.so.1.2.0                 ${pkgdir}/usr/lib32/libGL.so

  ln -s /usr/lib32/mesa/libEGL.so.1.0.0 ${pkgdir}/usr/lib32/libEGL.so.1.0.0
  ln -s libEGL.so.1.0.0	                ${pkgdir}/usr/lib32/libEGL.so.1
  ln -s libEGL.so.1.0.0                 ${pkgdir}/usr/lib32/libEGL.so

  ln -s /usr/lib32/mesa/libGLESv1_CM.so.1.1.0 ${pkgdir}/usr/lib32/libGLESv1_CM.so.1.1.0
  ln -s libGLESv1_CM.so.1.1.0	              ${pkgdir}/usr/lib32/libGLESv1_CM.so.1
  ln -s libGLESv1_CM.so.1.1.0                 ${pkgdir}/usr/lib32/libGLESv1_CM.so

  ln -s /usr/lib32/mesa/libGLESv2.so.2.0.0 ${pkgdir}/usr/lib32/libGLESv2.so.2.0.0
  ln -s libGLESv2.so.2.0.0                 ${pkgdir}/usr/lib32/libGLESv2.so.2
  ln -s libGLESv2.so.2.0.0                 ${pkgdir}/usr/lib32/libGLESv2.so


  install -m755 -d "${pkgdir}/usr/share/licenses/lib32-mesa-libgl"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/lib32-mesa-libgl/"
}
