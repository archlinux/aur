_pkgname=gamescope
pkgname=${_pkgname}-sk
pkgver=3.16.ba123
pkgrel=1
pkgdesc='SteamOS session compositing window manager'
arch=(x86_64)
url=https://github.com/3003n/gamescope
license=(BSD)
depends=(
    gcc-libs
    glibc
    glm
    lcms2
    libavif
    libcap.so
    libdecor
    libdrm
    libinput
    libpipewire-0.3.so
    libx11
    libxcb
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxkbcommon.so
    libxmu
    libxrender
    libxres
    libxtst
    libxxf86vm
    luajit
    sdl2
    seatd
    vulkan-icd-loader
    wayland
    xcb-util-errors
    xcb-util-wm
    xorg-server-xwayland
)
makedepends=(
    benchmark
    cmake
    gcc
    git
    glslang
    meson
    pkgconf
    ninja
    vulkan-headers
    wayland-protocols
)
_tag=3.16.ba123
source=("git+https://github.com/3003n/gamescope.git#tag=${_tag}"
    "git+https://github.com/nothings/stb.git#commit=af1a5bc352164740c1cc1354942b1c6b72eacb8a"
    "git+https://github.com/bazzite-org/wlroots.git"
    "git+https://gitlab.freedesktop.org/emersion/libliftoff.git"
    "git+https://github.com/Joshua-Ashton/GamescopeShaders.git#tag=v0.1"
    "git+https://github.com/Joshua-Ashton/vkroots.git"
    "git+https://gitlab.freedesktop.org/emersion/libdisplay-info.git"
    # "git+https://github.com/ValveSoftware/openvr.git"
    "git+https://github.com/Joshua-Ashton/reshade.git"
    "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
)

b2sums=('e268e73c6fb20f5cbb97935917ad5d908bb53c83b6b2b59a7eb687207a84a75ff9cd677446748cae0fbba4ca06f7ecd6b9547f0161749e41d54b7cceda40bd04'
        'db31478999287cc5b08cc7d98d1daa43a27b339b3ad975269710bd719d30e9f1cf5ee240ee7e2a8d8551f20fa46da14acd669cb207b26a18d79b360e718ff55b'
        'SKIP'
        'SKIP'
        'ca268553bc3dacb5bd19553702cd454ea78ed97ab39d4397c5abf9a27d32633b63e0f7f7bf567b56066e6ecd979275330e629ba202a6d7721f0cd8166cd110dd'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

provides=("$_pkgname")
conflicts=("$_pkgname")
install=gamescope.install

prepare() {
    cd "$srcdir/$_pkgname"
    meson subprojects download

    git submodule init subprojects/wlroots
    git config submodule.subprojects/wlroots.url "$srcdir/wlroots"

    git submodule init subprojects/libliftoff
    git config submodule.subprojects/libliftoff.url "$srcdir/libliftoff"

    git submodule init subprojects/vkroots
    git config submodule.subprojects/vkroots.url "$srcdir/vkroots"

    git submodule init subprojects/libdisplay-info
    git config submodule.subprojects/libdisplay-info.url "$srcdir/libdisplay-info"

    # git submodule init subprojects/openvr
    # git config submodule.subprojects/openvr.url "$srcdir/openvr"

    git submodule init src/reshade
    git config submodule.src/reshade.url "$srcdir/reshade"

    git submodule init thirdparty/SPIRV-Headers
    git config submodule.thirdparty/SPIRV-Headers.url ../SPIRV-Headers

    git -c protocol.file.allow=always submodule update

    # make stb.wrap use our local clone
    rm -rf subprojects/stb
    git clone "$srcdir/stb" subprojects/stb
    cp -av subprojects/packagefiles/stb/* subprojects/stb/ # patch from the .wrap we elided
}

pkgver() {
    # cd "$srcdir/$_pkgname"
    # git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    echo "$_tag" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export LDFLAGS="$LDFLAGS -lrt"
    arch-meson gamescope build \
        -Dforce_fallback_for=stb,libliftoff,wlroots,vkroots,libdisplay-info \
        -Dpipewire=enabled \
        -Denable_openvr_support=false
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
