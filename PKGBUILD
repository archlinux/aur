# Maintainer: Jef Roosens

pkgbase='cinny-desktop'
pkgname='cinny-desktop'
pkgver='2.0.3'
pkgrel='2'
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
)
makedepends=('rust' 'nodejs' 'npm')

source=("${pkgname}::https://github.com/cinnyapp/cinny-desktop/releases/download/v${pkgver}/cinny-desktop-v${pkgver}.zip")
sha256sums=('c74471769c2d89904b89f6418b396b9897878708393cd0a9a9d35e082c0a7e33')
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
