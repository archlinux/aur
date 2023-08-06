# Active maintainer = Eirikr <iamhumanipromise 1010101 at gmail dot com>
# Contributor: SovietReimu1228 <reimussr at protonmail dot ch>
# Contributor: Reza Jahanbakhshi <reza.jahanbakhshi at gmail dot com>
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
# Active maintainer = none

pkgname=mesa-nightly-nvk-rusticl-intelrt-git
pkgdesc="An open-source implementation of the OpenGL specification, with Rusticl, Nouveau Vulkan, Intel Ray Tracing and more. Nightly pull from Main branch."
pkgver=23.2.0.branchpoint.r1956.g8088d73fd1c
pkgrel=1
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64' 'riscv64' 'powerpc64le' 'powerpc' 'powerpc64')
makedepends=('python-mako' 'libxml2' 'libx11' 'xorgproto' 'libdrm' 'libxshmfence' 'libxxf86vm'
             'libxdamage' 'libvdpau' 'libva' 'wayland' 'wayland-protocols' 'zstd' 'elfutils' 'llvm'
             'libomxil-bellagio' 'libclc' 'clang' 'libglvnd' 'libunwind' 'lm_sensors' 'libxrandr'
             'systemd' 'valgrind' 'glslang' 'vulkan-icd-loader' 'cmake' 'meson'
             'git' 'ninja'
             'rust' 'rust-bindgen' 'spirv-tools' 'spirv-llvm-translator')
depends=('libdrm' 'libxcb' 'wayland' 'python'
         'libclc' 'clang' 'expat' 'spirv-llvm-translator'
         'wayland' 'libx11' 'libxshmfence' 'zstd' 'systemd-libs'
         'libelf' 'llvm-libs'
         'libunwind'
         'libxxf86vm' 'libxdamage' 'libomxil-bellagio' 'lm_sensors' 'libglvnd' 'vulkan-icd-loader')
optdepends=('opencl-headers: headers necessary for OpenCL development'
            'opengl-man-pages: for the OpenGL API man pages')
provides=('vulkan-mesa-layers' 'opencl-rusticl-mesa' 'opencl-clover-mesa' 'vulkan-intel' 'vulkan-radeon' 'vulkan-nouveau' 'vulkan-swrast' 'vulkan-virtio' 'libva-mesa-driver' 'mesa-vdpau' 'mesa'
          'vulkan-mesa-layer' 'mesa-libgl' 'opencl-driver' 'vulkan-driver' 'libva-driver' 'vdpau-driver' 'opengl-driver')
conflicts=('vulkan-mesa-layers' 'opencl-rusticl-mesa' 'opencl-clover-mesa' 'vulkan-intel' 'vulkan-radeon' 'vulkan-swrast' 'vulkan-virtio' 'libva-mesa-driver' 'mesa-vdpau' 'mesa'
           'vulkan-mesa-layer' 'vulkan-mesa' 'mesa-libgl')

url="https://www.mesa3d.org"
license=('custom')
source=('mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git#branch=main')
md5sums=('SKIP')
sha512sums=('SKIP')

# NINJAFLAGS is an env var used to pass commandline options to ninja
# NOTE: It's your responsibility to validate the value of $NINJAFLAGS. 
# If unsure, don't set it.
# NOTE: Ideally set it via /etc/makepkg.conf

pkgver() {
    cd mesa
    printf "%s" "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
    # although removing _build folder in build() function feels more natural,
    # that interferes with the spirit of makepkg --noextract
    if [  -d _build ]; then
        rm -rf _build
    fi
         }

build () {
    export CC="clang"
    export CXX="clang++"

    meson setup mesa _build \
       -D prefix=/usr \
       -D sysconfdir=/etc \
       -D buildtype=release \
       -D b_ndebug=true \
       -D b_lto=true \
       -D platforms=auto \
       -D egl-native-platform=auto \
       -D gallium-drivers=auto \
       -D vulkan-drivers=auto \
       -D vulkan-layers=device-select,intel-nullhw,overlay \
       -D dri3=enabled \
       -D egl=enabled \
       -D xlib-lease=enabled \
       -D buildtype=release \
       -D build-tests=true \
       -D gallium-extra-hud=true \
       -D gallium-nine=true \
       -D gallium-omx=auto \
       -D gallium-va=enabled \
       -D gallium-vdpau=enabled \
       -D gallium-xa=enabled \
       -D gallium-opencl=icd \
       -D gallium-rusticl=true \
       -D gbm=enabled \
       -D shader-cache-max-size=8G \
       -D gles1=enabled \
       -D gles2=enabled \
       -D opengl=true \
       -D glvnd=true \
       -D glx=dri \
       -D libunwind=enabled \
       -D llvm=enabled \
       -D lmsensors=enabled \
       -D osmesa=true \
       -D shared-glapi=enabled \
       -D video-codecs=vc1dec,h264dec,h264enc,h265dec,h265enc \
       -D valgrind=disabled \
       -D opencl-spirv=true \
       -D static-libclc=all \
       -D shader-cache=enabled \
       -D microsoft-clc=enabled \
       -D spirv-to-dxil=true \
       -D draw-use-llvm=true \
       -D zstd=enabled \
       -D valgrind=disabled \
       -D libunwind=disabled \
       -D build-tests=true \
       -D enable-glcpp-tests=true \
       -D osmesa=true \
       -D tools=drm-shim,glsl,nir,dlclose-skip \
       -D glx-direct=true \
       -D allow-kcmp=enabled \
       -D zlib=enabled \
       -D vulkan-beta=true \
       -D gallium-d3d12-video=enabled \
       -D intel-clc=enabled \
       -D intel-xe-kmd=enabled \
       -D nvk-legacy-uapi=true \

 ninja -C _build

}

package() {
    DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C _build install

    # remove script file from /usr/bin
    # https://gitlab.freedesktop.org/mesa/mesa/issues/2230
    rm "${pkgdir}/usr/bin/mesa-overlay-control.py"

    # indirect rendering
    ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"

    install -Dm644 "$srcdir/mesa/docs/license.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

