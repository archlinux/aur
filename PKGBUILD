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

pkgbase=lib32-mesa-git
pkgname=('lib32-mesa-git')
pkgdesc="an open-source implementation of the OpenGL specification, git version"
pkgver=18.1.0_devel.101298.afde9294b5
pkgrel=1
arch=('x86_64')
makedepends=('python2-mako' 'lib32-libxml2' 'lib32-libx11' 'xorgproto'
             'lib32-gcc-libs' 'lib32-libvdpau' 'lib32-libelf' 'lib32-llvm-svn' 'git' 'lib32-libgcrypt' 'lib32-systemd'
             'mesa-git' 'lib32-llvm-libs-svn' 'lib32-libglvnd' 'wayland-protocols')
depends=('mesa-git' 'lib32-gcc-libs' 'lib32-libdrm' 'lib32-wayland' 'lib32-libxxf86vm' 'lib32-libxdamage' 'lib32-libxshmfence' 'lib32-elfutils'
           'lib32-llvm-libs-svn' 'lib32-libunwind')
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=('lib32-mesa' 'lib32-opencl-mesa' 'lib32-vulkan-intel' 'lib32-vulkan-radeon' 'lib32-libva-mesa-driver' 'lib32-mesa-vdpau' 'lib32-opengl-driver')
conflicts=('lib32-mesa' 'lib32-opencl-mesa' 'lib32-vulkan-intel' 'lib32-vulkan-radeon' 'lib32-libva-mesa-driver' 'lib32-mesa-vdpau')
url="http://mesa3d.sourceforge.net"
license=('custom')
source=('mesa::git://anongit.freedesktop.org/mesa/mesa'
        'LICENSE'
        'ac-nir-Fix-include-for-LLVMAddPromoteMemoryToRegisterPass.patch'
)

sha512sums=('SKIP'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2'
            '294fe4727e61d8f1970c48003a4ba3dc10291bedc58090b2c53ea74088fd673ec0b00b2449a816d229a565c3acbd190fe9d567896752bbfc7e6412e920699f85')

prepare() {
  cd mesa
  patch -Np1 -i ../ac-nir-Fix-include-for-LLVMAddPromoteMemoryToRegisterPass.patch
  autoreconf -fi
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
  ./configure --build=i686-pc-linux-gnu --host=i686-pc-linux-gnu \
               --libdir=/usr/lib32 \
               --prefix=/usr \
               --sysconfdir=/etc \
               --with-gallium-drivers=r300,r600,radeonsi,nouveau,svga,swrast,virgl \
               --with-dri-drivers=i915,i965,r200,radeon,nouveau,swrast \
               --with-platforms=x11,drm,wayland \
               --with-vulkan-drivers=intel,radeon \
               --enable-texture-float \
               --enable-gallium-osmesa \
               --enable-xa \
               --enable-nine \
               --disable-xvmc \
               --enable-vdpau \
               --enable-glx-tls \
               --with-va-libdir=/usr/lib32/dri \
               --enable-libglvnd


# Used configure settings
#
# --prefix=PREFIX                   install architecture-independent files in PREFIX
# --sysconfdir=DIR                  read-only single-machine data 
#                                   [PREFIX/etc]
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
# --enable-libglvnd                 Build GLX and EGL for libglvnd 
#                                   [default=disabled]

  make

}


package_lib32-mesa-git () {

  cd mesa
  make DESTDIR="$pkgdir" install

  # remove files provided by mesa-git
  rm -rf "$pkgdir"/etc
  rm -rf "$pkgdir"/usr/include
  rm "$pkgdir"/usr/share/glvnd/egl_vendor.d/50_mesa.json

  # remove files present in lib32-libglvnd
  rm "$pkgdir"/usr/lib32/libGLESv1_CM.so
  rm "$pkgdir"/usr/lib32/libGLESv1_CM.so.1
  rm "$pkgdir"/usr/lib32/libGLESv2.so
  rm "$pkgdir"/usr/lib32/libGLESv2.so.2
  rm "$pkgdir"/usr/lib32/libGLESv2.so.2.0.0

  install -m755 -d "$pkgdir"/usr/share/licenses/$pkgbase
  install -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgbase/
}
