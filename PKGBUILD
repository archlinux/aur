# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Maintainer of the mesa package: Jan de Groot <jgc@archlinux.org>
# Maintainer of the mesa package: Andreas Radke <andyrtr@archlinux.org>

pkgname=mesa-nowayland
pkgver=13.0.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="An open-source implementation of the OpenGL specification"
makedepends=('python2-mako' 'libxml2' 'libx11' 'glproto' 'libdrm' 'dri2proto' 'dri3proto' 'presentproto' 
             'libxshmfence' 'libxxf86vm' 'libxdamage' 'libvdpau' 'libva' 'elfutils' 'llvm'
             'systemd' 'libomxil-bellagio' 'libgcrypt' 'libclc' 'clang')
depends=('libdrm' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'elfutils' 
         'libomxil-bellagio' 'libgcrypt' 'libtxc_dxtn' 'llvm-libs')
optdepends=('opengl-man-pages: for the OpenGL API man pages'
            'mesa-vdpau: for accelerated video playback'
            'libva-mesa-driver: for accelerated video playback')
conflicts=("mesa")
provides=("mesa=$pkgver"
          'ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri')
conflicts=('ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri')
replaces=('ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri')
url="http://mesa3d.sourceforge.net"
license=('custom')
source=(ftp://ftp.freedesktop.org/pub/mesa/${pkgver}/mesa-${pkgver}.tar.xz
        LICENSE
	remove-libpthread-stubs.patch)
sha256sums=('71962fb2bf77d33b0ad4a565b490dbbeaf4619099c6d9722f04a73187957a731'
            '7fdc119cf53c8ca65396ea73f6d10af641ba41ea1dd2bd44a824726e01c8b3f2'
	    '75ab53ad44b95204c788a2988e97a5cb963bdbf6072a5466949a2afb79821c8f')

prepare() {
  cd ${srcdir}/mesa-${pkgver}

  # Now mesa checks for libpthread-stubs - so remove the check
  patch -Np1 -i ../remove-libpthread-stubs.patch

  autoreconf -fiv
}

build() {
  cd ${srcdir}/mesa-${pkgver}

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
    --with-gallium-drivers=r300,r600,radeonsi,nouveau,svga,swrast,virgl \
    --with-dri-drivers=i915,i965,r200,radeon,nouveau,swrast \
    --with-egl-platforms=x11,drm \
    --with-vulkan-drivers=intel,radeon \
    --with-sha1=libgcrypt \
    --disable-xvmc \
    --enable-gallium-llvm \
    --enable-llvm-shared-libs \
    --enable-shared-glapi \
    --enable-egl \
    --enable-glx \
    --enable-glx-tls \
    --enable-gles1 \
    --enable-gles2 \
    --enable-gbm \
    --enable-dri \
    --enable-osmesa \
    --enable-texture-float \
    --enable-xa \
    --enable-vdpau \
    --enable-omx \
    --enable-nine \
    --enable-opencl \
    --enable-opencl-icd \
    --with-clang-libdir=/usr/lib

  make

  # fake installation
  mkdir -p $srcdir/fakeinstall
  make DESTDIR=${srcdir}/fakeinstall install
}

package() {
  install -m755 -d ${pkgdir}/etc
  cp -rv ${srcdir}/fakeinstall/etc/drirc ${pkgdir}/etc
  
  install -m755 -d ${pkgdir}/usr/lib/xorg/modules/dri
  # ati-dri, nouveau-dri, intel-dri, svga-dri, swrast
  cp -av ${srcdir}/fakeinstall/usr/lib/xorg/modules/dri/* ${pkgdir}/usr/lib/xorg/modules/dri
   
  cp -rv ${srcdir}/fakeinstall/usr/lib/bellagio  ${pkgdir}/usr/lib
  cp -rv ${srcdir}/fakeinstall/usr/lib/d3d  ${pkgdir}/usr/lib
  cp -rv ${srcdir}/fakeinstall/usr/lib/lib{gbm,glapi}.so* ${pkgdir}/usr/lib/
  cp -rv ${srcdir}/fakeinstall/usr/lib/libOSMesa.so* ${pkgdir}/usr/lib/
  cp -rv ${srcdir}/fakeinstall/usr/lib/libxatracker.so* ${pkgdir}/usr/lib/

  cp -rv ${srcdir}/fakeinstall/usr/include ${pkgdir}/usr
  cp -rv ${srcdir}/fakeinstall/usr/lib/pkgconfig ${pkgdir}/usr/lib/
  
  # remove vulkan headers
  rm -rf ${pkgdir}/usr/include/vulkan

  install -m755 -d ${pkgdir}/usr/lib/mesa
  # move libgl/EGL/glesv*.so to not conflict with blobs - may break .pc files ?
  cp -rv ${srcdir}/fakeinstall/usr/lib/libGL.so* 	${pkgdir}/usr/lib/mesa/
  cp -rv ${srcdir}/fakeinstall/usr/lib/libEGL.so* 	${pkgdir}/usr/lib/mesa/
  cp -rv ${srcdir}/fakeinstall/usr/lib/libGLES*.so*	${pkgdir}/usr/lib/mesa/

  install -m755 -d "${pkgdir}/usr/share/licenses/mesa"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa/"
}
