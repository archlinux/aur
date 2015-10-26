# Maintainer Grey Christoforo <first name [at] last name [dot] net>

pkgbase=mesa-git-rbp
pkgname=('libva-mesa-driver-git-rbp' 'mesa-git-rbp' 'mesa-libgl-git-rbp')
pkgver=11.0.3
pkgrel=1
arch=('armv6h' 'armv7h')
makedepends=('python2-mako' 'libxml2' 'libx11' 'glproto' 'libdrm' 'dri2proto' 'dri3proto' 'presentproto' 
             'libxshmfence' 'libxxf86vm'  'libxdamage' 'libvdpau' 'libva' 'wayland' 'elfutils' 'llvm-svn'
             'systemd' 'libomxil-bellagio' 'libclc' 'clang-svn' 'git'
             'libtxc_dxtn' 'ocl-icd' 'openssl' 'gnutls')

url="http://mesa3d.sourceforge.net"
license=('custom')
source=('mesa::git://anongit.freedesktop.org/mesa/mesa#branch=master'
        'LICENSE')
md5sums=('SKIP'
         '5c65a0fe315dd347e09b1f2826a1df5a')

pkgver() {
  cd mesa
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/mesa

  ./autogen.sh --prefix=/usr \
	--sysconfdir=/etc \
	--with-dri-driverdir=/usr/lib/xorg/modules/dri \
	--with-dri-drivers= \
	--with-gallium-drivers=vc4 \
	--enable-glx-tls \
	--disable-xvmc \
	--enable-gles1 \
	--enable-gles2 \
	--with-egl-platforms=x11,drm,wayland \
	--with-clang-libdir=/usr/lib
  
  make

  # fake installation
  mkdir -p $srcdir/fakeinstall
  make DESTDIR=${srcdir}/fakeinstall install
}

package_libva-mesa-driver-git-rbp() {
  pkgdesc="VA-API implementation for gallium"
  depends=('nettle' 'libdrm' 'libx11' 'llvm-libs' 'expat' 'elfutils' "mesa=${pkgver}")
  provides=("libva-mesa-driver=${pkgver}")
  conflicts=('libva-mesa-driver')

  install -m755 -d ${pkgdir}/usr/lib
  cp -a ${srcdir}/fakeinstall/usr/lib/dri ${pkgdir}/usr/lib
   
  install -m755 -d "${pkgdir}/usr/share/licenses/libva-mesa-driver"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/libva-mesa-driver/"
}

package_mesa-git-rbp() {
  pkgdesc="an open-source implementation of the OpenGL specification"
  depends=('libdrm' 'wayland' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'systemd' 'elfutils' 
           'libomxil-bellagio' 'expat' 'libtxc_dxtn' 'llvm-libs')
  optdepends=('nettle: for GLX-TLS support'
	      'opengl-man-pages: for the OpenGL API man pages'
              'mesa-vdpau: for accelerated video playback'
              'libva-mesa-driver: for accelerated video playback')
  provides=("mesa=${pkgver}" 'libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel'
            'mesa-dri')
  conflicts=('mesa' 'libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel'
             'mesa-dri')
  replaces=('mesa' 'libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel'
            'mesa-dri')
            
  cp -a ${srcdir}/fakeinstall/* ${pkgdir}/.
  rm -rf ${pkgdir}/usr/lib/dri

  #install -m755 -d ${pkgdir}/etc
  #mv -v ${srcdir}/fakeinstall/etc/drirc ${pkgdir}/etc
  
  #install -m755 -d ${pkgdir}/usr/lib/xorg/modules/dri
  # ati-dri, nouveau-dri, intel-dri, svga-dri, swrast
  #mv -v ${srcdir}/fakeinstall/usr/lib/xorg/modules/dri/* ${pkgdir}/usr/lib/xorg/modules/dri
  
  #mv -v ${srcdir}/fakeinstall/usr/lib/*.so* ${pkgdir}/usr/lib/

  #mv -v ${srcdir}/fakeinstall/usr/include ${pkgdir}/usr
  #mv -v ${srcdir}/fakeinstall/usr/lib/pkgconfig ${pkgdir}/usr/lib/
  
  install -m755 -d ${pkgdir}/usr/lib/mesa
  # move libgl/EGL/glesv*.so to not conflict with blobs - may break .pc files ?
  mv -v ${pkgdir}/usr/lib/libGL.so* 	${pkgdir}/usr/lib/mesa/
  mv -v ${pkgdir}/usr/lib/libEGL.so* 	${pkgdir}/usr/lib/mesa/
  mv -v ${pkgdir}/usr/lib/libGLES*.so*	${pkgdir}/usr/lib/mesa/

  install -m755 -d "${pkgdir}/usr/share/licenses/mesa"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa/"
}

package_mesa-libgl-git-rbp() {
  pkgdesc="Mesa 3-D graphics library"
  depends=("mesa=${pkgver}")
  provides=("mesa-libgl=${pkgver}" "libgl=${pkgver}")
  replaces=('mesa-libgl')
  conflicts=('mesa-libgl')
 
  # See FS#26284
  install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"
  ln -s libglx.xorg "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so"

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
