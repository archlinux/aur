# Maintainer: DanCodes <dan@dancodes.online>
pkgname=parrot-git
pkgver="1.0.4.67372ba"
pkgrel=1
pkgdesc="GUI wrapper in Tauri for the Arch Linux package manager, pacman using the wrapper paru. Designed to be intuitive, powerful and user-friendly"
arch=('x86_64')
url="https://github.com/dan-online/parrot"
license=('MIT')
depends=('gtk3' 'openssl' 'webkit2gtk')
makedepends=('cargo' 'node-gyp' 'yarn')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dan-online/parrot/archive/67372ba7fc301980d0d4869cdd5b3b3ef12e819b.tar.gz")
sha256sums=('de9e6fac25543b5a0a6df9ef3fcd97d1932258153e169fc76881e0e7b67c3371')

prepare() {
  cd "parrot-67372ba7fc301980d0d4869cdd5b3b3ef12e819b"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn install

  sed -i "s/\"productName\": \"Parrot\"/\"productName\": \"Parrot (67372ba)\"/" "./src-tauri/tauri.conf.json"

  cd src-tauri
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "parrot-67372ba7fc301980d0d4869cdd5b3b3ef12e819b"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  export RUSTUP_TOOLCHAIN=stable
  yarn tauri build
}

package() {
  cd "parrot-67372ba7fc301980d0d4869cdd5b3b3ef12e819b"
  
  install -Dm755 "src-tauri/target/release/parrot-67372ba" -t "$pkgdir/usr/bin/"

  for i in 32x32 128x128 128x128@2x; do
    install -Dm644 src-tauri/icons/${i}.png       "$pkgdir/usr/share/icons/hicolor/${i}/apps/parrot.png"
  done
  install -Dm644 "src-tauri/target/release/bundle/deb/parrot-67372ba_1.0.4_amd64/data/usr/share/icons/hicolor/256x256@2/apps/parrot-67372ba.png" -t     "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/parrot.png"
  install -Dm644 src-tauri/icons/icon.png     "$pkgdir/usr/share/icons/hicolor/512x512/apps/parrot.png"

  install -Dm644 "src-tauri/target/release/bundle/deb/parrot-67372ba_1.0.4_amd64/data/usr/share/applications/parrot-67372ba.desktop" -t     "$pkgdir/usr/share/applications/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/parrot-67372ba/"
}
