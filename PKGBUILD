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

pkgbase=mesa-test-git
pkgname=('mesa-test-git' 'mesa-test-libgl-git')
pkgdesc="an open-source implementation of the OpenGL specification, git version"
pkgver=17.1.0_devel.89094.a0ac118398
pkgrel=1
arch=('x86_64')
makedepends=('git' 'python2-mako' 'llvm-svn' 'libclc' 'clang-svn' 'libdrm' 'glproto'
             'dri2proto' 'dri3proto' 'presentproto' 'libxml2' 'libx11' 'libxshmfence' 
             'libxxf86vm'  'libxdamage' 'libvdpau' 'libva' 'wayland' 'elfutils' 'libomxil-bellagio'
             'libtxc_dxtn' 'ocl-icd' 'vulkan-icd-loader' 'libgcrypt')
url="http://mesa3d.sourceforge.net"
license=('custom')
source=('mesa::git+https://anongit.freedesktop.org/git/mesa/mesa.git'
        'LICENSE'
        'disable-pthread-stubs-on-linux.patch'
)
sha512sums=('SKIP'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2'
            '1a8ffbc194a8264ae08cad7b886ec87cd331047f35272fdcb11901ddb0c6f64e2cd69af946e01254c9df8fe881ad1e42162202e1bc38db97aaf294313fb0f9ce'
)

prepare() {
    cd "$srcdir"/mesa
    # pthread-stubs is useless on linux
    patch -Np1 -i "$srcdir"/disable-pthread-stubs-on-linux.patch
}

