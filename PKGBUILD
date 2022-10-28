# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='oh-my-posh'
pkgname="${_pkgname}-bin"
pkgver=12.9.1
pkgrel=1
pkgdesc="A prompt theme engine for any shell."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/JanDeDobbeleer/oh-my-posh"
license=('MIT')
makedepends=('curl' 'grep' 'sed' 'unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('de94520a97610ece1c9b7b54e2eb4517cf16c1ac3999fdef1ffb90e742797ec8'
            'a5308c4e51268229a039ec4ec9a251a4cdb89d9380383e6e13aeba64a74f19ad')
sha256sums_x86_64=('d48e7070d626784d12bcd7b19fe127bfd274a1681207a513e240af17ab9ea005')
sha256sums_armv7h=('b92a620009733fbe1f53856b40de2857847b58fea7b3bcc15f6a07a6067c4fd4')
sha256sums_aarch64=('30af6e684cf74667d0d95fb12299060657fdaaeb0839d5696b7240eaa689e8d6')
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
