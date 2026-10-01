# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Lck0427 <lck0427 at hotmail dot com>

pkgname=comfy-desktop
_name=Comfy-Desktop
pkgver=1.1.4
pkgrel=1
pkgdesc="The desktop app for ComfyUI"
arch=('x86_64' 'aarch64')
url="https://github.com/Comfy-Org/Comfy-Desktop"
license=('AGPL-3.0-or-later')
_electron=electron40
depends=('bash' "${_electron}" 'glibc' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'python' 'python-pygit2')
makedepends=('gendesk' 'pnpm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh")
sha256sums=('4abbb310ffde9ce6b1b4601df9290ea4aa0eef76be445a77919841db3c3a075b'
            '392aa4a63d71a463dcf7345271eac74fb3ca867d57ae99bc47a3a90117805fdd')

prepare() {
    cd "${_name}-${pkgver}"
    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${_name/-/ }" \
        --categories 'AudioVideo;Graphics;3DGraphics;'
    sed -i "s/@ELECTRON@/${_electron}/" "${srcdir}/${pkgname}.sh"
}

build() {
    cd "${_name}-${pkgver}"
    pnpm install --frozen-lockfile
    pnpm run build
    pnpm electron-builder --linux dir \
        --config.electronDist="/usr/lib/${_electron}" \
        --config.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${_name}-${pkgver}"
    install -Dm644 dist/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r dist/linux-unpacked/resources/{app.asar.unpacked,lib} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    for size in 32 64 256 512 1024; do
        install -Dm644 "assets/Comfy_Logo_x${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

    local find_dirs=(
        -iwholename '*/arm' -o
        -iwholename '*/arm64' -o
        -iwholename '*/darwin-arm64' -o
        -iwholename '*/darwin-x64' -o
        -iwholename '*/ia32' -o
        -iwholename '*/win32-arm64' -o
        -iwholename '*/win32-x64'
    )
    find "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked/node_modules" -type d \( "${find_dirs[@]}" \) -exec rm -rf {} +
}
