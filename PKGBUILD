# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='oh-my-posh'
pkgname="${_pkgname}-bin"
pkgver=15.5.0
pkgrel=1
pkgdesc="A prompt theme engine for any shell."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/JanDeDobbeleer/oh-my-posh"
license=('MIT')
makedepends=('curl' 'grep' 'sed' 'unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('6be82e6cbcacb6f67a81e539fd84a15b8051dfde2a6a3dbe5bf133f8bc05ec97'
            'a5308c4e51268229a039ec4ec9a251a4cdb89d9380383e6e13aeba64a74f19ad')
sha256sums_x86_64=('a731e8477bf361ea4d9e31a2654e9020419666ddb9c675969be95c44c91a818c')
sha256sums_armv7h=('65f96c20e306863cdca7a3f3ce847dec28cec10bcc98e2dfa135986f67fd79ff')
sha256sums_aarch64=('b768fea93f41ac57a677de2ec26c9686b80e80c3d07c23f8d4e94726c9e24853')
source=(
    "themes-${sha256sums[0]}.zip::https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/themes.zip"
    "LICENSE-${sha256sums[1]}::https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/v${pkgver}/COPYING"
)
source_x86_64=("posh-linux-amd64-${sha256sums_x86_64}::https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/posh-linux-amd64")
source_armv7h=("posh-linux-arm-${sha256sums_armv7h}::https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/posh-linux-arm")
source_aarch64=("posh-linux-arm64-${sha256sums_aarch64}::https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/posh-linux-arm64")
noextract=('themes.zip')

pkgver() {
    curl --silent -L "https://api.github.com/repos/JanDeDobbeleer/oh-my-posh/releases/latest" | # Get latest release from GitHub api
        grep '"tag_name":' |                                                                    # Get tag line
        sed -E 's/.*"([^"]+)".*/\1/' |
        sed 's/v//'
}

package() {
    install -Dm 644 "${srcdir}/LICENSE-${sha256sums[1]}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    if [[ "$CARCH" = 'x86_64' ]]; then
        install -Dm 755 "${srcdir}/posh-linux-amd64-${sha256sums_x86_64}" "${pkgdir}/usr/bin/oh-my-posh"
    elif [[ "$CARCH" = 'armv7h' ]]; then
        install -Dm 755 "${srcdir}/posh-linux-arm-${sha256sums_armv7h}" "${pkgdir}/usr/bin/oh-my-posh"
    elif [[ "$CARCH" = 'aarch64' ]]; then
        install -Dm 755 "${srcdir}/posh-linux-arm64-${sha256sums_aarch64}" "${pkgdir}/usr/bin/oh-my-posh"
    fi

    mkdir -p "${pkgdir}/usr/share/oh-my-posh/themes"
    unzip "${srcdir}/themes-${sha256sums}.zip" -d "${pkgdir}/usr/share/oh-my-posh/themes"
    find "${pkgdir}/usr/share/oh-my-posh/themes/" -type f -exec chmod 644 {} +
}
