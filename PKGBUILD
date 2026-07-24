pkgname=twintaillauncher
pkgver=2.4.0
pkgrel=1
_dirname="TwintailLauncher-ttl-v${pkgver}"
pkgdesc='Your anime games, one launcher'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
url=https://github.com/TwintailTeam/TwintailLauncher
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'pango' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'libayatana-appindicator' 'mangohud')
optdepends=('gamemode: Feral Interactive gamemode utility' 'gamescope: ValveSoftware gamescope session utility')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
provides=("twintaillauncher")
conflicts=("twintaillauncher-git" "twintaillauncher-bin")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/ttl-v${pkgver}.tar.gz")
sha256sums=('SKIP')
options=('!lto' '!debug')

prepare() {
    cd $_dirname
    pnpm i
}

build() {
    cd $_dirname
    pnpm build:native --no-bundle
}

package() {
    install -Dm644 "$_dirname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm755 "$_dirname/src-tauri/target/release/resources/reaper" -t "$pkgdir/usr/lib/twintaillauncher/resources/"
    install -Dm755 "$_dirname/src-tauri/target/release/resources/winetricks" -t "$pkgdir/usr/lib/twintaillauncher/resources/"
    install -Dm644 "$_dirname/src-tauri/target/release/resources/hkrpg_patch.dll" -t "$pkgdir/usr/lib/twintaillauncher/resources/"
    install -Dm755 "$_dirname/src-tauri/target/release/twintaillauncher" -t "$pkgdir/usr/bin"
    install -Dm644 "$_dirname/twintaillauncher.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "$_dirname/src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
    install -Dm644 "$_dirname/src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
    install -Dm644 "$_dirname/src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$pkgname.png"
    cp -r "$_dirname/src-tauri/target/release/resources/locales" "$pkgdir/usr/lib/twintaillauncher/resources/"
}
