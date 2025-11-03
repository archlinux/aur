# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=proton-vpn-browser-extension
pkgname=(
    'firefox-extension-proton-vpn'
    'proton-vpn-browser-extension')
pkgver=1.2.10
pkgrel=1
_commit=e621b659228f2a44e0a3f94fcb579e3f0063435e
pkgdesc='Proton VPN browser extension'
arch=('any')
url='https://protonvpn.com/'
license=('GPL-3.0-only')
makedepends=(
    'git'
    'npm'
    'zip')
source=("git+https://github.com/ProtonVPN/proton-vpn-browser-extension.git#commit=${_commit}")
sha256sums=('939cb6282b1f838b532cd2fb5ad095e4b3c49e00a782d76a8a721f5971dd0c48')

prepare() {
    npm ci --cache "${srcdir}/npm-cache" --prefix "$pkgbase"
}

build() {
    npm run pack-ff --prefix "$pkgbase"
    npm run build --prefix "$pkgbase"
}

package_firefox-extension-proton-vpn() {
    pkgdesc='Proton VPN extension for Firefox'
    groups=('firefox-addons')
    install=firefox-extension-proton-vpn.install
    
    local _id
    _id="$(awk '/"id":/ { gsub(/[",]/, ""); print $2 }' "${pkgbase}/distribution-ff/manifest.json")"
    
    install -D -m644 "${pkgbase}/vpn-proton-firefox.zip" "${pkgdir}/usr/lib/firefox/browser/extensions/${_id}.xpi"
}

package_proton-vpn-browser-extension() {
    pkgdesc='Proton VPN unpacked extension for Chromium compatible browsers'
    install=proton-vpn-browser-extension.install
    
    install -d -m755 "${pkgdir}/usr/share"
    cp -dr --no-preserve='ownership' "${pkgbase}/distribution" "${pkgdir}/usr/share/${pkgbase}"
}
