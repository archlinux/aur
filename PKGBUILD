_pkgname=gamescope
pkgname=${_pkgname}-sk
_tag=3.16.ba147.1
pkgver="$_tag"
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
# source=("git+https://github.com/3003n/gamescope.git#tag=${_tag}"
#     # "git+https://github.com/nothings/stb.git#commit=af1a5bc352164740c1cc1354942b1c6b72eacb8a"
#     "git+https://github.com/nothings/stb.git"
#     "git+https://github.com/bazzite-org/wlroots.git"
#     "git+https://gitlab.freedesktop.org/emersion/libliftoff.git"
#     "git+https://github.com/Joshua-Ashton/GamescopeShaders.git#tag=v0.1"
#     "git+https://github.com/Joshua-Ashton/vkroots.git"
#     "git+https://gitlab.freedesktop.org/emersion/libdisplay-info.git"
#     # "git+https://github.com/ValveSoftware/openvr.git"
#     "git+https://github.com/Joshua-Ashton/reshade.git"
#     "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
# )

source=(
    git+https://github.com/3003n/gamescope.git#tag=${_tag}
    git+https://gitlab.freedesktop.org/emersion/libdisplay-info.git
    git+https://gitlab.freedesktop.org/emersion/libliftoff.git
    git+https://github.com/ValveSoftware/openvr.git
    git+https://github.com/Joshua-Ashton/reshade.git
    git+https://github.com/KhronosGroup/SPIRV-Headers.git
    git+https://github.com/Joshua-Ashton/vkroots.git
    git+https://github.com/Joshua-Ashton/wlroots.git
)


b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
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

    for submodule in src/reshade subprojects/{libdisplay-info,libliftoff,vkroots,wlroots} thirdparty/SPIRV-Headers ; do
        git submodule init ${submodule}
        git config submodule.${submodule}.url ../${submodule##*/}
    done

    git -c protocol.file.allow=always submodule update

    # Fix wlroots dependency override issue
    # sed -i '/meson\.override_dependency(versioned_name, wlroots)/a meson.override_dependency('\''wlroots'\'', wlroots)' subprojects/wlroots/meson.build

    # make stb.wrap use our local clone
    # rm -rf subprojects/stb
    # git clone "$srcdir/stb" subprojects/stb
    # cp -av subprojects/packagefiles/stb/* subprojects/stb/ # patch from the .wrap we elided
}

pkgver() {
    # cd "$srcdir/$_pkgname"
    # git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    echo "$_tag" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export LDFLAGS="$LDFLAGS -lrt"
    arch-meson gamescope build \
        -Dforce_fallback_for=glm,stb,libdisplay-info,libliftoff,vkroots,wlroots \
        -Dpipewire=enabled 
    meson compile -C build
}

package() {
    # install -d "$pkgdir"/usr/share/gamescope/reshade
    # cp -r "$srcdir"/GamescopeShaders/* "$pkgdir"/usr/share/gamescope/reshade/

    # chmod -R 655 "$pkgdir"/usr/share/gamescope
    # meson install -C build --skip-subprojects --destdir="${pkgdir}"

    DESTDIR="${pkgdir}" meson install -C build \
    --skip-subprojects

    cd "$srcdir/$_pkgname"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"
}
