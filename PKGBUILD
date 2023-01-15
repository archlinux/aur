# Maintainer: Jef Roosens

pkgname='cinny-desktop'
pkgver='2.2.3'
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
sha256sums=('0cc6f37112391e14cd0ef051015fc273afb1fbecb389d96927532678f16796ed')
sha512sums=('2e1da11569d9f4338c71751b5ad55608b36b0c7b535cd1043e9537821dbe300ea507aac43a336d6f7c08e9ef2a96a121166da140092519839de022858fa047f6')

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
