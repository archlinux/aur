# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=proton-vpn-browser-extension
pkgname=(
    'firefox-extension-proton-vpn'
    'proton-vpn-browser-extension')
pkgver=1.3.9
pkgrel=1
_commit=d8a5ec66702c6cda479df37ef276346c117e7045
pkgdesc='Proton VPN browser extension'
arch=('any')
url='https://protonvpn.com/'
license=('GPL-3.0-only')
makedepends=(
    'git'
    'npm'
    'zip')
source=("git+https://github.com/ProtonVPN/proton-vpn-browser-extension.git#commit=${_commit}")
sha256sums=('5ff743458ffe37e4088705134cda72b1f708e7447750ce04ab4310fa663cb0a5')

build() {
    cd proton-vpn-browser-extension
    npx --yes pnpm@12.20.0 install --frozen-lockfile
    npx --yes pnpm@12.20.0 run pack-ff
    npx --yes pnpm@12.20.0 run pack
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
