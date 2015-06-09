# Maintainer: Lone_Wolf <lonewolf@xs4all.nl>
# Contributor : Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Adapted from offical archlinux mesa package

pkgbase=mesa-r300-r600-radeonsi-git
pkgname=mesa-r300-r600-radeonsi-git
pkgver=70393.71e9457
pkgrel=1
_realver=10.7.0-devel
pkgdesc="Mesa for R300, R600 & radeon SI chipsets - git version."
arch=('x86_64')
depends=('libxxf86vm' 'libxvmc' 'libxdamage' 'xorg-server' 'libvdpau' 'wayland' 'elfutils' 'llvm-libs-svn' 'libtxc_dxtn' 'libomxil-bellagio' 'nettle')
makedepends=('pkgconfig' 'python2' 'talloc' 'libxml2' 'imake' 'git' 'xorg-server-devel' 'llvm-svn' 'libomxil-bellagio' 'libclc' 'clang-svn' 'elfutils' 'python2-mako')
optdepends=('opencl-headers: headers necessary for OpenCL development'
            'libcl: OpenCL support'
            'libclc: OpenCL support'
            'clang-svn: OpenCL support'
            'mesa-demos: glxinfo'
            'libsystemd: for XA acceleration API')


provides=("mesa=${_realver}" "opencl-mesa=${_realver}" "libva-mesa-driver=${_realver}" "mesa-vdpau=${_realver}"  "mesa-libgl=${_realver}" "mesa-dri=${_realver}" "libgl=${_realver}")
conflicts=('mesa' 'opencl-mesa' 'libva-mesa-driver' 'mesa-vdpau' 'mesa-libgl' )
url="http://mesa3d.sourceforge.net"
license=(custom)
source=("${pkgname}::git+http://anongit.freedesktop.org/git/mesa/mesa#branch=master"
        'LICENSE'
        )
sha512sums=('SKIP'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2')

pkgver() {
  cd "${srcdir}/${pkgbase}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  
  cd "${srcdir}/${pkgbase}"
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
    --with-gallium-drivers=r300,r600,radeonsi,swrast \
    --with-dri-drivers=swrast \
    --with-egl-platforms=x11,drm,wayland \
    --enable-llvm-shared-libs \
    --enable-egl \
    --enable-gbm \
    --enable-gallium-llvm \
    --enable-shared-glapi \
    --enable-glx \
    --enable-glx-tls \
    --enable-dri \
    --enable-gles1 \
    --enable-gles2 \
    --enable-texture-float \
    --enable-xa \
    --enable-vdpau \
    --enable-omx \
    --enable-nine \
    --enable-opencl \
    --enable-opencl-icd \
    --with-clang-libdir=/usr/lib \
    --enable-va \
    --enable-xvmc


# Flags used in official mesa 10.5.1-2
#  ./configure --prefix=/usr \
#    --sysconfdir=/etc \
#    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
#    --with-gallium-drivers=r300,r600,radeonsi,nouveau,svga,swrast \
#    --with-dri-drivers=i915,i965,r200,radeon,nouveau,swrast \
#    --with-egl-platforms=x11,drm,wayland \
#    --enable-llvm-shared-libs \
#    --enable-egl \
#    --enable-gbm \
#    --enable-gallium-llvm \
#    --enable-shared-glapi \
#    --enable-glx \
#    --enable-glx-tls \
#    --enable-dri \
#    --enable-osmesa \
#    --enable-gles1 \
#    --enable-gles2 \
#    --enable-texture-float \
#    --enable-xa \
#    --enable-vdpau \
#    --enable-omx \
#    --enable-nine \
#    --enable-opencl --enable-opencl-icd \
#    --with-clang-libdir=/usr/lib





# additonal flags in this package
# --enable-va                   enable va library [default=auto]
# --enable-xvmc                 enable xvmc library [default=auto]


# left out compile flags
# default = auto 
#  --enable-32-bit	        build 32-bit libraries [default=auto]
#  --enable-64-bit	        build 64-bit libraries [default=auto]
#  --disable-driglx-direct      enable direct rendering in GLX and EGL for DRI [default=auto]
# --enable-dri3                 enable DRI3 [default=auto]
#
#
# default = enabled/yes
#  --enable-shared[=PKGS]       build shared libraries [default=yes]
#  --enable-fast-install[=PKGS] optimize for fast installation [default=yes]
#  --disable-asm	        disable assembly usage [default=enabled on supported plaforms]
#  --disable-pic                compile PIC objects [default=enabled for shared builds on supported platforms]
#
#
# default = disabled/no
#  --enable-debug               use debug compiler flags and macros [default=disabled]
#  --enable-mangling            enable mangled symbols and library name [default=disabled]
#  --enable-selinux             Build SELinux-aware Mesa [default=disabled]
#  --disable-opengl	        disable support for standard OpenGL API [default=no]
#  --enable-openvg              enable support for OpenVG API [default=no]
#  --enable-xlib-glx            make GLX library Xlib-based instead of DRI-based [default=disable]

#
  make
}

package() {

  cd "${srcdir}/${pkgbase}" 
  make DESTDIR="${pkgdir}" install

  install -m755 -d ${pkgdir}/usr/lib/mesa
  # move libgl/EGL/glesv*.so to not conflict with blobs - may break .pc files ?
  mv -v ${pkgdir}/usr/lib/libGL.so* ${pkgdir}/usr/lib/mesa/
  mv -v ${pkgdir}/usr/lib/libEGL.so* ${pkgdir}/usr/lib/mesa/
  mv -v ${pkgdir}/usr/lib/libGLES*.so* ${pkgdir}/usr/lib/mesa/

# mesa-libgl
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
  
#license
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgbase}"
  install -m755 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgbase}/"
  #removing git leftovers
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
