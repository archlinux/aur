# Maintainer: Jef Roosens

pkgname='cinny-desktop'
pkgver='3.2.1'
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
sha256sums=('3f1c71737f274a948ae483ecfa7d30dda54ad24c31271bc044bda7ce35cdd26e')
sha512sums=('d46e20e07d35cf2e9477325e3fd3c80e5b43024ff827624d88a577c7f0f507ab1cce147959ce69b4a8f2a781b10234b493c5019bb9b0b50091f4320ca53f5c0d')

install="${pkgname}.install"

build() {
    cd "${pkgname}"

    msg2 'Installing Node dependencies...'
    cd 'cinny' && npm --legacy-peer-deps ci
    cd .. && npm ci

    msg2 'Running Tauri build...'
    # With the default memory limit, the build fails due to having insufficient
    # memory available. 4GB seems to be enough for now.
    NODE_OPTIONS=--max_old_space_size=4096 npm run tauri build -- --bundles 'deb'
}

package() {
    ar x "${pkgname}/src-tauri/target/release/bundle/deb/cinny_${pkgver}_amd64.deb" 'data.tar.gz'
    tar xzf 'data.tar.gz' -C "${pkgdir}"
}

# vim: ft=bash
