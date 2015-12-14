# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor to the lib32-mesa package: Jan de Groot <jgc@archlinux.org>
# Contributor to the lib32-mesa package: Andreas Radke <andyrtr@archlinux.org>

pkgname=lib32-mesa-nowayland
pkgver=11.0.7
pkgrel=1
arch=('x86_64')
pkgdesc="an open-source implementation of the OpenGL specification (32-bit)"
depends=('lib32-libdrm' 'lib32-libxxf86vm' 'lib32-libxdamage' 'lib32-libxshmfence' 'lib32-systemd'
         'lib32-elfutils' 'lib32-llvm-libs' 'lib32-libtxc_dxtn' 'lib32-expat' 'mesa' 'lib32-libxvmc' 'lib32-libxv')
optdepends=('opengl-man-pages: for the OpenGL API man pages'
            'lib32-mesa-vdpau: for accelerated video playback')
provides=('lib32-libglapi' 'lib32-osmesa' 'lib32-libgbm' 'lib32-libgles' 'lib32-libegl'
          'lib32-ati-dri' 'lib32-intel-dri' 'lib32-nouveau-dri' 'lib32-mesa-dri' "lib32-mesa=$pkgver")
conflicts=("lib32-mesa" 'lib32-libglapi' 'lib32-osmesa' 'lib32-libgbm' 'lib32-libgles' 'lib32-libegl'
          'lib32-ati-dri' 'lib32-intel-dri' 'lib32-nouveau-dri' 'lib32-mesa-dri')
replaces=("lib32-mesa=$pkgver" 'lib32-libglapi' 'lib32-osmesa' 'lib32-libgbm' 'lib32-libgles' 'lib32-libegl'
          'lib32-ati-dri' 'lib32-intel-dri' 'lib32-nouveau-dri' 'lib32-mesa-dri')
makedepends=('python2-mako' 'lib32-libxml2' 'lib32-expat' 'lib32-libx11' 'glproto' 'lib32-libdrm' 'dri2proto' 'dri3proto' 'presentproto' 'lib32-libxvmc' 'lib32-libxv'
             'lib32-libxshmfence' 'lib32-libxxf86vm' 'lib32-libxdamage' 'gcc-multilib' 'lib32-elfutils' 'lib32-llvm' 'lib32-systemd'
             'lib32-libvdpau')
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
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export LLVM_CONFIG="/usr/bin/llvm-config32"

  cd ${srcdir}/?esa-*

  # our automake is far too new for their build system :)
  # autoreconf -vfi

  ./configure \
    --build=i686-pc-linux-gnu --host=i686-pc-linux-gnu \
    --libdir=/usr/lib32 \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-dri-driverdir=/usr/lib32/xorg/modules/dri \
    --with-gallium-drivers=r300,r600,radeonsi,nouveau,swrast \
    --with-dri-drivers=i915,i965,r200,radeon,nouveau,swrast \
    --with-egl-platforms=x11,drm \
    --enable-llvm-shared-libs \
    --enable-egl \
    --enable-gbm \
    --enable-gallium-llvm \
    --enable-shared-glapi \
    --enable-glx-tls \
    --enable-dri \
    --enable-glx \
    --enable-osmesa \
    --enable-gles1 \
    --enable-gles2 \
    --enable-texture-float \
    --enable-nine \
    --enable-vdpau 

  make

  mkdir $srcdir/fakeinstall
  make DESTDIR=${srcdir}/fakeinstall install
}

package() {
  install -m755 -d ${pkgdir}/usr/lib32/xorg/modules/dri
  # ati-dri, nouveay-dri, intel-dri, swrast
  mv -v ${srcdir}/fakeinstall/usr/lib32/xorg/modules/dri/* ${pkgdir}/usr/lib32/xorg/modules/dri

  install -m755 -d ${pkgdir}/usr/lib32
  mv -v ${srcdir}/fakeinstall/usr/lib32/d3d ${pkgdir}/usr/lib32
  mv -v ${srcdir}/fakeinstall/usr/lib32/*.so* ${pkgdir}/usr/lib32/

  mv -v ${srcdir}/fakeinstall/usr/lib32/pkgconfig ${pkgdir}/usr/lib32/

  install -m755 -d ${pkgdir}/usr/lib32/mesa
  # move libgl/EGL/glesv*.so to not conflict with blobs - may break .pc files ?
  mv -v ${pkgdir}/usr/lib32/libGL.so*    ${pkgdir}/usr/lib32/mesa/
  mv -v ${pkgdir}/usr/lib32/libEGL.so*   ${pkgdir}/usr/lib32/mesa/
  mv -v ${pkgdir}/usr/lib32/libGLES*.so* ${pkgdir}/usr/lib32/mesa/

  # keep symlinks until pacman 4.2 FS#42046
  #install -m755 -d "${pkgdir}/usr/share/licenses/lib32-mesa"
  #install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/lib32-mesa/"
  install -m755 -d "${pkgdir}/usr/share/licenses"
  ln -s mesa "$pkgdir/usr/share/licenses/lib32-mesa"
}
