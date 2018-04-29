# $Id$
# Maintainer: Vi0L0 <vi0l093@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgbase=mesa-noglvnd
pkgname=('opencl-mesa-noglvnd' 'vulkan-intel-noglvnd' 'vulkan-radeon-noglvnd' 'libva-mesa-driver-noglvnd' 'mesa-vdpau-noglvnd' 'mesa-noglvnd' 'mesa-libgl-noglvnd')
pkgver=18.0.2
pkgrel=1
arch=('x86_64')
makedepends=('python2-mako' 'libxml2' 'libx11' 'glproto' 'libdrm' 'dri2proto' 'dri3proto' 'presentproto' 
             'libxshmfence' 'libxxf86vm' 'libxdamage' 'libvdpau' 'libva' 'wayland' 'elfutils' 'llvm'
             'libomxil-bellagio' 'libclc' 'clang' 'libunwind' 'lm_sensors' 'meson') # 'libglvnd')
url="https://www.mesa3d.org/"
license=('custom')
source=(https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz{,.sig}
        LICENSE
        0002-glvnd-fix-gl-dot-pc.patch
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
  cd ${srcdir}/mesa-${pkgver}

  # glvnd support patches - from Fedora
  # non-upstreamed ones
  patch -Np1 -i ../0002-glvnd-fix-gl-dot-pc.patch

  # Upstreamed meson fixes
  patch -Np1 -i ../0004-meson-Add-library-versions-to-swr-drivers.patch
  patch -Np1 -i ../0005-meson-Version-libMesaOpenCL-like-autotools-does.patch
}

