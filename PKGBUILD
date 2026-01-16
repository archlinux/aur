# Maintainer: Andrew Rabert <ar@nullsum.net>
pkgname=jellyfin-desktop-cef-git
pkgver=0.r98.f3c8008
pkgrel=1
license=('GPL-2.0-only')
pkgdesc="Experimental rewrite of Jellyfin Desktop built on CEF"
arch=('x86_64')
url="https://github.com/jellyfin-labs/jellyfin-desktop-cef"
depends=(
    # CEF
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'libcups'
    'libxcomposite'
    'libxdamage'
    'libxkbcommon'
    'libxrandr'
    'nss'
    'nspr'
    'pango'

    # mpv
    'ffmpeg'
    'jack'
    'lcms2'
    'libarchive'
    'libass'
    'libdisplay-info'
    'libdrm'
    'libjpeg-turbo'
    'libpipewire'
    'libplacebo'
    'libpulse'
    'libva'
    'libvdpau'
    'mesa'
    'rubberband'
    'uchardet'
    'vulkan-icd-loader'
    'wayland'
    'zlib'

    # main
    'sdl3'
    'systemd-libs'
)
makedepends=(
    'cmake'
    'git'
    'meson'
    'ninja'
    'python'
    'vulkan-headers'
    'wayland-protocols'
)
provides=('jellyfin-desktop-cef')
conflicts=('jellyfin-desktop-cef')
_cef_version='143.0.14+gdd46a37+chromium-143.0.7499.193'
source=(
    "git+${url}.git"
    "https://cef-builds.spotifycdn.com/cef_binary_${_cef_version}_linux64_minimal.tar.bz2"
    'jellyfin-desktop-cef.desktop'
    'jellyfin-desktop-cef.svg'
)
sha256sums=('SKIP'
            '04f94018e1cec48920a57fb2307503c72fb19361578325dfd44c7d5226e7edc3'
            'd77e234748e8d8dadab9b8813f2ccf7290ce724bb43f4b7e5df7904eae84d0b1'
            'b6744d5c9f2df2dabb3ff8f01260b8dbfcb6e0e22ccccd26a936adef61132dff')
options=(!debug)

pkgver() {
    cd jellyfin-desktop-cef
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd jellyfin-desktop-cef

    git submodule update --init third_party/mpv

    ln -sf "$srcdir/cef_binary_${_cef_version}_linux64_minimal" third_party/cef
}

build() {
    # Build CEF wrapper separately - needs _FORTIFY_SOURCE removed due to -Werror
    cd "$srcdir/cef_binary_${_cef_version}_linux64_minimal"

    CFLAGS="${CFLAGS//-Wp,-D_FORTIFY_SOURCE=?/}" \
    CXXFLAGS="${CXXFLAGS//-Wp,-D_FORTIFY_SOURCE=?/}" \
    cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release

    cmake --build build --target libcef_dll_wrapper

    # Build mpv with controlled options
    cd "$srcdir/jellyfin-desktop-cef/third_party/mpv"

    local _meson_options=(
        --auto-features auto

        -Dlibmpv=true
        -Dbuild-date=false

        # Disable unneeded features
        -Dcaca=disabled
        -Dcdda=disabled
        -Ddvbin=disabled
        -Ddvdnav=disabled
        -Djavascript=disabled
        -Dlibbluray=disabled
        -Dlua=disabled
        -Dopenal=disabled
        -Dsdl2-audio=disabled
        -Dsdl2-gamepad=disabled
        -Dsdl2-video=disabled
        -Dsixel=disabled
        -Dsndio=disabled
        -Dvapoursynth=disabled
        -Dx11=disabled
        -Dxv=disabled
        -Dzimg=disabled
    )

    meson setup build --default-library=shared "${_meson_options[@]}"
    meson compile -C build

    # Build main project
    cd "$srcdir/jellyfin-desktop-cef"

    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release

    cmake --build build
}

package() {
    cd jellyfin-desktop-cef

    install -dm755 "$pkgdir/opt/jellyfin-desktop-cef"

    # Main binary
    install -m755 build/jellyfin-desktop-cef "$pkgdir/opt/jellyfin-desktop-cef/"

    # mpv library
    install -m755 build/libmpv.so.2 "$pkgdir/opt/jellyfin-desktop-cef/"

    # CEF binaries
    install -m755 build/libcef.so "$pkgdir/opt/jellyfin-desktop-cef/"
    install -m755 build/libEGL.so "$pkgdir/opt/jellyfin-desktop-cef/"
    install -m755 build/libGLESv2.so "$pkgdir/opt/jellyfin-desktop-cef/"
    install -m755 build/libvk_swiftshader.so "$pkgdir/opt/jellyfin-desktop-cef/"
    install -m755 build/libvulkan.so.1 "$pkgdir/opt/jellyfin-desktop-cef/"

    # CEF resources
    install -m644 build/*.pak "$pkgdir/opt/jellyfin-desktop-cef/"
    install -m644 build/*.dat "$pkgdir/opt/jellyfin-desktop-cef/"
    install -m644 build/*.bin "$pkgdir/opt/jellyfin-desktop-cef/"
    install -m644 build/vk_swiftshader_icd.json "$pkgdir/opt/jellyfin-desktop-cef/"

    # Locales (exclude gendered variants)
    install -dm755 "$pkgdir/opt/jellyfin-desktop-cef/locales"
    for f in build/locales/*.pak; do
        case "$f" in *_FEMININE.pak|*_MASCULINE.pak|*_NEUTER.pak) continue ;; esac
        install -m644 "$f" "$pkgdir/opt/jellyfin-desktop-cef/locales/"
    done

    # Symlink to /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/jellyfin-desktop-cef/jellyfin-desktop-cef "$pkgdir/usr/bin/jellyfin-desktop-cef"

    # Icon
    install -Dm644 "$srcdir/jellyfin-desktop-cef.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/jellyfin-desktop-cef.svg"

    # Desktop entry
    install -Dm644 "$srcdir/jellyfin-desktop-cef.desktop" \
        "$pkgdir/usr/share/applications/jellyfin-desktop-cef.desktop"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
