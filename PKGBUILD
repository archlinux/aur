# Maintainer: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Kristian Klausen <klausenbusk@hotmail.com>
# Contributor: Egon Ashrafinia <e.ashrafinia@gmail.com>
# Contributor: Tavian Barnes <tavianator@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Antti "Tera" Oja <antti.bofh@gmail.com>
# Contributor: Diego Jose <diegoxter1006@gmail.com>

pkgbase=mesa-git
pkgname=('opencl-mesa-git' 'libva-mesa-driver-git' 'mesa-vdpau-git' 'mesa-git' 'mesa-libgl-git')
pkgver=11.2.0_devel.75334.8326eb1
pkgrel=1
arch=('i686' 'x86_64')
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
    cd "${srcdir}/mesa"
    echo $(cat VERSION | tr "-" "_").$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

_mesaver() {
    path="${srcdir}/mesa/VERSION"
    [ -f $path ] && cat "$path"
}

build () {
  cd "${srcdir}/mesa"

  ./autogen.sh --prefix=/usr \
               --sysconfdir=/etc \
               --with-dri-driverdir=/usr/lib/xorg/modules/dri \
               --with-gallium-drivers=r300,r600,radeonsi,nouveau,svga,swrast,virgl \
               --with-dri-drivers=i915,i965,r200,radeon,nouveau,swrast \
               --with-egl-platforms=x11,drm,wayland \
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
               --enable-opencl \
               --enable-opencl-icd \
               --with-clang-libdir=/usr/lib

  make
#               --with-gallium-drivers=r300,r600,radeonsi,nouveau,svga,swrast,virgl \
#              --with-dri-drivers=i915,i965,r200,radeon,nouveau,swrast \

  
  # fake installation
  mkdir -p "${srcdir}/fakeinstall"
  make DESTDIR="${srcdir}/fakeinstall" install
}

package_opencl-mesa-git () {
  pkgdesc="OpenCL support for AMD/ATI Radeon Mesa drivers"
  depends=('libxfixes' 'libxext' 'libcl' 'libclc' 'nettle' "mesa-git=${pkgver}")
  optdepends=('opencl-headers: headers necessary for OpenCL development')
  provides=("opencl-mesa=$(_mesaver)")
  replaces=('opencl-mesa')
  conflicts=('opencl-mesa')

  install -v -m755 -d "${pkgdir}/etc"
  mv -v "${srcdir}/fakeinstall/etc/OpenCL" "${pkgdir}/etc/"
 
  install -v -m755 -d "${pkgdir}/usr/lib/gallium-pipe"
  mv -v "${srcdir}"/fakeinstall/usr/lib/lib*OpenCL* "${pkgdir}/usr/lib/"
  mv -v "${srcdir}"/fakeinstall/usr/lib/gallium-pipe/pipe_{r600,radeonsi}.so "${pkgdir}/usr/lib/gallium-pipe/"

  install -v -m755 -d "${pkgdir}/usr/share/licenses/opencl-mesa-git"
  install -v -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/opencl-mesa-git/"
}

package_libva-mesa-driver-git() {
  pkgdesc="VA-API implementation for gallium"
  depends=('nettle' "mesa-git=${pkgver}")
  provides=("libva-mesa-driver=$(_mesaver)")
  conflicts=('libva-mesa-driver')

  install -v -m755 -d "${pkgdir}/usr/lib"
  mv -v "${srcdir}/fakeinstall/usr/lib/dri" "${pkgdir}/usr/lib/"

  install -v -m755 -d "${pkgdir}/usr/share/licenses/libva-mesa-driver-git"
  install -v -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/libva-mesa-driver-git/"
}


package_mesa-vdpau-git() {
  pkgdesc="Mesa VDPAU drivers"
  depends=('nettle' "mesa-git=${pkgver}")
  provides=("mesa-vdpau=$(_mesaver)")
  replaces=('mesa-vdpau')
  conflicts=('mesa-vdpau')

  install -v -m755 -d "${pkgdir}/usr/lib"
  mv -v "${srcdir}/fakeinstall/usr/lib/vdpau" "${pkgdir}/usr/lib/"

  install -v -m755 -d "${pkgdir}/usr/share/licenses/mesa-vdpau-git"
  install -v -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa-vdpau-git/"
}