build() {
  arch-meson mesa-$pkgver build \
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
    -D gallium-omx=true \
    -D gallium-opencl=icd \
    -D gallium-va=true \
    -D gallium-vdpau=true \
    -D gallium-xa=true \
    -D gallium-xvmc=false \
    -D gbm=true \
    -D gles1=true \
    -D gles2=true \
    -D glvnd=false \
    -D glx=dri \
    -D libunwind=true \
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

package_opencl-mesa-noglvnd() {
  pkgdesc="OpenCL support for AMD/ATI Radeon mesa drivers - non-libglvnd version"
  depends=('expat' 'libdrm' 'libelf' 'libclc' 'clang')
  optdepends=('opencl-headers: headers necessary for OpenCL development')
  provides=('opencl-driver' 'opencl-mesa')
  conflicts=('opencl-mesa' 'opencl-mesa-git')
  replaces=('opencl-mesa' 'opencl-mesa-git')

  _install fakeinstall/etc/OpenCL
  _install fakeinstall/usr/lib/lib*OpenCL*
  _install fakeinstall/usr/lib/gallium-pipe

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_vulkan-intel-noglvnd() {
  pkgdesc="Intel's Vulkan mesa driver - non-libglvnd version"
  depends=('wayland' 'libx11' 'libxshmfence' 'libdrm')
  provides=('vulkan-driver' 'vulkan-intel')
  conflicts=('vulkan-intel' 'vulkan-intel-git')
  replaces=('vulkan-intel' 'vulkan-intel-git')

  _install fakeinstall/usr/share/vulkan/icd.d/intel_icd*.json
  _install fakeinstall/usr/lib/libvulkan_intel.so
  _install fakeinstall/usr/include/vulkan/vulkan_intel.h

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_vulkan-radeon-noglvnd() {
  pkgdesc="Radeon's Vulkan mesa driver - non-libglvnd version"
  depends=('wayland' 'libx11' 'libxshmfence' 'libelf' 'libdrm' 'llvm-libs')
  provides=('vulkan-driver' 'vulkan-radeon')
  conflicts=('vulkan-radeon' 'vulkan-radeon-git')
  replaces=('vulkan-radeon' 'vulkan-radeon-git')

  _install fakeinstall/usr/share/vulkan/icd.d/radeon_icd*.json
  _install fakeinstall/usr/lib/libvulkan_radeon.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_libva-mesa-driver-noglvnd() {
  pkgdesc="VA-API implementation for gallium - non-libglvnd version"
  depends=('libdrm' 'libx11' 'llvm-libs' 'expat' 'libelf' 'libxshmfence')
  provides=('libva-mesa-driver')
  conflicts=('libva-mesa-driver')
  replaces=('libva-mesa-driver')

  _install fakeinstall/usr/lib/dri/*_drv_video.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_mesa-vdpau-noglvnd() {
  pkgdesc="Mesa VDPAU drivers - non-libglvnd version"
  depends=('libdrm' 'libx11' 'llvm-libs' 'expat' 'libelf' 'libxshmfence')
  provides=('mesa-vdpau')
  conflicts=('mesa-vdpau')
  replaces=('mesa-vdpau')

  _install fakeinstall/usr/lib/vdpau

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_mesa-noglvnd() {
  pkgdesc="an open-source implementation of the OpenGL specification - non-libglvnd version"
  depends=('libdrm' 'wayland' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf' 
           'libomxil-bellagio' 'libunwind' 'llvm-libs' 'lm_sensors') #'libglvnd')
  optdepends=('opengl-man-pages: for the OpenGL API man pages'
              'mesa-vdpau-noglvnd: for accelerated video playback'
              'libva-mesa-driver-noglvnd: for accelerated video playback')
  provides=('ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri' 'mesa' 'opengl-driver') #'mesa-libgl')
  conflicts=('ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri' 'mesa' 'mesa-git') #'mesa-libgl')
  replaces=('ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri' 'mesa' 'mesa-git') #'mesa-libgl')
  backup=('etc/drirc')

  _install fakeinstall/etc/drirc
#   _install fakeinstall/usr/share/glvnd/egl_vendor.d/50_mesa.json

  # ati-dri, nouveau-dri, intel-dri, svga-dri, swrast
  _install fakeinstall/usr/lib/dri/*_dri.so

  _install fakeinstall/usr/lib/bellagio
  _install fakeinstall/usr/lib/d3d
  _install fakeinstall/usr/lib/lib{gbm,glapi}.so*
  _install fakeinstall/usr/lib/libOSMesa.so*
  _install fakeinstall/usr/lib/libwayland*.so*
  _install fakeinstall/usr/lib/libxatracker.so*
  _install fakeinstall/usr/lib/libswrAVX*.so*

#   # in libglvnd
#   rm -v fakeinstall/usr/lib/libGLESv{1_CM,2}.so*

  # in vulkan-headers
  rm -rv fakeinstall/usr/include/vulkan

  install -m755 -d ${pkgdir}/usr/lib/mesa
  # move libgl/EGL/glesv*.so to not conflict with blobs - may break .pc files ?
  mv -v ${srcdir}/fakeinstall/usr/lib/libGL.so* 	${pkgdir}/usr/lib/mesa/
  mv -v ${srcdir}/fakeinstall/usr/lib/libEGL.so* 	${pkgdir}/usr/lib/mesa/
  mv -v ${srcdir}/fakeinstall/usr/lib/libGLES*.so*	${pkgdir}/usr/lib/mesa/

  _install fakeinstall/usr/include
  _install fakeinstall/usr/lib/pkgconfig

#   # libglvnd support
#   _install fakeinstall/usr/lib/libGLX_mesa.so*
#   _install fakeinstall/usr/lib/libEGL_mesa.so*

#   # indirect rendering
#   ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"

#   # make sure there are no files left to install
#   find fakeinstall -depth -print0 | xargs -0 rmdir

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_mesa-libgl-noglvnd() {
  pkgdesc="Mesa 3-D graphics library - non-libglvnd version"
  depends=('mesa')
  provides=('libgl' 'libgles' 'libegl' 'mesa-libgl')
  conflicts=('mesa-libgl' 'mesa-libgl-git' 'libglvnd')
  replaces=('mesa-libgl' 'mesa-libgl-git')

  install -m755 -d "${pkgdir}/usr/lib/"
 
  ln -s /usr/lib/mesa/libGL.so.1.2.0 ${pkgdir}/usr/lib/libGL.so.1.2.0
  ln -s libGL.so.1.2.0	             ${pkgdir}/usr/lib/libGL.so.1
  ln -s libGL.so.1.2.0               ${pkgdir}/usr/lib/libGL.so

  ln -s /usr/lib/mesa/libEGL.so.1.0.0 ${pkgdir}/usr/lib/libEGL.so.1.0.0
  ln -s libEGL.so.1.0.0	              ${pkgdir}/usr/lib/libEGL.so.1
  ln -s libEGL.so.1.0.0               ${pkgdir}/usr/lib/libEGL.so

  ln -s /usr/lib/mesa/libGLESv1_CM.so.1.1.0 ${pkgdir}/usr/lib/libGLESv1_CM.so.1.1.0
  ln -s libGLESv1_CM.so.1.1.0	            ${pkgdir}/usr/lib/libGLESv1_CM.so.1
  ln -s libGLESv1_CM.so.1.1.0               ${pkgdir}/usr/lib/libGLESv1_CM.so

  ln -s /usr/lib/mesa/libGLESv2.so.2.0.0 ${pkgdir}/usr/lib/libGLESv2.so.2.0.0
  ln -s libGLESv2.so.2.0.0               ${pkgdir}/usr/lib/libGLESv2.so.2
  ln -s libGLESv2.so.2.0.0               ${pkgdir}/usr/lib/libGLESv2.so

  install -m755 -d "${pkgdir}/usr/share/licenses/mesa-libgl"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa-libgl/"
}
