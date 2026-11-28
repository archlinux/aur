# Maintainer: guitaripod
pkgname=crucible-plex
pkgver=2.16.0
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
conflicts=('crucible-plex-git' 'crucible')
options=('!lto' '!debug' '!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/linux-$pkgver.tar.gz")
sha256sums=('7302bbaf803bd28cfdacc8645aa395392a80c20088ffe73bc560909a3c510d2e')

prepare() {
    local swift
    swift="$(swift --version 2>/dev/null | sed -n 's/.*Swift version \([0-9]*\)\..*/\1/p' | head -n 1)"
    if [ -z "$swift" ] || [ "$swift" -lt 6 ]; then
        echo "Crucible needs Swift 6 or newer (swift-bin or swiftly-bin); found: $(swift --version 2>&1 | head -n 1)" >&2
        return 1
    fi
}

build() {
    cd "Crucible-linux-$pkgver"
    linux/scripts/build-mpv.sh
    linux/scripts/build-accesskit.sh
    PKG_CONFIG_PATH="$PWD/linux/.build/mpv/lib/pkgconfig" swift build -c release --product crucible --static-swift-stdlib
}

package() {
    cd "Crucible-linux-$pkgver"
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
