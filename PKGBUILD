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

pkgbase=mesa-nollvm-git
pkgname=(mesa-nollvm-git)
pkgdesc="an open-source implementation of the OpenGL specification, git version that doesn't use llvm"
pkgver=26.2.0_devel.222348.d08d345686c
pkgrel=1
arch=('x86_64')
makedepends=(git meson ninja libglvnd python-packaging python-mako xorgproto libxml2 libx11  libva elfutils libxrandr
                            wayland-protocols glslang libdrm systemd-libs
                            python-ply libunwind libxdamage vulkan-icd-loader xcb-util-keysyms python-pyaml libdisplay-info libpng)
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=(mesa vulkan-radeon vulkan-mesa-layers libva-mesa-driver vulkan-virtio vulkan-driver opengl-driver vulkan-mesa-implicit-layers)
conflicts=(mesa vulkan-intel vulkan-radeon vulkan-mesa-layers libva-mesa-driver vulkan-swrast mesa-vdpau vulkan-virtio
                vulkan-nouveau mesa-libgl vulkan-gfxstream vulkan-dzn vulkan-mesa-implicit-layers opencl-mesa
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
       -D prefix=/usr \
       -D sysconfdir=/etc \
       -D platforms=x11,wayland \
       -D gallium-drivers=radeonsi,zink,virgl,softpipe \
       -D vulkan-drivers=amd \
       -D egl=enabled \
       -D gallium-extra-hud=true \
       -D gallium-va=enabled \
       -D gbm=enabled \
       -D gles1=disabled \
       -D gles2=enabled \
       -D glvnd=enabled \
       -D glx=dri \
       -D libunwind=enabled \
       -D llvm=disabled \
       -D lmsensors=enabled \
       -D valgrind=disabled \
       -D vulkan-layers=device-select,overlay,screenshot,anti-lag,vram-report-limit \
       -D tools=[] \
       -D zstd=enabled \
       -D microsoft-clc=disabled \
       -D video-codecs=all \

    meson configure --no-pager _build
    ninja $NINJAFLAGS -C _build
}

package_mesa-nollvm-git() {
    depends=(libdrm libxxf86vm libxdamage libxshmfence libelf
                        libunwind libglvnd wayland lm_sensors vulkan-icd-loader
                        zstd zlib expat libxext libxcb systemd-libs
                        glibc libx11 libxfixes gcc-libs spirv-tools
                        xcb-util-keysyms libdisplay-info libpng
    )
    optdepends=('python: for some commands')

    DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C _build install

    # indirect rendering
    ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"
  
    install -m644 -Dt "$pkgdir"/usr/share/licenses/$pkgname mesa/docs/license.rst
}
