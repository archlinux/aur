# Maintainer: Jef Roosens

pkgname='cinny-desktop'
pkgver='2.2.0'
pkgrel='1'
pkgdesc='Matrix client focusing primarily on a simple, elegant and secure interface.'
arch=('x86_64')

url='https://cinny.in/'
license=('MIT')

# https://tauri.studio/v1/guides/getting-started/prerequisites#1-system-dependencies
depends=(
    'webkit2gtk'
    'openssl'
    'gtk3'
    'appmenu-gtk-module'
    'libappindicator-gtk3'
    'librsvg'
    'libvips'
    'sqlite'
    'gst-plugins-good'
)
makedepends=('rust' 'nodejs' 'npm')

# This makes sure dirty builds still pull down the newest version
source=("${pkgname}-${pkgver}.zip::https://github.com/cinnyapp/cinny-desktop/releases/download/v${pkgver}/cinny-desktop-v${pkgver}.zip")
sha256sums=('fd9f786c8f7c821cff89942ea9f62759e833725c8b88ffbafcae2eef38715cd9')
sha512sums=('90e3550ffda47a10e0c2f8102647bae20fc9be2cca9491668bfb8bcccc73bbc933622a616a5cf2c9d5238bed471b9d852d38b180d3ec3325b64778fbe5f5d92d')

install="${pkgname}.install"

build() {
    cd "${pkgname}"

    msg2 'Installing Node dependencies...'
    cd 'cinny' && npm --legacy-peer-deps ci
    cd .. && npm ci

    msg2 'Running Tauri build...'
    npm run tauri build -- --bundles 'deb'
}

package() {
    ar x "${pkgname}/src-tauri/target/release/bundle/deb/cinny_${pkgver}_amd64.deb" 'data.tar.gz'
    tar xzf 'data.tar.gz' -C "${pkgdir}"
}

# vim: ft=bash
