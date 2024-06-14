# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=harmonyvpktool
pkgver=2.0.0.alpha.4
_commit=7b29469e0ec69dad651b77cf1fe85511bdf6cf78
pkgrel=1
pkgdesc="An all new Titanfall VPK unpacker. Over 2x faster than the most popular alternative! (ALPHA pre-release)"
url="https://github.com/harmonytf/HarmonyVPKTool"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('webkit2gtk')
makedepends=('cargo' 'git' 'yarn')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
# Shortcut
  echo -e "[Desktop Entry]\n\
Categories=\n\
Comment=Harmony VPK Tool\n\
Exec=$pkgname\n\
Icon=$pkgname\n\
Name=Harmony VPK Tool\n\
Terminal=false\n\
Type=Application" > $pkgname.desktop

# Only build the executable
  cd HarmonyVPKTool/src-tauri
  sed -i '/"bundle": {/,/},/{/"active":/s/true/false/}' tauri.conf.json

# Dependencies
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export YARN_CACHE_FOLDER="$srcdir/YARN_CACHE"
  yarn
}

build() {
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  export YARN_CACHE_FOLDER="$srcdir/YARN_CACHE"
  cd HarmonyVPKTool
  yarn tauri build -b none
}

package() {
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
  cd HarmonyVPKTool
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  cd src-tauri
  install -Dm644 icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 icons/64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm644 icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 icons/512x512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm755 target/release/harmony-vpk-tool "$pkgdir/usr/bin/$pkgname"
}
