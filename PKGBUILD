# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
pkgname=zalo-for-linux-git
pkgdesc="Zalo for Linux — unofficial port with ZaDark, running on system Electron 22"
arch=('x86_64')
url="https://github.com/doandat943/zalo-for-linux"
license=('MIT')
pkgver=26.8.20+26.2.1.r99.87b0696
pkgrel=1
provides=('zalo')
conflicts=('zalo' 'zalo-for-linux-bin')

depends=(
    'electron22-bin'
    'glibc'
    'sqlite'
    'zlib'
    'xz'
    'openssl'
    'hicolor-icon-theme'
)

makedepends=(
    'git' 'nodejs' 'npm' 'python' 'make'
    'gcc' '7zip' 'rust'
    # zcall-bridge: build the Wine call engine, same as upstream ZaDark AppImage
    'mingw-w64-gcc'    # pipebridge.exe
    'gcc-multilib'     # streamproxy.so (32-bit)
    'lib32-glibc' 'lib32-libx11' 'lib32-libxcb' 'lib32-libxext'
)

optdepends=(
    'wl-clipboard: paste images from clipboard on Wayland'
    'xclip: paste images from clipboard on X11'
    'deepin-screen-recorder: Screenshot without/with Zalo window button'
    'spectacle: Screenshot without/with Zalo window button'
    'flameshot: Screenshot without/with Zalo window button'
    'gnome-screenshot: Screenshot without/with Zalo window button'
    'xfce4-screenshooter: Screenshot without/with Zalo window button'
    'mate-screenshot: Screenshot without/with Zalo window button'
    'scrot: Screenshot without/with Zalo window button'
    'wine: Voice/Video call engine support (or download portable wine in-app)'
    'v4l-utils: control camera formats (fix inverted/green camera)'
    'v4l2loopback-dkms: loopback camera support'
    'xorg-server-xvfb: headless X server for Wayland screen-sharing bridge'
    'python-dbus: required by the Wayland screen-sharing bridge (zcall-bridge/screenbridge.py)'
    'xdotool: window resizing for screen bridge display'
    'gst-plugins-base: 64-bit GStreamer plugins (ximagesink) for screen bridge'
    'gst-plugins-bad: 64-bit GStreamer plugins (pipewiresrc) for screen bridge'
    'python-gobject: required by the Wayland screen-sharing bridge (zcall-bridge/screenbridge.py)'
    'lib32-glibc: 32-bit runtime for the Wayland screen-share shim (zcall-bridge/streamproxy.so, pulled in by wine)'
    'lib32-libx11: 32-bit X11 for the Wayland screen-share shim (pulled in by wine)'
    'lib32-libxcb: 32-bit XCB for the Wayland screen-share shim (pulled in by wine)'
)

options=(!strip !debug)

source=(
    "$pkgname::git+https://github.com/doandat943/zalo-for-linux.git"
    "integrate-zadark.js"
    "zalo.sh"
    "zalo.desktop"
)
sha256sums=(
    'SKIP'
    'd88b81e287f303e0824b37a9778f92c223ff946b31c81c699e9fde3fe436b762'
    '277f7b54fc65deb7d524537ac73a110c23aab771aabff092d19c114abd305c91'
    '9c692898a06c7d311e1cd2cbe53a4b0a0e5b46a42c69c8320318dce12d48bb47'
)

pkgver() {
    local _src="$srcdir/$pkgname"
    if [[ ! -d $_src/.git ]]; then
        echo 'git source not extracted yet; run makepkg -o first' >&2
        return 1
    fi
    cd "$_src"
    git submodule update --init --recursive plugins/zadark >&2
    local _zadark
    _zadark=$(sed -n 's/.*"version": *"\([^"]*\)".*/\1/p' plugins/zadark/package.json | head -1)
    local _zalo
    _zalo=$(git describe --tags --abbrev=0)
    printf '%s+%s.r%s.%s' "$_zalo" "$_zadark" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$pkgname"
    
    # Zalo version = repo's latest tag, same number as the DMG on zadn.vn
    export ZALO_VERSION="$(git describe --tags --abbrev=0)"
    export ZADARK_VERSION="$(node -p "require('./plugins/zadark/package.json').version")"
    
    # npm >= 12 blocks git deps (crx in zadark's lockfile) — allow-git=all
    # scripts skipped, so fetch sqlite3's N-API v6 prebuilt manually
    export npm_config_allow_git="all"
    npm ci --ignore-scripts --no-audit --no-fund
    (cd node_modules/sqlite3 && npx prebuild-install -r napi)
    
    node scripts/download-dmg.js
    node scripts/prepare-zadark.js
    node scripts/prepare-app.js
    node scripts/setup-zcall-bridge.js
    node "$srcdir/integrate-zadark.js"
}

package() {
    cd "$srcdir/$pkgname"
    local _lib="$pkgdir/usr/lib/zalo"
    
    install -d "$_lib" "$_lib/plugins"
    # Strip Mach-O/PE natives from the DMG: Linux bindings always sit under a
    # path containing "linux"; keep qt-call-and-cap (the Wine call engine).
    find app/native/nativelibs -type f \( -name '*.node' -o -name '*.dylib' \
    -o -name '*.exe' -o -name '*.dll' \) ! -path '*linux*' -delete
    find app/native/nativelibs -type d -empty -delete
    cp -a main.js package.json app zcall-bridge "$_lib/"
    for _plugin in zalux screenshot launcher-badge userscripts zcall-bridge; do
        cp -a "plugins/$_plugin" "$_lib/plugins/"
    done
    # Ship the zadark submodule without its dev node_modules.
    cp -a plugins/zadark "$_lib/plugins/"
    # ps-list's vendored Windows exes are unused on Linux (reads /proc).
    find "$_lib/plugins/zadark" -type f \( -name '*.exe' -o -name '*.dylib' \
    -o -name '*.dll' \) -delete
    rm -rf "$_lib/plugins/zadark/node_modules"
    
    install -Dm755 "$srcdir/zalo.sh" "$pkgdir/usr/bin/zalo"
    install -Dm644 "$srcdir/zalo.desktop" "$pkgdir/usr/share/applications/zalo.desktop"
    install -Dm644 app/pc-dist/favicon-512x512.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/zalo.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
