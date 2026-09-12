# Maintainer: Ben Leynen <leynenben@gmail.com>

pkgname=rune-ide-bin
_pkgname=rune
_binaryname=rune
pkgdesc="Fast, GPU-rendered, keyboard-driven IDE for power users"
pkgver=1.2.1
pkgrel=2
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
sha256sums_x86_64=('9cf17cca71172c7dcf3094e2837b21ebdc504920546cb8b87d7cd8e1f32f2400')
sha256sums_aarch64=('a07cb3ca75b299aa5609a909f6b5f24c01b3f3c5b08c4164a8e120d343557af1')

package() {
    # upstream ships a self-contained "rune.app" bundle (bin/, share/) whose
    # binary locates share/ relative to its own path, so the tree is kept
    # intact under /opt rather than split across the usual FHS locations
    install -D -m0755 "${srcdir}/${_pkgname}.app/bin/${_binaryname}" "${pkgdir}/opt/${pkgname}/bin/${_binaryname}"

    for f in .zlogin .zprofile .zshenv .zshrc; do
        install -D -m0644 "${srcdir}/${_pkgname}.app/share/zdot/$f" "${pkgdir}/opt/${pkgname}/share/zdot/$f"
    done

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/bin/${_binaryname}" "${pkgdir}/usr/bin/${_binaryname}"

    # renamed from upstream's rune.desktop: the unrelated AUR package
    # "rune" (a Loki Entertainment game) already owns that filename under
    # /usr/share/applications/
    install -D -m0644 "${srcdir}/${_pkgname}.app/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/rune-ide.desktop"
    install -D -m0644 "${srcdir}/${_pkgname}.app/share/icons/hicolor/512x512/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -D -m0644 "${srcdir}/${_pkgname}.app/share/icons/hicolor/1024x1024/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"

    install -D -m0644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
