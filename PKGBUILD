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
pkgname=(mesa-minimal-git opencl-rusticl-mesa-minimal-git)
pkgdesc="an open-source implementation of the OpenGL specification, stripped down git version"
pkgver=24.0.0_devel.181605.fde43e44e9f
pkgrel=1
arch=('x86_64')
makedepends=(git meson ninja libglvnd python-mako xorgproto libxml2 libx11  libva elfutils libxrandr
                            wayland-protocols glslang llvm-minimal-git libdrm libclc-minimal-git clang-minimal-git
                            rust rust-bindgen spirv-tools-git spirv-llvm-translator-minimal-git libvdpau systemd-libs)
# In order to keep the package simple and ease troubleshooting only use one llvm implementation
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=(mesa vulkan-intel vulkan-radeon vulkan-mesa-layer libva-mesa-driver vulkan-swrast mesa-vdpau vulkan-driver opengl-driver)
conflicts=(mesa vulkan-intel vulkan-radeon vulkan-mesa-layer libva-mesa-driver vulkan-swrast mesa-vdpau)
# mixing components from different mesa versions is a bad idea, conflict with everything unique provided by extra/mesa
url="https://www.mesa3d.org"
license=('custom')
source=("mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git"
                'LICENSE'
)
md5sums=('SKIP'
         '5c65a0fe315dd347e09b1f2826a1df5a')
sha512sums=('SKIP'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2')
options=(!emptydirs)

# ninja grabs all available cores and leaves almost nothing for other processes.
# this package uses the environment variable NINJAFLAGS to allow the user to change this behaviour
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
       -D b_lto=true \
       -D buildtype=plain \
       --wrap-mode=nofallback \
       -D rust_std=2021 \
       -D prefix=/usr \
       -D sysconfdir=/etc \
       -D platforms=x11,wayland \
       -D gallium-drivers=radeonsi,swrast,iris,zink,virgl \
       -D vulkan-drivers=amd,intel,swrast \
       -D dri3=enabled \
       -D egl=enabled \
       -D gallium-extra-hud=true \
       -D gallium-nine=false \
       -D gallium-omx=disabled \
       -D gallium-va=enabled \
       -D gallium-vdpau=enabled \
       -D gallium-xa=disabled \
       -D gbm=enabled \
       -D gles1=disabled \
       -D gles2=enabled \
       -D glvnd=true \
       -D glx=dri \
       -D libunwind=enabled \
       -D llvm=enabled \
       -D lmsensors=enabled \
       -D osmesa=false \
       -D shared-glapi=enabled \
       -D gallium-opencl=disabled \
       -D valgrind=disabled \
       -D vulkan-layers=device-select,overlay \
       -D tools=[] \
       -D zstd=enabled \
       -D microsoft-clc=disabled \
       -D video-codecs=all \
       -D gallium-rusticl=true \
       -D rust_std=2021 \
       -D opencl-external-clang-headers=disabled

    meson configure --no-pager _build
    ninja $NINJAFLAGS -C _build
}

package_mesa-minimal-git() {
    depends=(libdrm libxxf86vm libxdamage libxshmfence libelf
                        libunwind libglvnd wayland lm_sensors vulkan-icd-loader
                        zstd llvm-libs-minimal-git zlib expat libxext libxcb systemd-libs
                        glibc libx11 libxfixes gcc-libs
                        xcb-util-keysyms
    )

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
  
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}

# I dislike splitting packages, but rusticl has several dependencies that are not needed by other mesa components
package_opencl-rusticl-mesa-minimal-git() {
    pkgdesc="OpenCL support in rust for mesa drivers (git version)"
    conflicts=(opencl-clover-mesa opencl-rusticl-mesa)
    provides=(opencl-rusticl-mesa opencl-driver)
    depends=(libdrm spirv-llvm-translator-minimal-git libclc-minimal-git spirv-tools-git
                    mesa-minimal-git=$pkgver-$pkgrel llvm-libs-minimal-git clang-libs-minimal-git
                    expat libelf zstd lm_sensors zlib gcc-libs glibc
    )
    
    
    cp --preserve --recursive "$srcdir"/rusticl/* "$pkgdir"/
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
