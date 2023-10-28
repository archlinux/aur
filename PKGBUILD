# Maintainer: Jef Roosens

pkgname='cinny-desktop'
pkgver='3.1.0'
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
sha256sums=('f7fd89d2301f3fb4bbcc3e373fb21e1a4bf8e269bc6143df77405754749218be')
sha512sums=('fc34bc63af91c1554b70732b87513357a04ea5ee686df48f02699099025ad30c1d45cc68eb457abb5230499a70d4a799999b1a46eaf6e1c8d5068b95c235ef72')

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
