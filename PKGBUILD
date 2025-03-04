# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=proton-vpn-browser-extension
pkgname=('firefox-extension-proton-vpn' 'proton-vpn-browser-extension')
pkgver=1.2.5
pkgrel=1
_commit=47497605562808f1d59d4335983d6c56f46e7b4b
pkgdesc='Proton VPN browser extension'
arch=('any')
url='https://protonvpn.com/'
license=('GPL-3.0-only')
makedepends=('git' 'npm' 'zip')
source=("git+https://github.com/ProtonVPN/proton-vpn-browser-extension.git#commit=${_commit}")
sha256sums=('7360e5c0ce6db89920e5116dc3e7fe0a71bcb6e7c81ae00497ea40822692202f')

#prepare() {
#    npm ci --prefix "$pkgbase"
#}

build() {
    npm install --prefix "$pkgbase"
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
