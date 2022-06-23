# Maintainer: Jef Roosens

pkgbase='cinny-desktop'
pkgname='cinny-desktop'
pkgver='2.0.4'
pkgrel='3'
pkgdesc='Cinny is a matrix client focusing primarily on a simple, elegant and secure interface.'
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
sha256sums=('4142c672bb421f1694eaf7d266296b00860885931a436378e72ae2a3ba81c7e7')
install="${pkgname}.install"

build() {
    cd "${pkgname}"

    msg2 'Installing Node dependencies...'
    cd 'cinny' && npm ci
    cd .. && npm ci

    msg2 'Running Tauri build...'
    npm run tauri build -- --bundles 'deb'
}

package() {
    ar x "${pkgname}/src-tauri/target/release/bundle/deb/cinny_${pkgver}_amd64.deb" 'data.tar.gz'
    tar xzf 'data.tar.gz' -C "${pkgdir}"
}
