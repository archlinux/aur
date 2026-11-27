# Maintainer: ParticleG <particle_g at outlook dot com>
#
# The official AstralParty.Toys Windows release, run through Steam's Proton by the launcher
# in https://github.com/ParticleG/AstralParty.Toys.Linux (helper-v* tags).

pkgname=astralparty-toys-bin
pkgver=2.5.2
pkgrel=1
_helper=0.2.0
_webview2=157.0.4341.60
_webview2_id=9d6605ff-c172-41a1-8116-e1bb02b93a01
pkgdesc='Astral Party toolbox (AstralParty.Toys): the official Windows build, run through Steam Proton'
arch=('x86_64')
url='https://github.com/ParticleG/AstralParty.Toys.Linux'
license=('AGPL-3.0-only' 'LicenseRef-Microsoft-WebView2-Runtime')
depends=('glibc' 'hicolor-icon-theme' 'libgcc' 'protontricks' 'steam' 'xdg-utils')
makedepends=('cargo' 'icoutils' 'imagemagick')
optdepends=('libnotify: desktop notifications when started from the application menu')
provides=('astralparty-toys')
conflicts=('astralparty-toys')
source=("AstralParty.Toys-$pkgver.zip::https://github.com/higashitaniyume/AstralParty.Toys/releases/download/v$pkgver/AstralParty.Toys-v$pkgver-win-x64-self-contained-portable.zip"
        "astralparty-toys-helper-$_helper.tar.gz::$url/archive/refs/tags/helper-v$_helper.tar.gz"
        "webview2-$_webview2.cab::https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/$_webview2_id/Microsoft.WebView2.FixedVersionRuntime.$_webview2.x64.cab")
noextract=("AstralParty.Toys-$pkgver.zip" "webview2-$_webview2.cab")
sha256sums=('e0428dcffb55ee0143d473be691026efa6168271828bf5e1d2da3877ea4c2910'
            '8ccc692a5ac46ff8684fcb026845ba7658c53eab70fa37e862f7b5a4d62903e8'
            '1bad3df802a4c21f6b271cf3cd640912056291e3915b86fa7577a18899f761b9')

_helper_dir=AstralParty.Toys.Linux-helper-v$_helper

prepare() {
  mkdir -p app webview2
  bsdtar -xf "AstralParty.Toys-$pkgver.zip" -C app
  bsdtar -xf "webview2-$_webview2.cab" -C webview2 --strip-components 1
  wrestool -x -t 14 app/AstralParty.Toys.exe > astralparty-toys.ico
  # icotool rejects the size in this icon's bitmap header; ImageMagick reads it.
  magick 'astralparty-toys.ico[0]' -resize '128x128>' astralparty-toys.png

  cd "$_helper_dir/helper"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_helper_dir/helper"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_helper_dir/helper"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  local lib="$pkgdir/usr/lib/astralparty-toys"
  install -Dm755 "$_helper_dir/helper/target/release/astralparty-toys" "$lib/astralparty-toys"
  cp -r --no-preserve=mode,ownership app webview2 "$lib/"
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/astralparty-toys/astralparty-toys "$pkgdir/usr/bin/astralparty-toys"
  install -Dm644 "$_helper_dir/helper/astralparty-toys.desktop" "$pkgdir/usr/share/applications/astralparty-toys.desktop"
  install -Dm644 astralparty-toys.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/astralparty-toys.png"
  install -Dm644 "$_helper_dir/LICENSE" "$_helper_dir/helper/NOTICE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
