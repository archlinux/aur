# $Id$
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=('lib32-mesa17.1')
pkgdesc+="an open-source implementation of the OpenGL specification (32-bit) Version 17.1.x only for Intel"
pkgver=17.1.10
pkgrel=2
arch=('x86_64')
makedepends=('python2-mako' 'lib32-libxml2' 'lib32-expat' 'lib32-libx11' 'glproto' 'lib32-libdrm' 'dri2proto' 'dri3proto' 'presentproto' 'libomxil-bellagio'
             'lib32-libxshmfence' 'lib32-libxxf86vm' 'lib32-libxdamage' 'gcc-multilib' 'lib32-libelf'
             'lib32-wayland' 'lib32-libglvnd' 'lib32-lm_sensors')
url="http://mesa3d.sourceforge.net"
conflicts=('lib32-mesa')
provides=('lib32-mesa')
depends+=('lib32-libdrm' 'lib32-libxxf86vm' 'lib32-libxdamage' 'lib32-libxshmfence' 'lib32-lm_sensors'
         'lib32-libelf' 'lib32-wayland' 'lib32-libtxc_dxtn' 'lib32-libglvnd' 'mesa')
optdepends+=('opengl-man-pages: for the OpenGL API man pages')
provides+=('lib32-ati-dri' 'lib32-intel-dri' 'lib32-nouveau-dri' 'lib32-mesa-dri' 'lib32-mesa-libgl' 'lib32-opengl-driver')
conflicts+=('lib32-ati-dri' 'lib32-intel-dri' 'lib32-nouveau-dri' 'lib32-mesa-dri' 'lib32-mesa-libgl')
replaces+=('lib32-ati-dri' 'lib32-intel-dri' 'lib32-nouveau-dri' 'lib32-mesa-dri' 'lib32-mesa-libgl')

license=('custom')
source=(https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz{,.sig}
	LICENSE
  0002-glvnd-fix-gl-dot-pc.patch)
md5sums=('8b1d9f51ed829b986d0496af05560fd7'
         'SKIP'
         '5c65a0fe315dd347e09b1f2826a1df5a'
         'a6d619d733133655fab1478df9a9f741')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D') # Emil Velikov <emil.l.velikov@gmail.com>
validpgpkeys+=('946D09B5E4C9845E63075FF1D961C596A7203456') # "Andres Gomez <tanty@igalia.com>"
validpgpkeys+=('E3E8F480C52ADD73B278EE78E1ECBE07D7D70895') # Juan Antonio Suárez Romero (Igalia, S.L.) <jasuarez@igalia.com>"

prepare() {
  cd ${srcdir}/mesa-${pkgver}

  # glvnd support patches - from Fedora
  # non-upstreamed ones
  patch -Np1 -i ../0002-glvnd-fix-gl-dot-pc.patch

  autoreconf -fiv
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
  cd ${srcdir}/mesa-${pkgver}

  ./configure \
    --build=i686-pc-linux-gnu --host=i686-pc-linux-gnu \
    --libdir=/usr/lib32 \
    --prefix=/usr \
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
  install -m755 -d ${pkgdir}/usr/lib32/dri
  # ati-dri, nouveay-dri, intel-dri, swrast
  cp -av ${srcdir}/fakeinstall/usr/lib32/dri/* ${pkgdir}/usr/lib32/dri

  install -m755 -d ${pkgdir}/usr/lib32
  cp -rv ${srcdir}/fakeinstall/usr/lib32/lib{gbm,glapi}.so* ${pkgdir}/usr/lib32/
  cp -rv ${srcdir}/fakeinstall/usr/lib32/libwayland*.so* ${pkgdir}/usr/lib32/

  cp -rv ${srcdir}/fakeinstall/usr/lib32/pkgconfig ${pkgdir}/usr/lib32/

  # libglvnd support
  cp -rv ${srcdir}/fakeinstall/usr/lib32/libGLX_mesa.so* ${pkgdir}/usr/lib32/
  cp -rv ${srcdir}/fakeinstall/usr/lib32/libEGL_mesa.so* ${pkgdir}/usr/lib32/
  # indirect rendering
  ln -s /usr/lib32/libGLX_mesa.so.0 ${pkgdir}/usr/lib32/libGLX_indirect.so.0
 
  install -m755 -d "${pkgdir}/usr/share/licenses/lib32-mesa"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/lib32-mesa/"
}