pkgver() {
    cd mesa
    read -r _ver <VERSION
    echo ${_ver/-/_}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build () {
  cd mesa

  ./autogen.sh --prefix=/usr \
               --sysconfdir=/etc \
               --with-dri-driverdir=/usr/lib/xorg/modules/dri \
               --with-gallium-drivers=i915,r300,r600,radeonsi,nouveau,svga,swrast,virgl \
               --with-dri-drivers=i915,i965,r200,radeon,nouveau,swrast \
               --with-egl-platforms=x11,drm,wayland \
               --with-vulkan-drivers=intel,radeon \
               --enable-texture-float \
               --enable-osmesa \
               --enable-xa \
               --enable-nine \
               --disable-xvmc \
               --enable-vdpau \
               --enable-omx \
               --enable-opencl \
               --enable-opencl-icd \
               --enable-glx-tls


# Used configure settings
#
# --prefix=PREFIX                   install architecture-independent files in PREFIX
# --sysconfdir=DIR                  read-only single-machine data 
#                                   [PREFIX/etc]
# --with-dri-driverdir=DIR          directory for the DRI drivers
#                                   [${libdir}/dri]
# --with-gallium-drivers[=DIRS...]  comma delimited Gallium drivers list, e.g. "i915,ilo,nouveau,r300,r600,radeonsi,freedreno,svga,swrast,vc4,virgl"
#                                   [default=r300,r600,svga,swrast]
# --with-dri-drivers[=DIRS...]      comma delimited classic DRI drivers list, e.g. "swrast,i965,radeon"
#                                   [default=auto]
# --with-egl-platforms[=DIRS...]    comma delimited native platforms libEGL supports, e.g. "x11,drm"
#                                   [default=auto]
# --with-vulkan-drivers[=DIRS...]   comma delimited Vulkan drivers list, e.g. "intel"
#                                   [default=no]
# --enable-texture-float            enable floating-point textures and renderbuffers 
#                                   [default=disabled]
# --enable-osmesa                   enable OSMesa library
#                                   [default=disabled]
# --enable-xa                       enable build of the XA X Acceleration API
#                                   [default=disabled]
# --enable-nine                     enable build of the nine Direct3D9 API
#                                   [default=no]
# --disable-xvmc                    enable xvmc library
#                                   [default=auto]
# --enable-vdpau                    enable vdpau library
#                                    [default=auto]
# --enable-omx                      enable OpenMAX library
#                                   [default=disabled]
# --enable-opencl                   enable OpenCL library
#                                   [default=disabled]
# --enable-opencl-icd               Build an OpenCL ICD library to be loaded by an ICD implementation
#                                   [default=disabled]
# --enable-glx-tls                  enable TLS support in GLX
#                                   [default=disabled]

  make

}


package_mesa-test-git () {
  pkgdesc="an open-source implementation of the OpenGL specification, git version"
  depends=('libdrm' 'wayland' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
           'libomxil-bellagio' 'libtxc_dxtn' 'llvm-libs-svn')
  optdepends=('opengl-man-pages: for the OpenGL API man pages')
  provides=('mesa' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'libva-mesa-driver' 'mesa-vdpau' 'vulkan-driver' 'opencl-driver')
  replaces=('mesa' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'libva-mesa-driver' 'mesa-vdpau')
  conflicts=('mesa' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'libva-mesa-driver' 'mesa-vdpau')

  cd mesa
  make DESTDIR="$pkgdir" install
  # remove vulkan headers as they are provided by vulkan-headers package
  rm -rf "$pkgdir"/usr/include/vulkan/vk_platform.h "$pkgdir"/usr/include/vulkan/vulkan.h

  install -m755 -d ${pkgdir}/usr/lib/mesa
  # move libgl/EGL/glesv*.so to not conflict with blobs ?
  mv -v "$pkgdir"/usr/lib/libGL.so*    "$pkgdir"/usr/lib/mesa/
  mv -v "$pkgdir"/usr/lib/libEGL.so*   "$pkgdir"/usr/lib/mesa/
  mv -v "$pkgdir"/usr/lib/libGLES*.so* "$pkgdir"/usr/lib/mesa/

  install -m755 -d "$pkgdir"/usr/share/licenses/$pkgbase
  install -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgbase/
}

package_mesa-test-libgl-git () {
  pkgdesc="Mesa 3-D graphics library"
  depends=('mesa-test-git')
  provides=('mesa-libgl' 'libgl' 'libgles' 'libegl')
  replaces=('mesa-libgl' 'libgles' 'libegl')
  conflicts=('mesa-libgl' 'libgles' 'libegl')

  # See FS#26284
#  install -m755 -d "$pkgdir"/usr/lib/xorg/modules/extensions
#  ln -s libglx.xorg "$pkgdir"/usr/lib/xorg/modules/extensions/libglx.so
  
  install -m755 -d "$pkgdir"/usr/lib/
  ln -s /usr/lib/mesa/libGL.so.1.2.0 "$pkgdir"/usr/lib/libGL.so.1.2.0
  ln -s libGL.so.1.2.0               "$pkgdir"/usr/lib/libGL.so.1
  ln -s libGL.so.1.2.0               "$pkgdir"/usr/lib/libGL.so

  ln -s /usr/lib/mesa/libEGL.so.1.0.0 "$pkgdir"/usr/lib/libEGL.so.1.0.0
  ln -s libEGL.so.1.0.0               "$pkgdir"/usr/lib/libEGL.so.1
  ln -s libEGL.so.1.0.0               "$pkgdir"/usr/lib/libEGL.so

  ln -s /usr/lib/mesa/libGLESv1_CM.so.1.1.0 "$pkgdir"/usr/lib/libGLESv1_CM.so.1.1.0
  ln -s libGLESv1_CM.so.1.1.0               "$pkgdir"/usr/lib/libGLESv1_CM.so.1
  ln -s libGLESv1_CM.so.1.1.0               "$pkgdir"/usr/lib/libGLESv1_CM.so

  ln -s /usr/lib/mesa/libGLESv2.so.2.0.0 "$pkgdir"/usr/lib/libGLESv2.so.2.0.0
  ln -s libGLESv2.so.2.0.0               "$pkgdir"/usr/lib/libGLESv2.so.2
  ln -s libGLESv2.so.2.0.0               "$pkgdir"/usr/lib/libGLESv2.so

  install -m755 -d "$pkgdir"/usr/share/licenses/mesa-test-libgl-git
  install -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/mesa-test-libgl-git/
}
