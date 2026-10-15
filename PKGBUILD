_pkgname=gamescope
pkgname=${_pkgname}-sk
# Fixed release-candidate snapshot: Valve 3.16.31 plus SKOS patches; not a release tag.
_commit=d465650e100774ef6cc877c788cd65eab32556a6
pkgver=3.16.31.sk1rc1.gd465650e
pkgrel=1
pkgdesc='SteamOS session compositing window manager'
arch=(x86_64)
url=https://github.com/SkorionOS/gamescope
license=(BSD-2-Clause BSD-3-Clause MIT LicenseRef-Reshade)
depends=(
    gcc-libs
    glibc
    hwdata
    glm
    lcms2
    libavif
    libcap.so
    libdecor
    'libdrm>=2.4.129'
    libei
    libinput
    libpipewire-0.3.so
    libx11
    libxcb
    libxcomposite
    libxcursor
    libxdamage
    libxext
    libxfixes
    libxi
    libxkbcommon.so
    'libxkbcommon>=1.8.0'
    libxmu
    libxrender
    libxres
    libxtst
    libxxf86vm
    luajit
    'pixman>=0.46.0'
    sdl2
    seatd
    systemd-libs
    vulkan-icd-loader
    'wayland>=1.24.0'
    xcb-util-errors
    xcb-util-wm
    xorg-server-xwayland
)
makedepends=(
    benchmark
    catch2
    cmake
    gcc
    git
    glslang
    meson
    pkgconf
    python
    ninja
    vulkan-headers
    'wayland-protocols>=1.47'
)
source=(
    git+https://github.com/SkorionOS/gamescope.git#commit=${_commit}
    git+https://gitlab.freedesktop.org/emersion/libdisplay-info.git
    git+https://gitlab.freedesktop.org/emersion/libliftoff.git
    git+https://github.com/ValveSoftware/openvr.git
    git+https://github.com/Joshua-Ashton/reshade.git
    git+https://github.com/KhronosGroup/SPIRV-Headers.git
    git+https://github.com/Joshua-Ashton/vkroots.git
    git+https://gitlab.freedesktop.org/wlroots/wlroots.git
)


b2sums=('2b65449da22efcbdcada1956bb4fe9b5855afb32d3265553dfede6cafba6e8f3372d604a97a67b6fb8612016d70985694bacbb7d07c094bef2ed150f4cee5775'
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

    for submodule in src/reshade subprojects/{libdisplay-info,libliftoff,openvr,vkroots,wlroots} thirdparty/SPIRV-Headers ; do
        git submodule init ${submodule}
        git config submodule.${submodule}.url ../${submodule##*/}
    done

    git -c protocol.file.allow=always submodule update

    meson subprojects download glm stb

}

build() {
    export LDFLAGS="$LDFLAGS -lrt"
    arch-meson gamescope build \
        -Dforce_fallback_for=glm,stb,libdisplay-info,libliftoff,vkroots,wlroots \
        -Dpipewire=enabled \
        -Ddrm_backend=enabled \
        -Dsdl2_backend=enabled \
        -Davif_screenshots=enabled \
        -Denable_openvr_support=true \
        -Drt_cap=enabled \
        -Dinput_emulation=enabled \
        -Denable_gamescope_wsi_layer=true \
        -Denable_tests=true
    meson compile -C build
}

check() {
    meson test -C build --suite gamescope --print-errorlogs
}

package() {
    DESTDIR="${pkgdir}" meson install -C build \
    --skip-subprojects

    cd "$srcdir/$_pkgname"
    local _licensedir="${pkgdir}/usr/share/licenses/$pkgname"
    install -Dm 644 LICENSE -t "$_licensedir/"
    for project in openvr wlroots libdisplay-info libliftoff; do
        install -Dm 644 "subprojects/$project/LICENSE" "$_licensedir/LICENSE.$project"
    done
    install -Dm 644 subprojects/glm/copying.txt "$_licensedir/LICENSE.glm"
    install -Dm 644 subprojects/stb/LICENSE "$_licensedir/LICENSE.stb"
    install -Dm 644 subprojects/vkroots/LICENSES/MIT.txt "$_licensedir/LICENSE.vkroots"
    install -Dm 644 thirdparty/SPIRV-Headers/LICENSE "$_licensedir/LICENSE.SPIRV-Headers"
    install -Dm 644 src/shaders/NVIDIAImageScaling/licence.txt "$_licensedir/LICENSE.NVIDIAImageScaling"

    # Preserve the original notice text embedded in these compiled sources.
    grep -q '^// This file was generated with a script\.' thirdparty/sol/sol.hpp
    sed '/^\/\/ This file was generated with a script\./,$d' thirdparty/sol/sol.hpp \
        > "$_licensedir/LICENSE.sol2"
    sed -n '/^\/\*$/,/^\*\/$/ { p; /^\*\/$/q; }' subprojects/openvr/src/jsoncpp.cpp \
        > "$_licensedir/LICENSE.openvr-jsoncpp"
    grep -q 'Copyright (c) 2013-2020 Rapptz, ThePhD and contributors' "$_licensedir/LICENSE.sol2"
    grep -q '(END LICENSE TEXT)' "$_licensedir/LICENSE.openvr-jsoncpp"
    grep -q '^// ABOUT' src/shaders/ffx_a.h
    sed '/^\/\/ ABOUT/,$d' src/shaders/ffx_a.h > "$_licensedir/LICENSE.FidelityFX"
    sed -n '/^\/\*$/,/^\*\/$/ { p; /^\*\/$/q; }' src/shaders/sgsr1.h \
        > "$_licensedir/LICENSE.SGSR"
    grep -q 'Copyright (c) 2014 Michal Drobot' "$_licensedir/LICENSE.FidelityFX"
    grep -q 'SPDX-License-Identifier: BSD-3-Clause' "$_licensedir/LICENSE.SGSR"
    chmod 644 "$_licensedir/LICENSE.sol2" "$_licensedir/LICENSE.openvr-jsoncpp" \
        "$_licensedir/LICENSE.FidelityFX" "$_licensedir/LICENSE.SGSR"
}
