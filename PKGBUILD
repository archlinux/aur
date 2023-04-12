# Maintainer: DanCodes <dan@dancodes.online>
pkgname=parrot-git
pkgver="1.0.4.37ead97"
pkgrel=1
pkgdesc="GUI wrapper in Tauri for the Arch Linux package manager, pacman using the wrapper paru. Designed to be intuitive, powerful and user-friendly"
arch=('x86_64')
url="https://github.com/dan-online/parrot"
license=('MIT')
depends=('gtk3' 'openssl' 'webkit2gtk')
makedepends=('cargo' 'node-gyp' 'yarn')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dan-online/parrot/archive/37ead97610467864e02d354e087fdf6ef86890af.tar.gz")
sha256sums=('ac86c97fa257b216fe64a6a465835959a6fce0135e295a3bf3c66afcb1f05434')

prepare() {
  cd "$pkgname-$pkgver"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn install

  cd src-tauri
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  export RUSTUP_TOOLCHAIN=stable
  yarn build
  yarn tauri build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "src-tauri/target/release/$pkgname" -t "$pkgdir/usr/bin/"

  for i in 32x32 128x128 128x128@2x; do
    install -Dm644 src-tauri/icons/${i}.png       "$pkgdir/usr/share/icons/hicolor/${i}/apps/$pkgname.png"
  done
  install -Dm644 "src-tauri/target/release/bundle/deb/${pkgname}_${pkgver}_amd64/data/usr/share/icons/hicolor/256x256@2/apps/$pkgname.png" -t     "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/icon.png     "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  install -Dm644 "src-tauri/target/release/bundle/deb/${pkgname}_${pkgver}_amd64/data/usr/share/applications/$pkgname.desktop" -t     "$pkgdir/usr/share/applications/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
