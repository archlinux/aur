# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=comfy-desktop-bin
pkgver=1.0.8
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
sha256sums_x86_64=('85ca6be76c15ad7e32f9203607e92ff2c507fdc104b2f77e18f08fd02760f97c')
sha256sums_aarch64=('5f03acbf155155b92b0a6fc1468958cd32540a04cb4aef497474615b15fab1b2')

latestver() {
    local versions ver
    versions=$(gh api --paginate repos/Comfy-Org/Comfy-Desktop/releases --jq \
        '.[] | select(.prerelease == false and .draft == false) | .tag_name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -rV)
    # HEAD returns 404 even for valid assets (CDN quirk); use GET with
    # --max-filesize 1 to read status from headers without downloading
    # the ~120 MB .deb body.
    for ver in $versions; do
        local code
        code=$(curl -sL -o /dev/null -w '%{http_code}' --max-filesize 1 \
            "${_dl_base}/versions/${ver}/linux/deb/x64" 2>/dev/null)
        if [[ "$code" == 200 ]]; then
            echo "$ver"
            return
        fi
    done
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
