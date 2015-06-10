# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Jan de Groot <jgc@archlinux.org>
# Original Maintainer: Andreas Radke <andyrtr@archlinux.org>

# Based on Arch Linux commit: ffc5ea1b114b68ced90ad0dc0d236b2094d4be56

pkgbase=mesa-mir
pkgname=(opencl-mesa-mir libva-mesa-driver-mir mesa-vdpau-mir mesa-mir
         mesa-libgl-mir)
_ubuntu_rel=0ubuntu1
_ubuntu_ver=10.5.2
pkgver=10.5.7
pkgrel=1
arch=(i686 x86_64)
url="http://mesa3d.sourceforge.net"
makedepends=(python2-mako libxml2 libx11 glproto libdrm dri2proto dri3proto
             presentproto libxshmfence libxxf86vm libxdamage libvdpau libva
             wayland elfutils llvm systemd libomxil-bellagio libclc clang)
# Requires Mir, of course
makedepends+=(mir)
license=(custom)
source=("ftp://ftp.freedesktop.org/pub/mesa/${pkgver}/mesa-${pkgver}.tar.xz"{,.sig}
        "https://launchpad.net/ubuntu/+archive/primary/+files/mesa_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.diff.gz"
        LICENSE)
sha512sums=('0ccd9c3700d4c12a6625ad2a5ca46c721135fc3ef9650a6571f210f9f203d44c327e76604e3627edede2a561f88e2fabcf47a339bbd7c106a9c6408ed25a446c'
            'SKIP'
            '9a3580a29dfe01d2997631ea481e05bee8dc514a1853e90a4b79e88e9cd86062e4130c84f02b90ae0af21f82e135030498d1d7e97be59f90ec370a49a2ea41bd'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D') # Emil Velikov <emil.l.velikov@gmail.com>

prepare() {
  cd ?esa-*

  # Apply Ubuntu's patches
  patch -p1 -i "../mesa_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.diff"

  for i in $(grep -v '#' debian/patches/series); do
    msg "Applying ${i}"
    patch -p1 -i "debian/patches/${i}"
  done
}

build() {
  cd ?esa-*

  autoreconf -vfi # our automake is far too new for their build system :)

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
    --with-gallium-drivers=r300,r600,radeonsi,nouveau,svga,swrast \
    --with-dri-drivers=i915,i965,r200,radeon,nouveau,swrast \
    --with-egl-platforms=x11,drm,wayland,mir \
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
  mkdir "${srcdir}"/fakeinstall
  make DESTDIR="${srcdir}"/fakeinstall install
}

replace_orig() {
    local pkg="${1}"
    provides+=("${pkg}=${pkgver}")
    conflicts+=(${pkg})
}

install_license() {
    local pkg="${1}"
    install -dm755 "${pkgdir}"/usr/share/licenses/${pkg}/
    install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkg}/
}

package_opencl-mesa-mir() {
    pkgdesc="OpenCL support for AMD/ATI Radeon mesa drivers"
    depends=(expat libdrm elfutils libxfixes libxext libcl libclc clang)
    optdepends=('opencl-headers: headers necessary for OpenCL development')

    replace_orig opencl-mesa

    local etcdir="${pkgdir}"/etc
    local libdir="${pkgdir}"/usr/lib
  
    install -dm755 "${etcdir}"
    mv -v fakeinstall/etc/OpenCL "${etcdir}"
  
    install -dm755 "${libdir}"/gallium-pipe
    mv -v fakeinstall/usr/lib/lib*OpenCL* "${libdir}"
    mv -v fakeinstall/usr/lib/gallium-pipe/pipe_{r600,radeonsi}.so \
        "${libdir}"/gallium-pipe/

    install_license opencl-mesa-mir
}

package_libva-mesa-driver-mir() {
    pkgdesc="VA-API implementation for gallium"
    depends=(libdrm libx11 llvm-libs expat elfutils)

    replace_orig libva-mesa-driver

    local libdir="${pkgdir}"/usr/lib

    install -dm755 "${libdir}"
    mv -v fakeinstall/usr/lib/dri "${libdir}"

    install_license libva-mesa-driver-mir
}

