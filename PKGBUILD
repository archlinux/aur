# Contributor : Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Lone_Wolf <lonewolf@xs4all.nl>

pkgbase=lib32-mesa-r300-r600-radeonsi-git
pkgname=lib32-mesa-r300-r600-radeonsi-git
_gitname=mesa-r300-r600-radeonsi-git
pkgver=70393.71e9457
pkgrel=1
_realver=10.7.0-devel
pkgdesc="LIB32 Mesa R300, R600 & Radeon SI - git version."
arch=('x86_64')
depends=('lib32-libxxf86vm' 'lib32-elfutils' 'lib32-libxvmc' 'lib32-libxdamage' 'gcc-multilib' 'lib32-libdrm' 'mesa-r300-r600-radeonsi-git' 'lib32-systemd' 'lib32-libvdpau' 'lib32-llvm-libs-svn' 'lib32-libxshmfence' 'lib32-wayland' 'lib32-libtxc_dxtn' 'lib32-nettle')
makedepends=('git' 'lib32-llvm-svn' 'mesa-r300-r600-radeonsi-git' 'lib32-libxshmfence' 'lib32-libvdpau' 'lib32-wayland' 'python2-mako' 'lib32-nettle')
optdepends=('lib32-mesa-demos: glxinfo')
provides=("lib32-mesa=${_realver}" "lib32-mesa-vdpau=${_realver}" "lib32-libgl=${_realver}" "lib32-mesa-libgl=${_realver}" )
conflicts=('lib32-mesa' 'lib32-mesa-vdpau' 'lib32-libgl' 'lib32-mesa-libgl' )
url="http://mesa3d.sourceforge.net"
license=(custom)
source=("${_gitname}::git+http://anongit.freedesktop.org/git/mesa/mesa#branch=master"
        'LICENSE')
options=(!libtool)
md5sums=('SKIP'
         '5c65a0fe315dd347e09b1f2826a1df5a')
sha512sums=('SKIP'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2')

pkgver() {
  cd "${srcdir}/${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_gitname}"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  # for our llvm-config for 32 bit
  export LLVM_CONFIG=/usr/bin/llvm-config32

    ./autogen.sh \
    --build=i686-pc-linux-gnu --host=i686-pc-linux-gnu \
    --libdir=/usr/lib32 \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-dri-driverdir=/usr/lib32/xorg/modules/dri \
    --with-gallium-drivers=r300,r600,radeonsi,swrast \
    --with-dri-drivers=swrast \
    --with-egl-platforms=x11,drm,wayland \
    --enable-llvm-shared-libs \
    --enable-egl \
    --enable-gbm \
    --enable-gallium-llvm \
    --enable-shared-glapi \
    --enable-glx-tls \
    --enable-dri \
    --enable-glx \
    --enable-gles1 \
    --enable-gles2 \
    --enable-texture-float \
    --enable-nine \
    --enable-vdpau \
    --enable-va \
    --with-va-libdir=/usr/lib32/dri \
    --enable-xvmc \

  
# Flags used in official 10.4.1-1

#  ./configure \
#    --build=i686-pc-linux-gnu --host=i686-pc-linux-gnu \
#    --libdir=/usr/lib32 \
#    --prefix=/usr \
#    --sysconfdir=/etc \
#    --with-dri-driverdir=/usr/lib32/xorg/modules/dri \
#    --with-gallium-drivers=r300,r600,radeonsi,nouveau,swrast \
#    --with-dri-drivers=i915,i965,r200,radeon,nouveau,swrast \
#    --with-egl-platforms=x11,drm,wayland \
#    --enable-llvm-shared-libs \
#    --enable-egl \
#    --enable-gbm \
#    --enable-gallium-llvm \
#    --enable-shared-glapi \
#    --enable-glx-tls \
#    --enable-dri \
#    --enable-glx \
#    --enable-osmesa \
#    --enable-gles1 \
#    --enable-gles2 \
#    --enable-texture-float \
#    --enable-nine \
#    --enable-vdpau 


# additonal flags in this package
# --enable-va                           enable va library [default=auto]
# --with-va-libdir=/usr/lib32/dri       directory for the VA libraries default is [${libdir}/dri] 
# --enable-xvmc                         enable xvmc library [default=auto]

  make
}

package() {

  cd "${srcdir}/${_gitname}" 
  make DESTDIR="${pkgdir}" install
  install -m755 -d ${pkgdir}/usr/lib32/dri
  install -m755 -d ${pkgdir}/usr/lib32/mesa
  # move libgl/EGL/glesv*.so to not conflict with blobs - may break .pc files ?
  mv -v ${pkgdir}/usr/lib32/libGL.so*    ${pkgdir}/usr/lib32/mesa/
  mv -v ${pkgdir}/usr/lib32/libEGL.so*   ${pkgdir}/usr/lib32/mesa/
  mv -v ${pkgdir}/usr/lib32/libGLES*.so* ${pkgdir}/usr/lib32/mesa/

# lib32-mesa-libgl
  ln -s /usr/lib32/mesa/libGL.so.1.2.0 ${pkgdir}/usr/lib32/libGL.so.1.2.0
  ln -s libGL.so.1.2.0	               ${pkgdir}/usr/lib32/libGL.so.1
  ln -s libGL.so.1.2.0                 ${pkgdir}/usr/lib32/libGL.so

  ln -s /usr/lib32/mesa/libEGL.so.1.0.0 ${pkgdir}/usr/lib32/libEGL.so.1.0.0
  ln -s libEGL.so.1.0.0	                ${pkgdir}/usr/lib32/libEGL.so.1
  ln -s libEGL.so.1.0.0                 ${pkgdir}/usr/lib32/libEGL.so

  ln -s /usr/lib32/mesa/libGLESv1_CM.so.1.1.0 ${pkgdir}/usr/lib32/libGLESv1_CM.so.1.1.0
  ln -s libGLESv1_CM.so.1.1.0	              ${pkgdir}/usr/lib32/libGLESv1_CM.so.1
  ln -s libGLESv1_CM.so.1.1.0                 ${pkgdir}/usr/lib32/libGLESv1_CM.so

  ln -s /usr/lib32/mesa/libGLESv2.so.2.0.0 ${pkgdir}/usr/lib32/libGLESv2.so.2.0.0
  ln -s libGLESv2.so.2.0.0                 ${pkgdir}/usr/lib32/libGLESv2.so.2
  ln -s libGLESv2.so.2.0.0                 ${pkgdir}/usr/lib32/libGLESv2.so
  
  # removing folders/files that are already provided by mesa-r300-r600-radeonsi-git package
  rm -rf "${pkgdir}"/etc
  rm -rf "${pkgdir}"/usr/include

#license
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
