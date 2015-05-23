# Maintainer: Armin K. <krejzi at email dot com>
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
pkgver=10.5.0_devel.67557
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('python2' 'libxml2' 'libx11' 'glproto' 'libdrm' 'dri2proto' 'dri3proto' 'presentproto' 
             'libxshmfence' 'libxxf86vm'  'libxdamage' 'libvdpau' 'libva' 'wayland' 'elfutils' 'llvm'
             'systemd' 'libomxil-bellagio' 'libclc' 'clang' 'python2-mako' 'git')
url="http://mesa3d.sourceforge.net"
license=('custom')
source=('mesa::git://anongit.freedesktop.org/mesa/mesa#branch=master'
        'LICENSE')
md5sums=('SKIP'
         '5c65a0fe315dd347e09b1f2826a1df5a')

pkgver() {
    cd "${srcdir}/mesa"
    echo $(cat VERSION | tr "-" "_").$(git rev-list --count HEAD)
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
               --with-gallium-drivers=r300,r600,radeonsi,nouveau,svga,swrast \
               --with-dri-drivers=i915,i965,r200,radeon,nouveau,swrast \
               --with-egl-platforms=x11,drm,wayland \
               --disable-xvmc \
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

  # fake installation
  mkdir -p "${srcdir}/fakeinstall"
  make DESTDIR="${srcdir}/fakeinstall" install
}

package_opencl-mesa-git () {
  pkgdesc="OpenCL support for AMD/ATI Radeon Mesa drivers"
  depends=('expat' 'libdrm' 'elfutils' 'libxfixes' 'libxext' 'libcl' 'libclc' 'clang')
  optdepends=('opencl-headers: headers necessary for OpenCL development')
  provides=('opencl-mesa')
  replaces=('opencl-mesa')
  conflicts=('opencl-mesa')

  install -v -m755 -d "${pkgdir}/etc"
  mv -v "${srcdir}/fakeinstall/etc/OpenCL" "${pkgdir}/etc/"
 
  install -v -m755 -d "${pkgdir}/usr/lib/gallium-pipe"
  mv -v "${srcdir}"/fakeinstall/usr/lib/lib*OpenCL* "${pkgdir}/usr/lib/"
  mv -v "${srcdir}"/fakeinstall/usr/lib/gallium-pipe/pipe_{r600,radeonsi}.so "${pkgdir}/usr/lib/gallium-pipe/"

  install -v -m755 -d "${pkgdir}/usr/share/licenses/opencl-mesa"
  install -v -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/opencl-mesa/"

  ln -sfv opencl-mesa "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_libva-mesa-driver-git() {
  pkgdesc="VA-API implementation for gallium"
  depends=('libdrm' 'libx11' 'llvm-libs' 'expat' 'elfutils')
  provides=('libva-mesa-driver')
  replaces=('libva-mesa-driver')
  conflicts=('libva-mesa-driver')

  install -v -m755 -d "${pkgdir}/usr/lib"
  mv -v "${srcdir}/fakeinstall/usr/lib/dri" "${pkgdir}/usr/lib/"

  install -v -m755 -d "${pkgdir}/usr/share/licenses/libva-mesa-driver"
  install -v -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/libva-mesa-driver/"

  ln -sfv libva-mesa-driver "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_mesa-vdpau-git() {
  pkgdesc="Mesa VDPAU drivers"
  depends=('libdrm' 'libx11' 'llvm-libs' 'expat' 'elfutils')
  provides=('mesa-vdpau')
  replaces=('mesa-vdpau')
  conflicts=('mesa-vdpau')

  install -v -m755 -d "${pkgdir}/usr/lib"
  mv -v "${srcdir}/fakeinstall/usr/lib/vdpau" "${pkgdir}/usr/lib/"

  install -v -m755 -d "${pkgdir}/usr/share/licenses/mesa-vdpau"
  install -v -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa-vdpau/"

  ln -sfv mesa-vdpau "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_mesa-git () {
  pkgdesc="an open-source implementation of the OpenGL specification"
  depends=('libdrm' 'wayland' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'systemd' 'elfutils'
           'libomxil-bellagio' 'expat' 'libtxc_dxtn' 'llvm-libs')
  optdepends=('opengl-man-pages: for the OpenGL API man pages'
              'mesa-vdpau-git: for accelerated video playback'
              'libva-mesa-driver-git: for accelerated video playback')
  provides=("mesa=$(_mesaver)" 'libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel'
            'ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri'
            'ati-dri-git' 'intel-dri-git' 'nouveau-dri-git' 'svga-dri-git' 'mesa-dri-git')
  replaces=('mesa' 'libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel'
            'ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri'
            'ati-dri-git' 'intel-dri-git' 'nouveau-dri-git' 'svga-dri-git' 'mesa-dri-git')
  conflicts=('mesa' 'libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel'
             'ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri'
             'ati-dri-git' 'intel-dri-git' 'nouveau-dri-git' 'svga-dri-git' 'mesa-dri-git')

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

  install -v -m755 -d "${pkgdir}/usr/share/licenses/mesa"
  install -v -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa/"

  ln -sfv mesa "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_mesa-libgl-git () {
  pkgdesc="Mesa 3-D graphics library"
  depends=("mesa=$(_mesaver)")
  provides=("mesa-libgl=$(_mesaver)" "libgl=$(_mesaver)")
  replaces=('mesa-libgl' 'libgl')
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

  install -v -m755 -d "${pkgdir}/usr/share/licenses/mesa-libgl"
  install -v -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa-libgl/"

  ln -sfv mesa-libgl "${pkgdir}/usr/share/licenses/${pkgname}"
}
