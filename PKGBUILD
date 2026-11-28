# Maintainer: guitaripod
pkgname=crucible-plex-git
pkgver=2.16.0.r1333.gef07989d
pkgrel=1
pkgdesc="Plex client in the Apple TV design, with Liquid Glass and HDR video (Wayland, Vulkan)"
arch=('x86_64')
url="https://github.com/guitaripod/Crucible"
license=('GPL-3.0-only')
depends=('vulkan-icd-loader' 'wayland' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'pango' 'cairo' 'fontconfig' 'libjpeg-turbo' 'libpng' 'libwebp' 'librsvg' 'giflib'
         'libsecret' 'qrencode' 'systemd-libs' 'ffmpeg' 'libass' 'shaderc' 'lcms2' 'libplacebo' 'pipewire' 'xdg-utils' 'sqlite' 'curl' 'openssl' 'libxml2' 'sdl3')
optdepends=('noto-fonts-emoji: emoji in comments, reactions and titles drawn in colour'
            'yt-dlp: YouTube and other web video'
            'deno: lets yt-dlp read YouTube'
            'noto-fonts-cjk: Chinese, Japanese and Korean titles and names')
makedepends=('git' 'meson' 'ninja' 'patchelf' 'imagemagick' 'vulkan-headers' 'swift-language' 'cargo')
provides=('crucible-plex')
conflicts=('crucible-plex' 'crucible')
options=('!lto' '!debug' '!strip')
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
    local swift
    swift="$(swift --version 2>/dev/null | sed -n 's/.*Swift version \([0-9]*\)\..*/\1/p' | head -n 1)"
    if [ -z "$swift" ] || [ "$swift" -lt 6 ]; then
        echo "Crucible needs Swift 6 or newer (swift-bin or swiftly-bin); found: $(swift --version 2>&1 | head -n 1)" >&2
        return 1
    fi
}

pkgver() {
    cd Crucible
    local version
    version="$(sed -n 's/.*static let version = "\(.*\)"/\1/p' linux/Sources/CrucibleApp/main.swift)"
    printf "%s.r%s.g%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd Crucible
    linux/scripts/build-mpv.sh
    linux/scripts/build-accesskit.sh
    PKG_CONFIG_PATH="$PWD/linux/.build/mpv/lib/pkgconfig" swift build -c release --product crucible --static-swift-stdlib
}

package() {
    cd Crucible
    local bin lib
    bin="$(PKG_CONFIG_PATH="$PWD/linux/.build/mpv/lib/pkgconfig" swift build -c release --product crucible --static-swift-stdlib --show-bin-path)"
    lib="$pkgdir/usr/lib/crucible"
    install -Dm755 "$bin/crucible" "$lib/crucible"
    for bundle in "$bin"/*.bundle "$bin"/*.resources; do
        [ -e "$bundle" ] && cp -rL "$bundle" "$lib/"
    done
    cp -P linux/.build/mpv/lib/libmpv.so* linux/.build/mpv/lib/libplacebo.so* "$lib/"
    patchelf --set-rpath '$ORIGIN' "$lib/crucible"
    install -dm755 "$pkgdir/usr/bin"
    ln -s /usr/lib/crucible/crucible "$pkgdir/usr/bin/crucible"
    for size in 64 128 256 512; do
        install -dm755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        magick linux/Resources/org.guitaripod.Crucible.png -resize "${size}x${size}" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/org.guitaripod.Crucible.png"
    done
    install -Dm644 linux/packaging/org.guitaripod.Crucible.desktop "$pkgdir/usr/share/applications/org.guitaripod.Crucible.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
