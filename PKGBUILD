# Maintainer: Baptiste Augrain <daiyam@zokugun.org>.
# Inspired from the PKGBUILD for vscodium.

pkgname=vscodium-insiders-bin
pkgver=1.75.0.22347
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
sha256sums_x86_64=('6e83b10500467f38fcd2dce5a76c2d61d300c9f8e023ee4da6355b2e80b80da9')
sha256sums_aarch64=('6930f69f9df67306baa4d2c1a178e9dd4d0f985d050aea11f1c9a75cfc2f3f2c')
sha256sums_armv7h=('0cdea578907737e4b4896342ff6ca665e3e9739aa01e97494180f4920523b91a')

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
