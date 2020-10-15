# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Kristian Klausen <klausenbusk@hotmail.com>
# Contributor: Egon Ashrafinia <e.ashrafinia@gmail.com>
# Contributor: Tavian Barnes <tavianator@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Antti "Tera" Oja <antti.bofh@gmail.com>
# Contributor: Diego Jose <diegoxter1006@gmail.com>

pkgname=mesa-glxdelay
pkgdesc="an open-source implementation of the OpenGL specification, git version"
pkgver=20.1.8
pkgrel=1
arch=('x86_64')
makedepends=('git' 'python-mako' 'xorgproto'
              'libxml2' 'libx11'  'libvdpau' 'libva' 'elfutils' 'libxrandr'
              'ocl-icd' 'wayland-protocols' 'meson' 'ninja' 'glslang')
depends=('libdrm' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
         'libomxil-bellagio' 'libunwind' 'libglvnd' 'wayland' 'lm_sensors' 'libclc' 'vulkan-icd-loader' 'zstd' 'expat')
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=('mesa' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'vulkan-mesa-layer' 'libva-mesa-driver' 'mesa-vdpau' 'vulkan-driver' 'opengl-driver' 'opencl-driver')
conflicts=('mesa' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'vulkan-mesa-layer' 'libva-mesa-driver' 'mesa-vdpau')
url="https://www.mesa3d.org"
license=('custom')
source=('https://archive.mesa3d.org//mesa-20.1.8.tar.xz.sig`'
	'https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6429.patch'
        'LICENSE')
md5sums=('SKIP'
         'SKIP'
         'SKIP')
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd mesa-$pkgver

    patch -Np1 -i ../6429.patch

}

build () {
    arch-meson mesa-$pkgver build \
       -D b_ndebug=true \
       -D b_lto=true \
       -D buildtype=plain \
       --wrap-mode=nofallback \
       -D prefix=/usr \
       -D sysconfdir=/etc \
       -D platforms=x11,wayland \
       -D dri-drivers=i915,i965,r200,r100,nouveau \
       -D gallium-drivers=r300,r600,radeonsi,nouveau,svga,swrast,virgl,iris,zink \
       -D vulkan-drivers=amd,intel \
       -D dri3=enabled \
       -D egl=enabled \
       -D gallium-extra-hud=true \
       -D gallium-nine=true \
       -D gallium-omx=bellagio \
       -D gallium-va=enabled \
       -D gallium-vdpau=enabled \
       -D gallium-xa=enabled \
       -D gallium-xvmc=disabled \
       -D gbm=enabled \
       -D gles1=disabled \
       -D gles2=enabled \
       -D glvnd=true \
       -D glx=dri \
       -D libunwind=enabled \
       -D llvm=enabled \
       -D lmsensors=enabled \
       -D osmesa=gallium \
       -D shared-glapi=enabled \
       -D gallium-opencl=icd \
       -D valgrind=disabled \
       -D vulkan-overlay-layer=true \
       -D vulkan-device-select-layer=true \
       -D tools=[] \
       -D zstd=enabled
       
    meson configure _build
    
    ninja $NINJAFLAGS -C _build
}

package() {
    DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C _build install

    # remove script file from /usr/bin
    # https://gitlab.freedesktop.org/mesa/mesa/issues/2230
    rm "${pkgdir}/usr/bin/mesa-overlay-control.py"
    rmdir "${pkgdir}/usr/bin"
    
    # indirect rendering
    ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"
  
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
