# Maintainer: DanCodes <dan@dancodes.online>
pkgname=parrot-git
pkgver="1.0.4.2a66762"
pkgrel=1
pkgdesc="GUI wrapper in Tauri for the Arch Linux package manager, pacman using the wrapper paru. Designed to be intuitive, powerful and user-friendly"
arch=('x86_64')
url="https://github.com/dan-online/parrot"
license=('MIT')
depends=('gtk3' 'openssl' 'webkit2gtk')
makedepends=('cargo' 'node-gyp' 'yarn')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dan-online/parrot/archive/2a66762fc679d05ea9ff653e4c6e3b7ae7ea727f.tar.gz")
sha256sums=('b5f4ff3b8422fd628c70066d289d14e97ff78ccd8c342a2594e116288447a90d')

prepare() {
  cd "parrot-2a66762fc679d05ea9ff653e4c6e3b7ae7ea727f"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn install

  sed -i "s/\"productName\": \"Parrot\"/\"productName\": \"Parrot (2a66762)\"/" "./src-tauri/tauri.conf.json"

  cd src-tauri
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "parrot-2a66762fc679d05ea9ff653e4c6e3b7ae7ea727f"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  export RUSTUP_TOOLCHAIN=stable
  yarn tauri build
}

package() {
  cd "parrot-2a66762fc679d05ea9ff653e4c6e3b7ae7ea727f"
  
  install -Dm755 "src-tauri/target/release/parrot-2a66762" -t "$pkgdir/usr/bin/"

  for i in 32x32 128x128 128x128@2x; do
    install -Dm644 src-tauri/icons/${i}.png       "$pkgdir/usr/share/icons/hicolor/${i}/apps/parrot.png"
  done
  install -Dm644 "src-tauri/target/release/bundle/deb/parrot-2a66762_1.0.4_amd64/data/usr/share/icons/hicolor/256x256@2/apps/parrot-2a66762.png" -t     "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/parrot.png"
  install -Dm644 src-tauri/icons/icon.png     "$pkgdir/usr/share/icons/hicolor/512x512/apps/parrot.png"

  install -Dm644 "src-tauri/target/release/bundle/deb/parrot-2a66762_1.0.4_amd64/data/usr/share/applications/parrot-2a66762.desktop" -t     "$pkgdir/usr/share/applications/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/parrot-2a66762/"
}
