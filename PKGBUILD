# Maintainer: Michael Serpieri <mickybart@pygoscelis.org>

# based on mesa package from archlinuxarm (without libva-mesa-driver)

# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

# ALARM: Kevin Mihelich <kevin@archlinuxarm.org>
#  - Removed DRI and Gallium3D drivers/packages for chipsets that don't exist in our ARM devices (intel, radeon, VMware svga).

# ALARM: Michael Serpieri <mickybart@pygoscelis.org>
#  - Move libwayland-egl library to a new package mesa-wayland-egl
#    to support different providers for libwayland-egl (eg: libhybris) in the same way than libgl
#  - Disable libglvnd support (need to be compatible with libhybris first)

pkgbase=mesa-hybris
_pkgbase=mesa
pkgname=('mesa-hybris' 'mesa-hybris-libgl' 'mesa-hybris-wayland-egl')
pkgver=17.0.5
pkgrel=2
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
makedepends=('python2-mako' 'libxml2' 'libx11' 'glproto' 'libdrm' 'dri2proto' 'dri3proto' 'presentproto'
             'libxshmfence' 'libxxf86vm' 'libxdamage' 'libvdpau' 'wayland' 'elfutils' 'llvm'
             'libomxil-bellagio' 'clang')
url="http://mesa3d.sourceforge.net"
license=('custom')
source=(https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz
        LICENSE
        remove-libpthread-stubs.patch
        0001-EGL-Implement-the-libglvnd-interface-for-EGL-v2.patch
        0001-Fix-linkage-against-shared-glapi.patch
        0001-glapi-Link-with-glapi-when-built-shared.patch
        0002-fixup-EGL-Implement-the-libglvnd-interface-for-EGL-v.patch
        glvnd-fix-gl-dot-pc.patch)
sha256sums=('668efa445d2f57a26e5c096b1965a685733a3b57d9c736f9d6460263847f9bfe'
            '7fdc119cf53c8ca65396ea73f6d10af641ba41ea1dd2bd44a824726e01c8b3f2'
            '75ab53ad44b95204c788a2988e97a5cb963bdbf6072a5466949a2afb79821c8f'
            '1d3475dc2f4f3e450cf313130d3ce965f933f396058828fa843c0df8115feeb9'
            'c68d1522f9bce4ce31c92aa7a688da49f13043f5bb2254795b76dea8f47130b7'
            '064dcd5a3ab1b7c23383e2cafbd37859e4c353f8839671d9695c6f7c2ef3260b'
            '81d0ced62f61677ea0cf5f69a491093409fa1370f2ef045c41106ca8bf9c46f6'
            '64a77944a28026b066c1682c7258d02289d257b24b6f173a9f7580c48beed966')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D') # Emil Velikov <emil.l.velikov@gmail.com>
validpgpkeys+=('946D09B5E4C9845E63075FF1D961C596A7203456') #  "Andres Gomez <tanty@igalia.com>"

prepare() {
  cd ${srcdir}/mesa-${pkgver}

  # Now mesa checks for libpthread-stubs - so remove the check
  patch -Np1 -i ../remove-libpthread-stubs.patch
  
  # glvnd support patches - from Fedora
  # https://patchwork.freedesktop.org/series/12354/, v3 & v4
  patch -Np1 -i ../0001-EGL-Implement-the-libglvnd-interface-for-EGL-v2.patch
  patch -Np1 -i ../0002-fixup-EGL-Implement-the-libglvnd-interface-for-EGL-v.patch
  # non-upstreamed ones
  patch -Np1 -i ../glvnd-fix-gl-dot-pc.patch
  patch -Np1 -i ../0001-Fix-linkage-against-shared-glapi.patch
  patch -Np1 -i ../0001-glapi-Link-with-glapi-when-built-shared.patch

  autoreconf -fiv
}

