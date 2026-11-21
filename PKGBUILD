# Maintainer: ParticleG <particle_g@outlook.com>
pkgname=twintaillauncher-cn
_pkgname=twintaillauncher
pkgver=2.5.3.cn.2
pkgrel=1
# pkgver 2.5.3.cn.1 is built from tag ttl-v2.5.3-cn.1
_tag="ttl-v${pkgver/.cn./-cn.}"
_dirname="TwintailLauncher-CN-${_tag}"
pkgdesc='TwintailLauncher fork with working third-party game repositories'
arch=('x86_64' 'aarch64')
url='https://github.com/ParticleG/TwintailLauncher-CN'
license=('GPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'pango' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'libayatana-appindicator' 'mangohud')
optdepends=('gamemode: Feral Interactive gamemode utility' 'gamescope: ValveSoftware gamescope session utility')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin" "$_pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('235aab1c7c01f42c2c04afd1d4d14254a64f4ab077f7c050dbfee880bc8a36eb')
options=('!lto' '!debug')

prepare() {
    cd "$_dirname"
    pnpm i
}

build() {
    cd "$_dirname"
    pnpm build:native --no-bundle
}

package() {
    cd "$_dirname"
    # tauri-build copies these to OUT_DIR/../../.., which is no longer target/release
    # with the build-dir layout of Cargo 1.100, so install the tracked originals.
    local resources=src-tauri/resources
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm755 "$resources/reaper" "$resources/winetricks" -t "$pkgdir/usr/lib/$_pkgname/resources"
    install -Dm644 "$resources/hkrpg_patch.dll" "$resources/suspend_start.exe" -t "$pkgdir/usr/lib/$_pkgname/resources"
    cp -r "$resources/locales" "$pkgdir/usr/lib/$_pkgname/resources/"
    install -Dm755 "src-tauri/target/release/$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
    install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
    install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$_pkgname.png"
}
