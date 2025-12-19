# Maintainer: Baptiste Augrain <daiyam@zokugun.org>.
# Inspired from the PKGBUILD for vscodium.

pkgname=vscodium-insiders-bin
pkgver=1.107.18481
pkgrel=1
pkgdesc="Binary releases of Code Insiders without branding/telemetry/licensing (binary release)"
# arch=('x86_64' 'aarch64' 'armv7h')
arch=('x86_64' 'aarch64')
url='https://github.com/VSCodium/vscodium.git'
license=('MIT')

depends=(
    'fontconfig'
    'libxtst'
    'gtk3'
    'cairo'
    'alsa-lib'
    'nss'
    'libnotify'
    'libxss'
    'glibc>=2.28-4'
    'libxkbfile'
)
optdepends=(
    'gvfs: For move to trash functionality'
    'libdbusmenu-glib: For KDE global menu'
)
provides=('codium-insiders')
conflicts=(
    'vscodium-insiders'
    'vscodium-insiders-git'
)
source=(
    "${pkgname}.desktop"
    "${pkgname}-uri-handler.desktop"
)
source_x86_64=(
    "https://github.com/VSCodium/vscodium-insiders/releases/download/${pkgver}-insider/VSCodium-linux-x64-${pkgver}-insider.tar.gz"
)
# source_armv7h=(
#     "https://github.com/VSCodium/vscodium-insiders/releases/download/${pkgver}-insider/VSCodium-linux-armhf-${pkgver}-insider.tar.gz"
# )
source_aarch64=(
    "https://github.com/VSCodium/vscodium-insiders/releases/download/${pkgver}-insider/VSCodium-linux-arm64-${pkgver}-insider.tar.gz"
)
sha256sums=('99dbc0d75aec1dbda70655fe3d9769aa2728116ae885e8be20c4b4f13ae1e80e'
            'ccd83957fc14eaeeffc56762e864a8d313f99fa480c105eaecd832fb29d075ab')
sha256sums_x86_64=('9602fb2cf655255270a9b5bab7b343b05d69097824a47609626010ac3ebfcfbf')
sha256sums_aarch64=('6fcb06d16c5d0e771c979d8a27b48c32aad26c3b865520e204b99e26688f2aef')
# sha256sums_armv7h=('b6e80175290e6857196140ac33c08e0e67c14778b659703c828b120fc62ea056')

shopt -s extglob

package() {
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/{${pkgname},applications,pixmaps}
    install -d -m755 ${pkgdir}/usr/share/licenses/${pkgname}

    cp -r ${srcdir}/!(${pkgname}*.desktop|VSCodium-*-${pkgver}-insider.tar.gz) ${pkgdir}/usr/share/${pkgname}
    cp -r ${srcdir}/resources/app/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
    
    ln -s /usr/share/${pkgname}/bin/codium-insiders ${pkgdir}/usr/bin/codium-insiders
    
    install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -D -m644 ${pkgname}-uri-handler.desktop ${pkgdir}/usr/share/applications/${pkgname}-uri-handler.desktop
    install -D -m644 ${srcdir}/resources/app/resources/linux/code.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    
    # Symlink shell completions
    install -d -m755 ${pkgdir}/usr/share/zsh/site-functions
    install -d -m755 ${pkgdir}/usr/share/bash-completion/completions
    ln -s /usr/share/${pkgname}/resources/completions/zsh/_codium-insiders ${pkgdir}/usr/share/zsh/site-functions
    ln -s /usr/share/${pkgname}/resources/completions/bash/codium-insiders ${pkgdir}/usr/share/bash-completion/completions
}
