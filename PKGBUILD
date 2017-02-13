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

pkgbase=lib32-mesa-test-git
pkgname=('lib32-mesa-test-git' 'lib32-mesa-test-libgl-git')
pkgdesc="an open-source implementation of the OpenGL specification, git version"
pkgver=17.1.0_devel.88933.bd1c61261f
pkgrel=1
arch=('x86_64')
makedepends=('python2-mako' 'lib32-libxml2' 'lib32-libx11' 'glproto' 'lib32-libdrm' 'dri2proto' 'dri3proto' 'presentproto' 
             'lib32-libxshmfence' 'lib32-libxxf86vm'  'lib32-libxdamage' 'gcc-multilib' 'lib32-libvdpau' 'lib32-wayland' 'lib32-elfutils' 'lib32-llvm-svn'
              'git' 'lib32-libtxc_dxtn'
             'lib32-libgcrypt' 'lib32-systemd')
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
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export LLVM_CONFIG=/usr/bin/llvm-config32

  cd mesa
  ./autogen.sh --build=i686-pc-linux-gnu --host=i686-pc-linux-gnu \
               --libdir=/usr/lib32 \
               --prefix=/usr \
               --sysconfdir=/etc \
               --with-dri-driverdir=/usr/lib32/xorg/modules/dri \
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
               --enable-glx-tls \
               --with-va-libdir=/usr/lib32/dri \


# Used configure settings
#
# --prefix=PREFIX                   install architecture-independent files in PREFIX
# --sysconfdir=DIR                  read-only single-machine data 
#                                   [PREFIX/etc]
# --with-dri-driverdir=DIR          directory for the DRI drivers
#                                   [${libdir}/dri]
# --with-gallium-drivers[=DIRS...]  comma delimited Gallium drivers list, e.g. "i915,nouveau,r300,r600,radeonsi,freedreno,svga,swrast,vc4,virgl"
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
# --disable-xvmc                     enable xvmc library
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


package_lib32-mesa-test-git () {
  pkgdesc="an open-source implementation of the OpenGL specification, git version"
  depends=('mesa-test-git' 'lib32-libdrm' 'lib32-wayland' 'lib32-libxxf86vm' 'lib32-libxdamage' 'lib32-libxshmfence' 'lib32-elfutils'
           'lib32-libtxc_dxtn' 'lib32-llvm-libs-svn')
  optdepends=('opengl-man-pages: for the OpenGL API man pages')
  provides=('lib32-mesa' 'lib32-opencl-mesa' 'lib32-vulkan-intel' 'lib32-vulkan-radeon' 'lib32-libva-mesa-driver' 'lib32-mesa-vdpau')
  replaces=('lib32-mesa' 'lib32-opencl-mesa' 'lib32-vulkan-intel' 'lib32-vulkan-radeon' 'lib32-libva-mesa-driver' 'lib32-mesa-vdpau')
  conflicts=('lib32-mesa' 'lib32-opencl-mesa' 'lib32-vulkan-intel' 'lib32-vulkan-radeon' 'lib32-libva-mesa-driver' 'lib32-mesa-vdpau')

  cd mesa
  make DESTDIR="$pkgdir" install
  # remove vulkan headers as they are provided by vulkan-headers package
  rm -rf "$pkgdir"/usr/include/vulkan/vk_platform.h "$pkgdir"/usr/include/vulkan/vulkan.h
  
  # remove files provided by mesa-test-git
  rm -rf "$pkgdir"/etc
  rm -rf "$pkgdir"/usr/include

  install -m755 -d ${pkgdir}/usr/lib32/mesa
  # move libgl/EGL/glesv*.so to not conflict with blobs ?
  mv -v "$pkgdir"/usr/lib32/libGL.so*    "$pkgdir"/usr/lib32/mesa/
  mv -v "$pkgdir"/usr/lib32/libEGL.so*   "$pkgdir"/usr/lib32/mesa/
  mv -v "$pkgdir"/usr/lib32/libGLES*.so* "$pkgdir"/usr/lib32/mesa/

  install -m755 -d "$pkgdir"/usr/share/licenses/$pkgbase
  install -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgbase/
}

package_lib32-mesa-test-libgl-git () {
  pkgdesc="Mesa 3-D graphics library"
  depends=('lib32-mesa-test-git')
  provides=('lib32-mesa-libgl' 'lib32-libgl' 'lib32-libgles' 'lib32-libegl')
  replaces=('lib32-mesa-libgl' 'lib32-libgles' 'lib32-libegl')
  conflicts=('lib32-mesa-libgl' 'lib32-libgles' 'lib32-libegl')

  # See FS#26284
  install -m755 -d "$pkgdir"/usr/lib32/xorg/modules/extensions
  ln -s libglx.xorg "$pkgdir"/usr/lib32/xorg/modules/extensions/libglx.so

  ln -s /usr/lib32/mesa/libGL.so.1.2.0 "$pkgdir"/usr/lib32/libGL.so.1.2.0
  ln -s libGL.so.1.2.0               "$pkgdir"/usr/lib32/libGL.so.1
  ln -s libGL.so.1.2.0               "$pkgdir"/usr/lib32/libGL.so

  ln -s /usr/lib32/mesa/libEGL.so.1.0.0 "$pkgdir"/usr/lib32/libEGL.so.1.0.0
  ln -s libEGL.so.1.0.0               "$pkgdir"/usr/lib32/libEGL.so.1
  ln -s libEGL.so.1.0.0               "$pkgdir"/usr/lib32/libEGL.so

  ln -s /usr/lib32/mesa/libGLESv1_CM.so.1.1.0 "$pkgdir"/usr/lib32/libGLESv1_CM.so.1.1.0
  ln -s libGLESv1_CM.so.1.1.0               "$pkgdir"/usr/lib32/libGLESv1_CM.so.1
  ln -s libGLESv1_CM.so.1.1.0               "$pkgdir"/usr/lib32/libGLESv1_CM.so

  ln -s /usr/lib32/mesa/libGLESv2.so.2.0.0 "$pkgdir"/usr/lib32/libGLESv2.so.2.0.0
  ln -s libGLESv2.so.2.0.0               "$pkgdir"/usr/lib32/libGLESv2.so.2
  ln -s libGLESv2.so.2.0.0               "$pkgdir"/usr/lib32/libGLESv2.so

  install -m755 -d "$pkgdir"/usr/share/licenses/lib32-mesa-test-libgl-git
  install -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/lib32-mesa-test-libgl-git/
}