package_mesa-vdpau-mir() {
    pkgdesc="Mesa VDPAU drivers"
    depends=(libdrm libx11 llvm-libs expat elfutils)

    replace_orig mesa-vdpau

    local libdir="${pkgdir}"/usr/lib

    install -dm755 "${libdir}"
    mv -v fakeinstall/usr/lib/vdpau "${libdir}"
           
    install_license mesa-vdpau-mir
}

package_mesa-mir() {
    pkgdesc="an open-source implementation of the OpenGL specification"
    depends=(libdrm wayland libxxf86vm libxdamage libxshmfence systemd elfutils
             libomxil-bellagio expat libtxc_dxtn llvm-libs)
    optdepends=('opengl-man-pages: for the OpenGL API man pages'
                'mesa-vdpau-mir: for accelerated video playback'
                'libva-mesa-driver-mir: for accelerated video playback')
    provides=(libglapi osmesa libgbm libgles libegl khrplatform-devel
              ati-dri intel-dri nouveau-dri svga-dri mesa-dri)
    conflicts=(libglapi osmesa libgbm libgles libegl khrplatform-devel
               ati-dri intel-dri nouveau-dri svga-dri mesa-dri)
    replaces=(libglapi osmesa libgbm libgles libegl khrplatform-devel
              ati-dri intel-dri nouveau-dri svga-dri mesa-dri)

    depends+=(mir)
    replace_orig mesa

    local etcdir="${pkgdir}"/etc
    local usrdir="${pkgdir}"/usr
    local libdir="${usrdir}"/lib
    local mesadir="${libdir}"/mesa

    install -dm755 "${etcdir}"
    mv -v fakeinstall/etc/drirc "${etcdir}"
  
    install -dm755 "${libdir}"/xorg/modules/dri
    # ati-dri, nouveau-dri, intel-dri, svga-dri, swrast
    mv -v fakeinstall/usr/lib/xorg/modules/dri/* \
        "${libdir}"/xorg/modules/dri
   
    mv -v fakeinstall/usr/lib/bellagio "${libdir}"
    mv -v fakeinstall/usr/lib/d3d      "${libdir}"
    mv -v fakeinstall/usr/lib/*.so*    "${libdir}"

    mv -v fakeinstall/usr/include "${usrdir}"
    mv -v fakeinstall/usr/lib/pkgconfig "${libdir}"
  
    install -dm755 "${mesadir}"
    # move libgl/EGL/glesv*.so to not conflict with blobs - may break .pc files ?
    mv -v "${libdir}"/libGL.so*    "${mesadir}"
    mv -v "${libdir}"/libEGL.so*   "${mesadir}"
    mv -v "${libdir}"/libGLES*.so* "${mesadir}"

    install_license mesa-mir
}

package_mesa-libgl-mir() {
    pkgdesc="Mesa 3-D graphics library"
    depends=(mesa-mir)
    provides=(libgl)
    replaces=(libgl)

    replace_orig mesa-libgl

    local libdir="${pkgdir}"/usr/lib
 
    # See FS#26284
    install -dm755 "${libdir}"/xorg/modules/extensions
    ln -s libglx.xorg "${libdir}"/xorg/modules/extensions/libglx.so

    ln -s /usr/lib/mesa/libGL.so.1.2.0 ${libdir}/libGL.so.1.2.0
    ln -s libGL.so.1.2.0               ${libdir}/libGL.so.1
    ln -s libGL.so.1.2.0               ${libdir}/libGL.so

    ln -s /usr/lib/mesa/libEGL.so.1.0.0 ${libdir}/libEGL.so.1.0.0
    ln -s libEGL.so.1.0.0               ${libdir}/libEGL.so.1
    ln -s libEGL.so.1.0.0               ${libdir}/libEGL.so

    ln -s /usr/lib/mesa/libGLESv1_CM.so.1.1.0 ${libdir}/libGLESv1_CM.so.1.1.0
    ln -s libGLESv1_CM.so.1.1.0               ${libdir}/libGLESv1_CM.so.1
    ln -s libGLESv1_CM.so.1.1.0               ${libdir}/libGLESv1_CM.so

    ln -s /usr/lib/mesa/libGLESv2.so.2.0.0 ${libdir}/libGLESv2.so.2.0.0
    ln -s libGLESv2.so.2.0.0               ${libdir}/libGLESv2.so.2
    ln -s libGLESv2.so.2.0.0               ${libdir}/libGLESv2.so

    install_license mesa-libgl-mir
}
