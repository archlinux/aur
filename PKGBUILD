# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=comfy-desktop-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='Official desktop application for ComfyUI — install, run, and manage ComfyUI with GPU-ready environments'
arch=('x86_64' 'aarch64')
url='https://www.comfy.org/'
license=('MIT')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gtk3'
    'libcups'
    'libdrm'
    'libnotify'
    'libsecret'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'libxss'
    'libxtst'
    'mesa'
    'nss'
    'pango'
    'systemd-libs'
    'xdg-utils'
)
optdepends=('git: fallback for git operations if bundled pygit2 fails')
provides=('comfy-desktop')
conflicts=('comfy-desktop' 'comfyui-desktop-2-beta')
replaces=('comfyui-desktop-2-beta')
options=('!strip' '!debug')

_dl_base='https://dl.todesktop.com/241130tqe9q3y'
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/Comfy-Org/Comfy-Desktop/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${_dl_base}/versions/${pkgver}/linux/deb/x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${_dl_base}/versions/${pkgver}/linux/deb/arm64")
sha256sums=('0cea5d109b4d245ea1110c205df0f825a1088c9e45e257514c1661c7c14f7bc3')
sha256sums_x86_64=('927cc2cbd39c30626fdb2c319a6ae1d08fa8d906841e55bdcc8247bde836d4a3')
sha256sums_aarch64=('2095fe052611df9dbac09c8f618d133698dc1833af85ed09de2a685ea085f659')

latestver() {
    # electron-builder update feed — the authoritative published Linux version.
    # Small YAML, instant response, no large download.
    curl -sL "https://download.todesktop.com/241130tqe9q3y/latest-linux.yml" |
        sed -nE 's/^version: *//p'
}

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir/"

    # Prune non-target 7zip binaries
    local _7z="$pkgdir/opt/Comfy Desktop/resources/app.asar.unpacked/node_modules/7zip-bin"
    rm -rf "$_7z/mac"
    case "$CARCH" in
        x86_64)  find "$_7z/linux" -mindepth 1 -maxdepth 1 -type d ! -name x64 -exec rm -rf {} + ;;
        aarch64) find "$_7z/linux" -mindepth 1 -maxdepth 1 -type d ! -name arm64 -exec rm -rf {} + ;;
    esac

    # Remove deb-specific changelog
    rm -rf "$pkgdir/usr/share/doc"

    install -d "$pkgdir/usr/bin"
    ln -s '/opt/Comfy Desktop/comfyui-desktop-2' "$pkgdir/usr/bin/comfy-desktop"

    # License
    install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
