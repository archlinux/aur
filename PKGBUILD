_pkgname=gamescope
pkgname=${_pkgname}-sk
pkgver=3.14.1.r15.g6ed7472
pkgrel=1
pkgdesc='SteamOS session compositing window manager'
arch=(x86_64)
url=https://github.com/ValveSoftware/gamescope
license=(BSD)
depends=(
    gcc-libs
    glibc
    glm
    hwdata
    libavif
    libcap.so
    libdisplay-info.so
    libdrm
    libliftoff.so
    libinput
    libpipewire-0.3.so
    libvulkan.so
    libx11
    libxcb
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxkbcommon
    libxmu
    libxrender
    libxres
    libxtst
    libxxf86vm
    seatd
    sdl2
    vulkan-icd-loader
    wayland
    xcb-util-wm
    xcb-util-errors
    xorg-server-xwayland
)
makedepends=(
    benchmark
    cmake
    git
    glslang
    meson
    ninja
    vulkan-headers
    wayland-protocols
    openvr-git
)
_tag=62d425164d383fcde498b17b0af5d00bfa92aed4
source=("git+https://github.com/3003n/gamescope.git#tag=${_tag}"
        "git+https://github.com/Joshua-Ashton/GamescopeShaders.git#tag=v0.1"
        "git+https://github.com/Joshua-Ashton/reshade.git"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
        )

b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

provides=("$_pkgname")
conflicts=("$_pkgname")

prepare() {
    cd $_pkgname
    # This really should be a pacman feature...
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        git apply "../$src"
    done
    meson subprojects download
    git submodule init src/reshade
    git config submodule.src/reshade.url "$srcdir/reshade"
    git submodule init thirdparty/SPIRV-Headers
    git config submodule.thirdparty/SPIRV-Headers.url ../SPIRV-Headers
    git -c protocol.file.allow=always submodule update
}

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export LDFLAGS="$LDFLAGS -lrt"
  arch-meson gamescope build \
    -Dforce_fallback_for=stb,libliftoff,wlroots \
    -Dpipewire=enabled \
    -Dwlroots:backends=drm,libinput,x11 \
    -Dwlroots:renderers=gles2,vulkan
  ninja -C build
}

package() {
    install -d "$pkgdir"/usr/share/gamescope/reshade
    cp -r "$srcdir"/GamescopeShaders/* "$pkgdir"/usr/share/gamescope/reshade/

    chmod -R 655 "$pkgdir"/usr/share/gamescope
    meson install -C build --skip-subprojects --destdir="${pkgdir}"

    cd "$srcdir/$_pkgname"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et: