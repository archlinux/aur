# Maintainer: Vendicated <vendicated@riseup.net>
# Maintainer: Kylie C <kyliepc@proton.me>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: HentaiShiroYuki <hentaishiroyuki at gmail dot com>
# Contributor: Sofia Lima
pkgname=vesktop-bin
_pkgname=vesktop
_appname=vencord-desktop
pkgver=1.6.9
pkgrel=1
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

source_aarch64=("${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-arm64.tar.gz")
source_x86_64=("${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
source=(
    "${_pkgname}.sh"
    "${_pkgname}.desktop"
    "${_ghurl}/raw/refs/tags/v${pkgver}/build/icon.svg"
)
noextract=("${_pkgname}-${pkgver}.tar.gz" "${_pkgname}-${pkgver}-arm64.tar.gz")
sha256sums=('db901fa9af0ce812f48ecba9c338162bd5b12f6586fefca2bc6b6509430ea351'
            '455c00b862aa0a7e18ca8e23d65d5c5ee4506cdfb15f1bf6f622cce39827de46'
            '7d0f9dbdb3c86f800577d7fb26a22defeb7025d10c405f634d3c2b939a75be7f')
sha256sums_aarch64=('f099fab284a7319ad42c6ae28dc7a8e503db0570ccfcaefebd615dd7700a2f93')
sha256sums_x86_64=('c9eabe5e0a6dc1ee3f48a32f9b876ecbf938738fef1a76bc2350eb82f3bc8517')

prepare() {
    sed -i -e "
        s/@appname@/${_pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${_pkgname}.sh"
}
package() {
	local archive="${_pkgname}-${pkgver}.tar.gz"
	[[ "$CARCH" == aarch64 ]] && archive="${_pkgname}-${pkgver}-arm64.tar.gz"

    mkdir -p "$pkgdir/opt/${_pkgname}"
    tar -xf "$archive" -C "$pkgdir/opt/${_pkgname}" --strip-components=1 --exclude='*app-update.yml'
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}" # Start script
    install -Dm644 "icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg" # Install icons
    install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop" # Install desktop entry
}
