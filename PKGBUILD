# Maintainer: nutcase84 <nutcase84@protonmail.com>

pkgbase=mesa_mild_compatibility-git
pkgname=('mesa_mild_compatibility-git')
pkgdesc="Mesa with modifications for GALLIUM3D drivers and i965"
pkgver=17.3.0_mild.96143.bc03bdfee8
pkgrel=1
arch=('x86_64')
makedepends=('git' 'python2-mako' 'llvm-svn' 'libclc' 'clang-svn' 'glproto'
             'dri2proto' 'dri3proto' 'presentproto' 'libxml2' 'libx11' 
             'libvdpau' 'libva' 'elfutils' 'libomxil-bellagio'
             'ocl-icd' 'vulkan-icd-loader' 'libgcrypt' 'wayland-protocols')
depends=('libdrm' 'wayland' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
         'libomxil-bellagio' 'libtxc_dxtn' 'llvm-libs-svn' 'libunwind' 'libglvnd')
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=('mesa' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'libva-mesa-driver' 'mesa-vdpau' 'mesa-libgl' 'vulkan-driver' 'opencl-driver' 'opengl-driver')
conflicts=('mesa' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'libva-mesa-driver' 'mesa-vdpau' 'mesa-libgl')
url="https://github.com/mikakev1/mesa_mild_compatibility/tree/master"
license=('custom')
source=('mesa::git://github.com/mikakev1/mesa_mild_compatibility.git'
        'LICENSE'
)
sha512sums=('SKIP'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2')

prepare() {
  cd ${srcdir}/mesa
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
               --with-platforms=x11,drm,wayland \
               --with-vulkan-drivers=intel,radeon \
               --enable-texture-float \
               --enable-gallium-osmesa \
               --enable-xa \
               --enable-nine \
               --disable-xvmc \
               --enable-vdpau \
               --enable-omx-bellagio \
               --enable-opencl \
               --enable-opencl-icd \
               --enable-glx-tls \
               --enable-libglvnd


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
# --with-platforms[=DIRS...]        comma delimited native platforms libEGL/Vulkan/other
#                                   supports, e.g. "x11,drm,wayland,surfaceless..."
#                                   [default=auto]
# --with-vulkan-drivers[=DIRS...]   comma delimited Vulkan drivers list, e.g. "intel"
#                                   [default=no]
# --enable-texture-float            enable floating-point textures and renderbuffers 
#                                   [default=disabled]
# --enable-gallium-osmesa           enable Gallium implementation of the OSMesa library
#                                   [default=disabled]
# --enable-xa                       enable build of the XA X Acceleration API
#                                   [default=disabled]
# --enable-nine                     enable build of the nine Direct3D9 API
#                                   [default=no]
# --disable-xvmc                    enable xvmc library
#                                   [default=auto]
# --enable-vdpau                    enable vdpau library
#                                    [default=auto]
# --enable-omx-bellagio             enable OpenMAX Bellagio library
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


package_mesa_mild_compatibility-git() {

  cd mesa
  make DESTDIR="$pkgdir" install
  # remove vulkan headers as they are provided by vulkan-headers package
  rm -rf "$pkgdir"/usr/include/vulkan/vk_platform.h "$pkgdir"/usr/include/vulkan/vulkan.h

  # remove files present in libglvnd
  rm $pkgdir/usr/lib/libGLESv1_CM.so
  rm $pkgdir/usr/lib/libGLESv1_CM.so.1
  rm $pkgdir/usr/lib/libGLESv2.so
  rm $pkgdir/usr/lib/libGLESv2.so.2
  rm $pkgdir/usr/lib/libGLESv2.so.2.0.0

  # indirect rendering
  ln -s /usr/lib/libGLX_mesa.so.0 ${pkgdir}/usr/lib/libGLX_indirect.so.0

  install -m755 -d "$pkgdir"/usr/share/licenses/$pkgbase
  install -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgbase/
}
