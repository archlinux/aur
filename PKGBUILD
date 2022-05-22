# vim: ft=bash
# Maintainer: Jef Roosens

pkgbase='cinny-desktop'
pkgname='cinny-desktop'
pkgver='2.0.3'
pkgrel='1'
pkgdesc='Cinny is a matrix client focusing primarily on a simple, elegant and secure interface.'
arch=('x86_64')

url='https://github.com/cinnyapp/cinny-desktop'
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
conflicts=('cinny-desktop-bin')

source=("${pkgname}::https://github.com/cinnyapp/cinny-desktop/releases/download/v${pkgver}/cinny-desktop-v${pkgver}.zip")
sha256sums=('c74471769c2d89904b89f6418b396b9897878708393cd0a9a9d35e082c0a7e33')

build() {
    cd "${pkgname}"

    msg2 'Installing Node dependencies...'
    cd 'cinny' && npm ci
    cd .. && npm ci

    msg2 'Running Tauri build...'
    # We don't actually need the deb, but the build fails if bundles is
    # specified as being empty.
    npm run tauri build -- --bundles 'deb'
}

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "${pkgname}/src-tauri/target/release/cinny" "${pkgdir}/usr/bin/cinny"
    install -Dm 644 "${pkgname}/resources/in.cinny.Cinny.desktop" "${pkgdir}/usr/share/applications/cinny.Cinny.desktop"
}
