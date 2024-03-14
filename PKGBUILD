# Maintainer: SovietReimu1228 <reimu@hakurei.win>

pkgname=mesa-enable-h264
realpkgver=24.0.3
pkgver=`echo $realpkgver | sed -e 's/-/_/g'`
pkgrel=1
pkgdesc="An open-source implementation of the OpenGL specification"
url="https://www.mesa3d.org"
arch=('x86_64')
license=('MIT AND BSD-3-Clause AND SGI-B-2.0')

makedepends=(
    'python-mako' 'xorgproto'
    'libxml2' 'libvdpau' 'libva' 'elfutils' 'libxrandr'
    'wayland-protocols' 'meson' 'ninja' 'glslang' 'directx-headers'

    'clang' 'expat' 'libdrm' 'libelf' 'libglvnd' 'libunwind' 'libx11'
    'libxdamage' 'libxshmfence' 'libxxf86vm' 'llvm' 'lm_sensors' 'rust'
    'spirv-llvm-translator' 'spirv-tools' 'systemd' 'vulkan-icd-loader'
    'wayland' 'xcb-util-keysyms' 'zstd' 'cmake' 'libclc' 'python-ply'
    'rust-bindgen' 'valgrind' 'libomxil-bellagio'
)
depends=(
    'libdrm' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
    'libomxil-bellagio' 'libunwind' 'libglvnd' 'wayland' 'lm_sensors' 
    'vulkan-icd-loader' 'zstd' 'expat' 'gcc-libs' 'libxfixes' 'libx11' 'systemd-libs' 'libxext' 'libxcb'
    'glibc' 'zlib' 'llvm-libs'

    'python' 'systemd' 'xcb-util-keysyms' 'clang' 'spirv-llvm-translator'
    'libclc'
)
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=(
    'vulkan-mesa-layers' 'vulkan-intel' 'vulkan-radeon' 'vulkan-swrast' 'vulkan-virtio' 'libva-mesa-driver' 'mesa-vdpau' 'mesa'
    'vulkan-driver' 'libva-driver' 'vdpau-driver' 'mesa-libgl' 'opengl-driver'
)
conflicts=(
    'vulkan-mesa-layers' 'vulkan-intel' 'vulkan-radeon' 'vulkan-swrast' 'vulkan-virtio' 'libva-mesa-driver' 'mesa-vdpau' 'mesa'
    'vulkan-mesa-layer' 'vulkan-mesa' 'mesa-libgl'
)

source=(
    https://mesa.freedesktop.org/archive/mesa-${realpkgver}.tar.xz
    LICENSE
)
sha256sums=(
    'SKIP'
    '7052ba73bb07ea78873a2431ee4e828f4e72bda7d176d07f770fa48373dec537'
)
b2sums=(
    'SKIP'
    '1ecf007b82260710a7bf5048f47dd5d600c168824c02c595af654632326536a6527fbe0738670ee7b921dd85a70425108e0f471ba85a8e1ca47d294ad74b4adb'
)

prepare() {
    if [ -d _build ]; then
        rm -rf _build
    fi
}


build () {
    ulimit -Sn 65535
    export CC="clang"
    export CXX="clang++"

    meson setup mesa-$realpkgver _build \
        -D b_ndebug=true \
        -D b_lto=true \
        -D dri3=enabled \
        -D egl=enabled \
        -D gallium-drivers=all \
        -D gallium-extra-hud=true \
        -D gallium-nine=true \
        -D gallium-omx=bellagio \
        -D gallium-opencl=disabled \
        -D gallium-rusticl=false \
        -D gallium-va=enabled \
        -D gallium-vdpau=enabled \
        -D gallium-xa=enabled \
        -D gbm=enabled \
        -D gles1=enabled \
        -D gles2=enabled \
        -D glvnd=true \
        -D glx=dri \
        -D intel-clc=enabled \
        -D libunwind=enabled \
        -D llvm=enabled \
        -D lmsensors=enabled \
        -D microsoft-clc=enabled \
        -D osmesa=true \
        -D platforms=x11,wayland \
        -D rust_std=2021 \
        -D shared-glapi=enabled \
        -D valgrind=enabled \
        -D video-codecs=all \
        -D vulkan-drivers=all \
        -D vulkan-layers=device-select,overlay \
        -D buildtype=release \
        -D prefix=/usr \
        -D sysconfdir=/etc \
        -D zstd=enabled

    meson configure --no-pager _build
    
    ninja $NINJAFLAGS -C _build
}

package() {
    DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C _build install

    # indirect rendering
    ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"
  
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