package_mesa-git () {
  pkgdesc="an open-source implementation of the OpenGL specification"
  depends=('libdrm>=2.4.66' 'wayland' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'systemd' 'elfutils'
           'libomxil-bellagio' 'libtxc_dxtn' 'llvm-libs-svn' 'libxvmc')
  optdepends=('nettle: for GLX-TLS support'
              'opengl-man-pages: for the OpenGL API man pages'
              'mesa-vdpau-git: for accelerated video playback'
              'libva-mesa-driver-git: for accelerated video playback')
  provides=("mesa=$(_mesaver)" 'mesa-r300-r600-radeonsi-git' 'mesa-dri')
  replaces=('mesa' 'mesa-r300-r600-radeonsi-git' 'mesa-dri')
  conflicts=('mesa' 'mesa-r300-r600-radeonsi-git' 'mesa-dri')

  install -v -m755 -d "${pkgdir}/etc"
  mv -v "${srcdir}/fakeinstall/etc/drirc" "${pkgdir}/etc/"

  install -v -m755 -d "${pkgdir}/usr/lib/xorg/modules/dri"
  # ati-dri, nouveau-dri, intel-dri, svga-dri, swrast
  mv -v "${srcdir}"/fakeinstall/usr/lib/xorg/modules/dri/* "${pkgdir}/usr/lib/xorg/modules/dri/"

  mv -v "${srcdir}"/fakeinstall/usr/lib/bellagio "${pkgdir}/usr/lib/"
  mv -v "${srcdir}"/fakeinstall/usr/lib/d3d "${pkgdir}/usr/lib/"
  mv -v "${srcdir}"/fakeinstall/usr/lib/*.so* "${pkgdir}/usr/lib/"

  mv -v "${srcdir}/fakeinstall/usr/include" "${pkgdir}/usr/"
  mv -v "${srcdir}/fakeinstall/usr/lib/pkgconfig" "${pkgdir}/usr/lib/"
 
  install -v -m755 -d "${pkgdir}/usr/lib/mesa"
  # move libgl/EGL/glesv*.so to not conflict with blobs - may break .pc files ?
  mv -v "${pkgdir}"/usr/lib/libGL.so*    "${pkgdir}/usr/lib/mesa/"
  mv -v "${pkgdir}"/usr/lib/libEGL.so*   "${pkgdir}/usr/lib/mesa/"
  mv -v "${pkgdir}"/usr/lib/libGLES*.so* "${pkgdir}/usr/lib/mesa/"

  install -v -m755 -d "${pkgdir}/usr/share/licenses/mesa-git"
  install -v -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa-git/"
}

package_mesa-libgl-git () {
  pkgdesc="Mesa 3-D graphics library"
  depends=("mesa-git=${pkgver}")
  provides=("mesa-libgl=$(_mesaver)" "libgl=$(_mesaver)")
  replaces=('mesa-libgl')
  conflicts=('mesa-libgl')

  # See FS#26284
  install -v -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"
  ln -sfv libglx.xorg "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so"

  ln -sfv /usr/lib/mesa/libGL.so.1.2.0 "${pkgdir}/usr/lib/libGL.so.1.2.0"
  ln -sfv libGL.so.1.2.0               "${pkgdir}/usr/lib/libGL.so.1"
  ln -sfv libGL.so.1.2.0               "${pkgdir}/usr/lib/libGL.so"

  ln -sfv /usr/lib/mesa/libEGL.so.1.0.0 "${pkgdir}/usr/lib/libEGL.so.1.0.0"
  ln -sfv libEGL.so.1.0.0               "${pkgdir}/usr/lib/libEGL.so.1"
  ln -sfv libEGL.so.1.0.0               "${pkgdir}/usr/lib/libEGL.so"

  ln -sfv /usr/lib/mesa/libGLESv1_CM.so.1.1.0 "${pkgdir}/usr/lib/libGLESv1_CM.so.1.1.0"
  ln -sfv libGLESv1_CM.so.1.1.0               "${pkgdir}/usr/lib/libGLESv1_CM.so.1"
  ln -sfv libGLESv1_CM.so.1.1.0               "${pkgdir}/usr/lib/libGLESv1_CM.so"

  ln -sfv /usr/lib/mesa/libGLESv2.so.2.0.0 "${pkgdir}/usr/lib/libGLESv2.so.2.0.0"
  ln -sfv libGLESv2.so.2.0.0               "${pkgdir}/usr/lib/libGLESv2.so.2"
  ln -sfv libGLESv2.so.2.0.0               "${pkgdir}/usr/lib/libGLESv2.so"

  install -v -m755 -d "${pkgdir}/usr/share/licenses/mesa-libgl-git"
  install -v -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa-libgl-git/"
}