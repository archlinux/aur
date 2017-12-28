# $Id$
# Mantainer: Eduardo escobar <eduardoeae@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=('mesa17.1')
pkgdesc="an open-source implementation of the OpenGL specification. Version 17.1.x only for Intel"
pkgver=17.1.10
pkgrel=2
arch=('i686' 'x86_64')
makedepends=('python2-mako' 'libxml2' 'libx11' 'glproto' 'libdrm' 'dri2proto' 'dri3proto' 'presentproto' 
             'libxshmfence' 'libxxf86vm' 'libxdamage' 'wayland' 'elfutils'
             'libclc' 'libglvnd' 'libunwind' 'lm_sensors' 'libomxil-bellagio')
url="https://www.mesa3d.org/"
conflicts=('mesa')
provides=('mesa')
depends+=('libdrm' 'wayland' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf' 
         'libtxc_dxtn' 'libunwind' 'lm_sensors' 'libglvnd')
optdepends+=('opengl-man-pages: for the OpenGL API man pages')
provides+=('ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri' 'mesa-libgl' 'opengl-driver')
conflicts+=('ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri' 'mesa-libgl')
replaces+=('ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri' 'mesa-libgl')
license=('custom')
source=(https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz{,.sig}
        LICENSE
        0002-glvnd-fix-gl-dot-pc.patch)
md5sums=('8b1d9f51ed829b986d0496af05560fd7'
         'SKIP'
         '5c65a0fe315dd347e09b1f2826a1df5a'
         'a6d619d733133655fab1478df9a9f741')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D') # Emil Velikov <emil.l.velikov@gmail.com>
validpgpkeys+=('946D09B5E4C9845E63075FF1D961C596A7203456') # Andres Gomez <tanty@igalia.com>
validpgpkeys+=('E3E8F480C52ADD73B278EE78E1ECBE07D7D70895') # Juan Antonio Suárez Romero (Igalia, S.L.) <jasuarez@igalia.com>"
 
prepare() {
  cd ${srcdir}/mesa-${pkgver}

  # glvnd support patches - from Fedora
  # non-upstreamed ones
  patch -Np1 -i ../0002-glvnd-fix-gl-dot-pc.patch

  autoreconf -fiv
}

build() {
  cd ${srcdir}/mesa-${pkgver}

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --without-gallium-drivers \
    --with-dri-drivers=i965,swrast \
    --with-platforms=x11,drm,wayland \
    --without-vulkan-drivers \
    --disable-xvmc \
    --disable-libunwind \
    --enable-libglvnd \
    --disable-llvm \
    --disable-llvm-shared-libs \
    --enable-shared-glapi \
    --enable-lmsensors \
    --enable-glx-tls \
    --enable-egl \
    --enable-glx \
    --enable-gles1 \
    --enable-gles2 \
    --enable-gbm \
    --enable-dri \
    --disable-gallium-osmesa \
    --disable-gallium-extra-hud \
    --enable-texture-float \
    --enable-xa \
    --disable-vdpau \
    --enable-omx \
    --disable-nine \
    --disable-opencl \
    --disable-opencl-icd \
    --disable-gallium-llvm

  make

  # fake installation
  mkdir $srcdir/fakeinstall
  make DESTDIR=${srcdir}/fakeinstall install
}

package() {
  install -m755 -d ${pkgdir}/etc
  cp -rv ${srcdir}/fakeinstall/etc/drirc ${pkgdir}/etc
  
  install -m755 -d ${pkgdir}/usr/share/glvnd/egl_vendor.d
  cp -rv ${srcdir}/fakeinstall/usr/share/glvnd/egl_vendor.d/50_mesa.json ${pkgdir}/usr/share/glvnd/egl_vendor.d/

   install -m755 -d ${pkgdir}/usr/lib/dri
  # ati-dri, nouveau-dri, intel-dri, svga-dri, swrast
  cp -av ${srcdir}/fakeinstall/usr/lib/dri/*_dri.so ${pkgdir}/usr/lib/dri
   
  cp -rv ${srcdir}/fakeinstall/usr/lib/lib{gbm,glapi}.so* ${pkgdir}/usr/lib/
  cp -rv ${srcdir}/fakeinstall/usr/lib/libwayland*.so* ${pkgdir}/usr/lib/

  cp -rv ${srcdir}/fakeinstall/usr/include ${pkgdir}/usr
  cp -rv ${srcdir}/fakeinstall/usr/lib/pkgconfig ${pkgdir}/usr/lib/

  # libglvnd support
  cp -rv ${srcdir}/fakeinstall/usr/lib/libGLX_mesa.so* ${pkgdir}/usr/lib/
  cp -rv ${srcdir}/fakeinstall/usr/lib/libEGL_mesa.so* ${pkgdir}/usr/lib/
  # indirect rendering
  ln -s /usr/lib/libGLX_mesa.so.0 ${pkgdir}/usr/lib/libGLX_indirect.so.0

  install -m755 -d "${pkgdir}/usr/share/licenses/mesa"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa/"
}
