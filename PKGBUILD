# Maintainer: Ben Leynen <leynenben@gmail.com>

pkgname=rune-ide-bin
_pkgname=rune
_binaryname=rune
pkgdesc="Fast, GPU-rendered, keyboard-driven IDE for power users"
pkgver=1.3.2
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/unstablebuild/rune"
license=('GPL-3.0-or-later')
# prebuilt Go binary: stripping/splitting debuginfo doesn't apply and
# debugedit fails to parse its DWARF, producing a useless debug package
options=('!strip' '!debug')
depends=(
    'libx11'
    'libxcursor'
    'libxext'
    'libxfixes'
    'libxi'
    'libxinerama'
    'libxrandr'
    'libxrender'
    'libxxf86vm'
    'libglvnd'
)
conflicts=('rune-ide')

source_x86_64=(
    "$pkgname-$pkgver-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz"
)
source_aarch64=(
    "$pkgname-$pkgver-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz"
)
source=(
    "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
)

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('b2d06bb396f8eb61cd3654e3727c84933c0ad7a80c8aa9fa92da90ea715a5fff')
sha256sums_aarch64=('99b35fdf2c5fa2a2924fd6d183255479514cbf99e9b006392a4d4e7e1d35449e')

package() {
    # upstream ships a self-contained "rune.app" bundle, kept under /opt
    # with the same layout; the shell rc files that used to live in
    # share/zdot are embedded in the binary since 1.3
    local _appdir="/opt/${pkgname}/${_pkgname}.app"
    install -D -m0755 "${srcdir}/${_pkgname}.app/bin/${_binaryname}" "${pkgdir}${_appdir}/bin/${_binaryname}"

    install -d "${pkgdir}/usr/bin"
    ln -s "${_appdir}/bin/${_binaryname}" "${pkgdir}/usr/bin/${_binaryname}"

    # renamed from upstream's rune.desktop: the unrelated AUR package
    # "rune" (a Loki Entertainment game) already owns that filename under
    # /usr/share/applications/
    install -D -m0644 "${srcdir}/${_pkgname}.app/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/rune-ide.desktop"
    install -D -m0644 "${srcdir}/${_pkgname}.app/share/icons/hicolor/512x512/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -D -m0644 "${srcdir}/${_pkgname}.app/share/icons/hicolor/1024x1024/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"

    install -D -m0644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
