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
pkgname=('mesa-git')
pkgdesc="an open-source implementation of the OpenGL specification, git version"
pkgver=18.2.0_devel.101789.a8420e2530
pkgrel=1
arch=('x86_64')
makedepends=('git' 'python2-mako' 'llvm-svn' 'libclc' 'clang-svn' 'xorgproto'
              'libxml2' 'libx11'  'libvdpau' 'libva' 'elfutils' 'libomxil-bellagio'
              'ocl-icd' 'vulkan-icd-loader' 'libgcrypt')
depends=('libdrm' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
         'libomxil-bellagio' 'llvm-libs-svn' 'libunwind' 'libglvnd')
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=('mesa' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'libva-mesa-driver' 'mesa-vdpau' 'vulkan-driver' 'opencl-driver' 'opengl-driver')
conflicts=('mesa' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'libva-mesa-driver' 'mesa-vdpau' 'wayland<1.14.93')
url="http://mesa3d.sourceforge.net"
license=('custom')
source=('mesa::git://anongit.freedesktop.org/mesa/mesa'
        'LICENSE'
)
sha512sums=('SKIP'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2'
)

prepare() {
  cd mesa
  autoreconf -vfi
}

pkgver() {
    cd mesa
    read -r _ver <VERSION
    echo ${_ver/-/_}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build () {
  cd mesa
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-gallium-drivers=r300,r600,radeonsi,nouveau,svga,swrast,virgl \
    --with-dri-drivers=i915,i965,r200,radeon,nouveau \
    --with-platforms=x11,drm,surfaceless \
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


package_mesa-git() {

  cd mesa
  make DESTDIR="$pkgdir" install

  # remove files provided by libglvnd
  rm "$pkgdir"/usr/lib/libGLESv{1_CM,2}.so*

  # indirect rendering
  ln -s /usr/lib/libGLX_mesa.so.0 ${pkgdir}/usr/lib/libGLX_indirect.so.0

  install -Dt "$pkgdir"/usr/share/licenses/$pkgbase "$srcdir"/LICENSE
}
