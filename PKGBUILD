# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=proton-vpn-browser-extension
pkgname=(
    'firefox-extension-proton-vpn'
    'proton-vpn-browser-extension')
pkgver=1.2.15
pkgrel=1
_commit=17cb6d2e4787d75174b474b8230f8862807983e2
pkgdesc='Proton VPN browser extension'
arch=('any')
url='https://protonvpn.com/'
license=('GPL-3.0-only')
makedepends=(
    'git'
    'npm'
    'zip')
source=("git+https://github.com/ProtonVPN/proton-vpn-browser-extension.git#commit=${_commit}")
sha256sums=('75a50359cf16b5e58c2e3783b5b5b0910b952ab2b5d13bfd5ef06dd5fa22c3ec')

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
