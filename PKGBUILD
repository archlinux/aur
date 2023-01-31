# Maintainer: Baptiste Augrain <daiyam@zokugun.org>.
# Inspired from the PKGBUILD for vscodium.

pkgname=vscodium-insiders-bin
pkgver=1.75.0.23031
pkgrel=1
pkgdesc="Binary releases of Code Insiders without branding/telemetry/licensing (binary release)"
arch=('x86_64' 'aarch64' 'armv7h')
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
source_armv7h=(
    "https://github.com/VSCodium/vscodium-insiders/releases/download/${pkgver}-insider/VSCodium-linux-armhf-${pkgver}-insider.tar.gz"
)
source_aarch64=(
    "https://github.com/VSCodium/vscodium-insiders/releases/download/${pkgver}-insider/VSCodium-linux-arm64-${pkgver}-insider.tar.gz"
)
sha256sums=('99dbc0d75aec1dbda70655fe3d9769aa2728116ae885e8be20c4b4f13ae1e80e'
            'ccd83957fc14eaeeffc56762e864a8d313f99fa480c105eaecd832fb29d075ab')
sha256sums_x86_64=('c71ecc05c5f2d42dd09fa060c49f10ec0c6c90466a8d416631ca9a797e22eb71')
sha256sums_aarch64=('e4957f14f4904111098f79157c1fa3cfc1773ff08578e1215a30bab3f12a1fa2')
sha256sums_armv7h=('3aa88c6c0a6c990956bcdf56022735d243d1d0775808116ca6afd0df8c11757c')

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
