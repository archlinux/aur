# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Maintainer of the mesa package: Jan de Groot <jgc@archlinux.org>
# Maintainer of the mesa package: Andreas Radke <andyrtr@archlinux.org>

pkgname=mesa-nowayland
pkgver=11.0.7
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="an open-source implementation of the OpenGL specification"
makedepends=('python2-mako' 'libxml2' 'libx11' 'glproto' 'libdrm' 'dri2proto' 'dri3proto' 'presentproto' 
             'libxshmfence' 'libxxf86vm' 'libxdamage' 'libvdpau' 'libva' 'elfutils' 'llvm'
             'systemd' 'libomxil-bellagio' 'libclc' 'clang')
depends=('libdrm' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'systemd' 'elfutils' 
         'libomxil-bellagio' 'expat' 'libtxc_dxtn' 'llvm-libs')
optdepends=('opengl-man-pages: for the OpenGL API man pages'
            'mesa-vdpau: for accelerated video playback'
            'libva-mesa-driver: for accelerated video playback')
conflicts=("mesa")
provides=("mesa=$pkgver"
          'libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel'
          'ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri')
conflicts=('libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel'
           'ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri')
replaces=('libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel'
          'ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri')
url="http://mesa3d.sourceforge.net"
license=('custom')
source=(ftp://ftp.freedesktop.org/pub/mesa/${pkgver}/mesa-${pkgver}.tar.xz
        LICENSE)
sha256sums=('e7e90a332ede6c8fd08eff90786a3fd1605a4e62ebf3a9b514047838194538cb'
            '7fdc119cf53c8ca65396ea73f6d10af641ba41ea1dd2bd44a824726e01c8b3f2')

prepare() {
  cd ${srcdir}/?esa-*

  # Fix detection of libLLVM when built with CMake
  sed -i 's/LLVM_SO_NAME=.*/LLVM_SO_NAME=LLVM/' configure
}

build() {
  cd ${srcdir}/?esa-*

  #autoreconf -vfi # our automake is far too new for their build system :)

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
    --with-gallium-drivers=r300,r600,radeonsi,nouveau,svga,swrast \
    --with-dri-drivers=i915,i965,r200,radeon,nouveau,swrast \
    --with-egl-platforms=x11,drm \
    --enable-llvm-shared-libs \
    --enable-egl \
    --enable-gbm \
    --enable-gallium-llvm \
    --enable-shared-glapi \
    --enable-glx \
    --enable-glx-tls \
    --enable-dri \
    --enable-osmesa \
    --enable-gles1 \
    --enable-gles2 \
    --enable-texture-float \
    --enable-xa \
    --enable-vdpau \
    --enable-omx \
    --enable-nine \
    --enable-opencl --enable-opencl-icd \
    --with-clang-libdir=/usr/lib

    # --help

  make

  # fake installation
  mkdir $srcdir/fakeinstall
  make DESTDIR=${srcdir}/fakeinstall install
}

package() {
  install -m755 -d ${pkgdir}/etc
  mv -v ${srcdir}/fakeinstall/etc/drirc ${pkgdir}/etc
  
  install -m755 -d ${pkgdir}/usr/lib/xorg/modules/dri
  # ati-dri, nouveau-dri, intel-dri, svga-dri, swrast
  mv -v ${srcdir}/fakeinstall/usr/lib/xorg/modules/dri/* ${pkgdir}/usr/lib/xorg/modules/dri
   
  mv -v ${srcdir}/fakeinstall/usr/lib/bellagio  ${pkgdir}/usr/lib
  mv -v ${srcdir}/fakeinstall/usr/lib/d3d  ${pkgdir}/usr/lib
  mv -v ${srcdir}/fakeinstall/usr/lib/*.so* ${pkgdir}/usr/lib/

  mv -v ${srcdir}/fakeinstall/usr/include ${pkgdir}/usr
  mv -v ${srcdir}/fakeinstall/usr/lib/pkgconfig ${pkgdir}/usr/lib/
  
  install -m755 -d ${pkgdir}/usr/lib/mesa
  # move libgl/EGL/glesv*.so to not conflict with blobs - may break .pc files ?
  mv -v ${pkgdir}/usr/lib/libGL.so* 	${pkgdir}/usr/lib/mesa/
  mv -v ${pkgdir}/usr/lib/libEGL.so* 	${pkgdir}/usr/lib/mesa/
  mv -v ${pkgdir}/usr/lib/libGLES*.so*	${pkgdir}/usr/lib/mesa/

  install -m755 -d "${pkgdir}/usr/share/licenses/mesa"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa/"
}
