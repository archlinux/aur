# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='oh-my-posh'
pkgname="${_pkgname}-bin"
pkgver=8.35.0
pkgrel=1
pkgdesc="A prompt theme engine for any shell."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/JanDeDobbeleer/oh-my-posh"
license=('MIT')
makedepends=('curl' 'grep' 'sed' 'unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('2e168c2064eea0163f4cba75792600089ac8a75db5176c799064a6b5c951c95e'
            'a5308c4e51268229a039ec4ec9a251a4cdb89d9380383e6e13aeba64a74f19ad')
sha256sums_x86_64=('c4c0093b224c9d054bb1c2a2a82bef79e0813fdab170fa547a8c907c16b9b1bc')
sha256sums_armv7h=('6c5eddc0ddd3741cd6ca5d6c9db29baad435a76c2fe4a767324fcc6893f13a27')
sha256sums_aarch64=('e3216d7841eeba9dd23ea0998e8109479d40c469b905e0501892a8bdb7c9ec6c')
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
    install -Dm 644 "LICENSE-${sha256sums[1]}" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    if [[ "$CARCH" = 'x86_64' ]]; then
        install -Dm 755 "${srcdir}/posh-linux-amd64-${sha256sums_x86_64}" "${pkgdir}/usr/bin/oh-my-posh"
    elif [[ "$CARCH" = 'armv7h' ]]; then
        install -Dm 755 "${srcdir}/posh-linux-arm-${sha256sums_armv7h}" "${pkgdir}/usr/bin/oh-my-posh"
    elif [[ "$CARCH" = 'aarch64' ]]; then
        install -Dm 755 "${srcdir}/posh-linux-arm64-${sha256sums_aarch64}" "${pkgdir}/usr/bin/oh-my-posh"
    fi

    mkdir -p "${pkgdir}/usr/share/oh-my-posh/themes"
    unzip "${srcdir}/themes-${sha256sums}.zip" -d "${pkgdir}/usr/share/oh-my-posh/themes"
}
