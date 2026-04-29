# Maintainer: itlxrd <ilyakm@icloud.com>
pkgname=psysonic-git
_pkgname=psysonic
pkgver=1.34.8.r0.g5a2b3c4
pkgrel=1
pkgdesc="Desktop music player for Subsonic API-compatible servers (build latest changes from main branch)"
arch=('x86_64')
url="https://github.com/Psychotoxical/psysonic"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'alsa-lib')
makedepends=('git' 'npm' 'rust' 'cargo' 'pkgconf')
source=("$_pkgname::git+https://github.com/Psychotoxical/psysonic.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    local _ver=$(grep -m1 '^version =' src-tauri/Cargo.toml | cut -d '"' -f2)
    printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    npm install
}

build() {
    cd "$_pkgname"
    npm run tauri build -- --bundles none
}

package() {
    cd "$_pkgname"
    install -Dm755 "src-tauri/target/release/psysonic" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
    # install -Dm644 "src-tauri/data/psysonic.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