build() {
  cd ${srcdir}/mesa-${pkgver}

  [[ $CARCH == "armv7h" ]] && GALLIUM=",etnaviv,imx"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
    --with-gallium-drivers=freedreno,nouveau,swrast,virgl,vc4${GALLIUM} \
    --with-dri-drivers=nouveau,swrast \
    --with-egl-platforms=x11,drm,wayland \
    --disable-xvmc \
    --enable-gallium-llvm \
    --enable-llvm-shared-libs \
    --enable-shared-glapi \
    --disable-libglvnd \
    --enable-egl \
    --enable-glx \
    --enable-glx-tls \
    --enable-gles1 \
    --enable-gles2 \
    --enable-gbm \
    --enable-dri \
    --enable-gallium-osmesa \
    --enable-texture-float \
    --enable-omx \
    --enable-nine \
    --with-clang-libdir=/usr/lib
    #--with-sha1=libgcrypt \

  make

  # fake installation
  mkdir $srcdir/fakeinstall
  make DESTDIR=${srcdir}/fakeinstall install
}

package_mesa-hybris() {
  pkgdesc="an open-source implementation of the OpenGL specification"
  depends=('libdrm' 'wayland' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
           'libomxil-bellagio' 'libtxc_dxtn' 'llvm-libs')
  optdepends=('opengl-man-pages: for the OpenGL API man pages'
              'mesa-vdpau: for accelerated video playback'
              'libva-mesa-driver: for accelerated video playback')
  provides=('ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri' 'opengl-driver' 'mesa')
  conflicts=('ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri' 'mesa-libgl' 'mesa' 'libglvnd')
  replaces=('ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri' 'mesa')

  install -m755 -d ${pkgdir}/etc
  cp -rv ${srcdir}/fakeinstall/etc/drirc ${pkgdir}/etc
  
  #install -m755 -d ${pkgdir}/usr/share/glvnd/egl_vendor.d
  #cp -rv ${srcdir}/fakeinstall/usr/share/glvnd/egl_vendor.d/50_mesa.json ${pkgdir}/usr/share/glvnd/egl_vendor.d/

  install -m755 -d ${pkgdir}/usr/lib/xorg/modules/dri
  # ati-dri, nouveau-dri, intel-dri, svga-dri, swrast
  cp -av ${srcdir}/fakeinstall/usr/lib/xorg/modules/dri/* ${pkgdir}/usr/lib/xorg/modules/dri

  cp -rv ${srcdir}/fakeinstall/usr/lib/bellagio  ${pkgdir}/usr/lib
  cp -rv ${srcdir}/fakeinstall/usr/lib/d3d  ${pkgdir}/usr/lib
  cp -rv ${srcdir}/fakeinstall/usr/lib/lib{gbm,glapi}.so* ${pkgdir}/usr/lib/
  cp -rv ${srcdir}/fakeinstall/usr/lib/libOSMesa.so* ${pkgdir}/usr/lib/

  cp -rv ${srcdir}/fakeinstall/usr/include ${pkgdir}/usr
  cp -rv ${srcdir}/fakeinstall/usr/lib/pkgconfig ${pkgdir}/usr/lib/
  rm ${pkgdir}/usr/lib/pkgconfig/{egl,gl,glesv1_cm,glesv2,wayland-egl}.pc

  # remove vulkan headers
  rm -rf ${pkgdir}/usr/include/vulkan

  ## libglvnd support
  #cp -rv ${srcdir}/fakeinstall/usr/lib/libGLX_mesa.so* ${pkgdir}/usr/lib/
  #cp -rv ${srcdir}/fakeinstall/usr/lib/libEGL_mesa.so* ${pkgdir}/usr/lib/
  ## indirect rendering
  #ln -s /usr/lib/libGLX_mesa.so.0 ${pkgdir}/usr/lib/libGLX_indirect.so.0

  install -m755 -d ${pkgdir}/usr/lib/mesa
  # move libgl/EGL/glesv*.so to not conflict with blobs - may break .pc files ?
  cp -rv ${srcdir}/fakeinstall/usr/lib/libGL.so*       ${pkgdir}/usr/lib/mesa/
  cp -rv ${srcdir}/fakeinstall/usr/lib/libEGL.so*      ${pkgdir}/usr/lib/mesa/
  cp -rv ${srcdir}/fakeinstall/usr/lib/libGLES*.so*    ${pkgdir}/usr/lib/mesa/
  # move libwayland*.so* to not conflict with other providers like libhybris - may break .pc files ?
  cp -rv ${srcdir}/fakeinstall/usr/lib/libwayland*.so* ${pkgdir}/usr/lib/mesa/

  install -m755 -d "${pkgdir}/usr/share/licenses/mesa"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa/"
}

package_mesa-hybris-libgl() {
  pkgdesc="Mesa 3-D graphics library"
  depends=('mesa-hybris' 'mesa-hybris-wayland-egl')
  provides=('libgl')
  replaces=('libgl')
  conflicts=('libgl' 'libglvnd')

  install -m755 -d ${pkgdir}/usr/lib/pkgconfig
  cp ${srcdir}/fakeinstall/usr/lib/pkgconfig/{egl,gl,glesv1_cm,glesv2}.pc ${pkgdir}/usr/lib/pkgconfig
 
  # See FS#26284
  install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"
  ln -s libglx.xorg "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so"

  ln -s /usr/lib/mesa/libGL.so.1.2.0 ${pkgdir}/usr/lib/libGL.so.1.2.0
  ln -s libGL.so.1.2.0               ${pkgdir}/usr/lib/libGL.so.1
  ln -s libGL.so.1.2.0               ${pkgdir}/usr/lib/libGL.so

  ln -s /usr/lib/mesa/libEGL.so.1.0.0 ${pkgdir}/usr/lib/libEGL.so.1.0.0
  ln -s libEGL.so.1.0.0               ${pkgdir}/usr/lib/libEGL.so.1
  ln -s libEGL.so.1.0.0               ${pkgdir}/usr/lib/libEGL.so

  ln -s /usr/lib/mesa/libGLESv1_CM.so.1.1.0 ${pkgdir}/usr/lib/libGLESv1_CM.so.1.1.0
  ln -s libGLESv1_CM.so.1.1.0               ${pkgdir}/usr/lib/libGLESv1_CM.so.1
  ln -s libGLESv1_CM.so.1.1.0               ${pkgdir}/usr/lib/libGLESv1_CM.so

  ln -s /usr/lib/mesa/libGLESv2.so.2.0.0 ${pkgdir}/usr/lib/libGLESv2.so.2.0.0
  ln -s libGLESv2.so.2.0.0               ${pkgdir}/usr/lib/libGLESv2.so.2
  ln -s libGLESv2.so.2.0.0               ${pkgdir}/usr/lib/libGLESv2.so

  install -m755 -d "${pkgdir}/usr/share/licenses/mesa-libgl"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa-libgl/"
}

package_mesa-hybris-wayland-egl() {
  pkgdesc="Mesa 3-D wayland library"
  depends=('mesa-hybris')
  provides=('libwayland-egl')
  replaces=('libwayland-egl')
  conflicts=('libwayland-egl')

  install -m755 -d ${pkgdir}/usr/lib/pkgconfig
  cp ${srcdir}/fakeinstall/usr/lib/pkgconfig/wayland-egl.pc ${pkgdir}/usr/lib/pkgconfig

  ln -s /usr/lib/mesa/libwayland-egl.so.1.0.0 ${pkgdir}/usr/lib/libwayland-egl.so.1.0.0
  ln -s libwayland-egl.so.1.0.0 ${pkgdir}/usr/lib/libwayland-egl.so.1
  ln -s libwayland-egl.so.1.0.0 ${pkgdir}/usr/lib/libwayland-egl.so
}

