# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=comfy-desktop-bin
pkgver=1.0.31
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
sha256sums=('956420696101ac11daff15d701ee0dc9834c68834d92bfddfbbd11c8ad7cd4b6')
sha256sums_x86_64=('b8ef2624b81c717f2d6462d4486ebd6e412518207b265eda3dbbe2539215cd94')
sha256sums_aarch64=('ba0200e05eafeec0c4ea6879f2e699f5bec979dcaf0886960173a8b69635af83')

latestver() {
    # HEAD 404s on this CDN and GitHub releases run ahead of the Linux build,
    # so read the actually-published version from the unversioned endpoint's
    # Content-Disposition filename.  --max-filesize 1 aborts after the headers.
    curl -sL --max-filesize 1 -D - -o /dev/null "${_dl_base}/linux/deb/x64" 2>/dev/null |
        sed -nE 's/.*filename="comfyui-desktop-2-([0-9]+(\.[0-9]+)*).*/\1/p' | head -1
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
