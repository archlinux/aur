# Maintainer: unicxrn

pkgname=xerahs-bin
_pkgname=xerahs
pkgver=0.33.6
pkgrel=1
pkgdesc='Cross-platform screen capture and sharing tool (stable release binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/ShareX/XerahS'
license=('GPL-3.0-or-later')
provides=('xerahs')
conflicts=('xerahs' 'xerahs-git')
# qt6-base, layer-shell-qt, libdeflate and wl-clipboard are needed by the bundled OmaSnap
# capture engine, used on Hyprland/Omarchy sessions and ignored elsewhere.
depends=('glibc' 'gcc-libs' 'fontconfig' 'icu' 'openssl' 'zlib' 'dbus' 'libx11' 'hicolor-icon-theme' 'qt6-base' 'layer-shell-qt' 'libdeflate' 'wl-clipboard')
optdepends=(
    'gnome-shell-extension-appindicator: system tray icon on GNOME'
    'ffmpeg: screen recording and video editing'
    'gst-plugin-pipewire: Wayland portal recording source'
    'gst-plugins-good: native GStreamer recording muxers'
    'gst-plugins-ugly: native GStreamer H.264 encoder'
    'xclip: X11 clipboard support'
    'xdotool: X11 window management'
    'grim: Wayland screenshot utility'
    'slurp: Wayland region selection for screenshots'
    'tesseract: OCR in the OmaSnap editor'
    'tesseract-data-eng: English OCR data for the OmaSnap editor'
)
options=('!strip' '!debug')

_raw="https://raw.githubusercontent.com/ShareX/XerahS/v$pkgver"
source=("$_pkgname-$pkgver-Logo.png::$_raw/src/desktop/app/XerahS.UI/Assets/Logo.png"
        "$_pkgname-$pkgver-LICENSE.txt::$_raw/LICENSE.txt"
        'xerahs.desktop')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/XerahS-$pkgver-linux-x64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/XerahS-$pkgver-linux-arm64.tar.gz")
noextract=("$_pkgname-$pkgver-x86_64.tar.gz" "$_pkgname-$pkgver-aarch64.tar.gz")
sha256sums=('58384ad8fc044828d2be88004990e77133b58a971b28012508f02b97bc884154'
            'c53a65c2fd561c87eaabf1072ef5dcab8653042bc15308465f52413585eb6271'
            'a353e325c68735317350165374da19152f246869ecf624f99c9a86d09aa6e311')
sha256sums_x86_64=('29ed538a6592a1cb0d2287fb5fa62054f1c5984e05e1fab7fa7e79cce9456f23')
sha256sums_aarch64=('a044f1b4905c7f9dfe855f1abe12d534d6fc242990b662787b773477f5641940')

package() {
    local dest="$pkgdir/usr/lib/$_pkgname"

    install -d "$dest"
    bsdtar -xf "$srcdir/$_pkgname-$pkgver-$CARCH.tar.gz" -C "$dest"

    local bin
    for bin in XerahS omaxerahs xerahs-watchfolder-daemon omasnap/omasnap; do
        [[ -f "$dest/$bin" ]] && chmod 755 "$dest/$bin"
    done

    if [[ -d "$dest/omasnap/licenses" ]]; then
        install -d "$pkgdir/usr/share/licenses/$pkgname/omasnap"
        cp -a "$dest/omasnap/licenses/." "$pkgdir/usr/share/licenses/$pkgname/omasnap/"
    fi

    install -d "$pkgdir/usr/bin"
    ln -s ../lib/$_pkgname/XerahS "$pkgdir/usr/bin/xerahs"
    ln -s ../lib/$_pkgname/omaxerahs "$pkgdir/usr/bin/omaxerahs"

    install -Dm644 "$_pkgname-$pkgver-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    install -Dm644 xerahs.desktop "$pkgdir/usr/share/applications/xerahs.desktop"
    install -Dm644 "$_pkgname-$pkgver-Logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/xerahs.png"
}
