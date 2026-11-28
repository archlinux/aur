# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=proton-vpn-browser-extension
pkgname=(
    'firefox-extension-proton-vpn'
    'proton-vpn-browser-extension')
pkgver=1.3.11
pkgrel=1
_commit=158d3971b5912ecf4984afcc1c0ce3180804a4fa
pkgdesc='Proton VPN browser extension'
arch=('any')
url='https://protonvpn.com/'
license=('GPL-3.0-only')
makedepends=(
    'git'
    'npm'
    'zip')
source=("git+https://github.com/ProtonVPN/proton-vpn-browser-extension.git#commit=${_commit}")
sha256sums=('4f3bfa5ab441f8ce32ba52cb71bd2e9ef5f43aa4a1956799c0de51b6b22226d0')

build() {
    cd proton-vpn-browser-extension
    local _pkg_manager
    _pkg_manager="$(awk '/packageManager/ { gsub(/[",]/, "", $2); print $2 }' package.json)"
    npx --yes "$_pkg_manager" install --frozen-lockfile
    npx --yes "$_pkg_manager" run pack-ff
    npx --yes "$_pkg_manager" run pack
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
