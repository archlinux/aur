# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor:  Vincent Grande <shoober420@gmail.com>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Kristian Klausen <klausenbusk@hotmail.com>
# Contributor: Egon Ashrafinia <e.ashrafinia@gmail.com>
# Contributor: Tavian Barnes <tavianator@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Antti "Tera" Oja <antti.bofh@gmail.com>
# Contributor: Diego Jose <diegoxter1006@gmail.com>

pkgbase=mesa-minimal-git
pkgname=(mesa-minimal-git opencl-mesa-minimal-git)
pkgdesc="an open-source implementation of the OpenGL specification, stripped down git version"
pkgver=26.0.0_devel.215663.6b67ca2e8fa
pkgrel=1
arch=('x86_64')
makedepends=(git meson ninja libglvnd python-packaging python-mako xorgproto libxml2 libx11  libva elfutils libxrandr
                            wayland-protocols glslang llvm-minimal-git libdrm libclc-minimal-git clang-minimal-git
                            rust rust-bindgen-git spirv-tools spirv-llvm-translator-minimal-git systemd-libs clang-opencl-headers-minimal-git
                            python-ply libunwind libxdamage vulkan-icd-loader xcb-util-keysyms python-pyaml libdisplay-info)
# In order to keep the package simple and ease troubleshooting only use one llvm implementation
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=(mesa vulkan-intel vulkan-radeon vulkan-mesa-layers libva-mesa-driver vulkan-swrast vulkan-virtio vulkan-driver opengl-driver vulkan-mesa-implicit-layers)
conflicts=(mesa vulkan-intel vulkan-radeon vulkan-mesa-layers libva-mesa-driver vulkan-swrast mesa-vdpau vulkan-virtio
                vulkan-nouveau mesa-libgl vulkan-gfxstream vulkan-dzn vulkan-mesa-implicit-layers
)
# mixing components from different mesa versions is a bad idea, conflict with everything unique provided by extra/mesa

url="https://www.mesa3d.org"
license=("MIT AND BSD-3-Clause AND SGI-B-2.0")
source=("mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git"
)

md5sums=('SKIP'
)
sha512sums=('SKIP'
)
options=(!emptydirs !lto !debug)

# ninja grabs all available cores and leaves almost nothing for other processes.
# this package uses the environment variable NINJAFLAGS to allow the user to change this behaviour
# example for 12 core / 24 threads processor    'opencl-clover-mesa'
# export NINJAFLAGS="-j 18 -l 18"
# The responsibility to validate the value of NINJAFLAGS lies with the user.
# If unsure, use NINJAFLAGS=""

pkgver() {
    cd mesa
    local _ver
    read -r _ver < VERSION || [ -n "_ver" ]
    echo ${_ver/-/_}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {

    meson setup mesa _build \
       -D b_ndebug=true \
       -D b_lto=false \
       -D b_pie=true \
       -D buildtype=plain \
       --wrap-mode=nofallback \
       -D rust_std=2021 \
       -D prefix=/usr \
       -D sysconfdir=/etc \
       -D platforms=x11,wayland \
       -D gallium-drivers=radeonsi,llvmpipe,zink,virgl,iris \
       -D vulkan-drivers=amd,swrast,intel \
       -D egl=enabled \
       -D gallium-extra-hud=true \
       -D gallium-va=enabled \
       -D gbm=enabled \
       -D gles1=disabled \
       -D gles2=enabled \
       -D glvnd=enabled \
       -D glx=dri \
       -D libunwind=enabled \
       -D llvm=enabled \
       -D lmsensors=enabled \
       -D valgrind=disabled \
       -D vulkan-layers=device-select,overlay,anti-lag \
       -D tools=[] \
       -D zstd=enabled \
       -D microsoft-clc=disabled \
       -D video-codecs=all \
       -D gallium-rusticl=true \
       -D gallium-rusticl-enable-drivers=radeonsi \
       -D rust_std=2021

    meson configure --no-pager _build
    ninja $NINJAFLAGS -C _build
}

package_mesa-minimal-git() {
    depends=(libdrm libxxf86vm libxdamage libxshmfence libelf
                        libunwind libglvnd wayland lm_sensors vulkan-icd-loader
                        zstd llvm-libs-minimal-git zlib expat libxext libxcb systemd-libs
                        glibc libx11 libxfixes gcc-libs
                        xcb-util-keysyms spirv-tools libdisplay-info
    )
    conflicts+=("opencl-mesa<$pkgver-$pkgrel")

    DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C _build install

    # remove script file from /usr/bin
    # https://gitlab.freedesktop.org/mesa/mesa/issues/2230
    rm "${pkgdir}/usr/bin/mesa-overlay-control.py"
    rmdir "${pkgdir}/usr/bin"

    # rusticl files go to a separate package
    mkdir -p "$srcdir"/rusticl/{etc/OpenCL/vendors,usr/lib} 
    mv "$pkgdir"/etc/OpenCL/vendors/rusticl.icd "$srcdir"/rusticl/etc/OpenCL/vendors
    mv "$pkgdir"/usr/lib/libRusticlOpenCL* "$srcdir"/rusticl/usr/lib

    # indirect rendering
    ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"
  
    install -m644 -Dt "$pkgdir"/usr/share/licenses/$pkgname mesa/docs/license.rst
}

# I dislike splitting packages, but rusticl has several dependencies that are not needed by other mesa components
package_opencl-mesa-minimal-git() {
    pkgdesc="OpenCL support in rust for mesa drivers (git version)"
    conflicts=(opencl-mesa opencl-rusticl-mesa-minimal-git)
    provides=(opencl-mesa opencl-driver)
    depends=(libdrm spirv-llvm-translator-minimal-git libclc-minimal-git spirv-tools
                    mesa-minimal-git=$pkgver-$pkgrel llvm-libs-minimal-git clang-libs-minimal-git
                    expat libelf zstd lm_sensors zlib gcc-libs glibc clang-opencl-headers-minimal-git
    )
    
    cp --preserve --recursive "$srcdir"/rusticl/* "$pkgdir"/
        install -m644 -Dt "$pkgdir"/usr/share/licenses/$pkgname mesa/docs/license.rst
}
