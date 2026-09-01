# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: HentaiShiroYuki <hentaishiroyuki at gmail dot com>
# Contributor: Sofia Lima
pkgname=vesktop-bin
_pkgname=vesktop
_appname=vencord-desktop
pkgver=1.6.7
pkgrel=2
pkgdesc="A cross platform electron-based desktop app aiming to give you a snappier Discord experience with Vencord pre-installed."
arch=(
    'aarch64'
    'x86_64'
)
url="https://vesktop.dev/"
_ghurl="https://github.com/Vencord/Vesktop"
license=('GPL-3.0-or-later')
provides=(
    "${_pkgname}=${pkgver}"
    "${_appname}=${pkgver}"
)
conflicts=(
    "${_pkgname}"
    "${_appname}"
)
depends=('alsa-lib' 'gtk3' 'nss')
optdepends=(
    'speech-dispatcher: High-level device independent layer for speech synthesis interface'
    'libnotify: Notifications'
    'xdg-utils: Open links, files, etc'
)

source_aarch64=("${_pkgname}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-arm64.tar.gz")
source_x86_64=("${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
source=(
    "${_pkgname}.sh"
    "${_pkgname}.desktop"
    "https://raw.githubusercontent.com/Vencord/Vesktop/refs/heads/main/build/icon.svg"
)
noextract=("${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('642473098904feb424aafc0d97d33d20d8c2596186cdfc6e9866fa6bfc6d531d')
sha256sums_x86_64=('0569c8a8956f161a28b82c6fba667e7ee6828df8856247f5c08f18c1b1b0b8fc')

prepare() {
    sed -i -e "
        s/@appname@/${_pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${_pkgname}.sh"
}
package() {
    mkdir -p "$pkgdir/opt/${_pkgname}"
    tar -xf "$srcdir/${_pkgname}-${pkgver}.tar.gz" -C "$pkgdir/opt/${_pkgname}" --strip-components=1 --exclude='*app-update.yml'
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}" # Start script
    install -Dm644 "icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg" # Install icons
    install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop" # Install desktop entry
}
