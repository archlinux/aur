# Maintainer: DanCodes <dan@dancodes.online>
pkgname=parrot
pkgver=1.0.6
pkgrel=1
pkgdesc="A Rust-based GUI in Tauri for pacman using the wrapper paru."
arch=('x86_64')
url="https://github.com/dan-online/parrot"
license=('MIT')
depends=('gtk3' 'webkit2gtk')
makedepends=('cargo' 'node-gyp' 'yarn')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('32c7a8b20a908e0d57de4c7ff503af117c34b1b93f76937daa3380edd3116882')

prepare() {
  cd "$pkgname-$pkgver"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn install

  sed -i "s/\"version\": \"1.0.5\"/\"version\": \"1.0.6\"/g" package.json

  cd src-tauri
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"

  sed -i "s/\"productName\": \"Parrot\"/\"productName\": \"Parrot (1.0.6)\"/" \
    tauri.conf.json
  sed -i "s/\"version\": \"1.0.5\"/\"version\": \"1.0.6\"/g" tauri.conf.json
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
  _bundle_dir="src-tauri/target/release/bundle/deb/${pkgname}-${pkgver//./-}_${pkgver}_amd64"

  install -Dm755 "src-tauri/target/release/$pkgname-${pkgver//./-}" \
    "$pkgdir/usr/bin/$pkgname"

  for i in 32x32 128x128 128x128@2x; do
    install -Dm644 src-tauri/icons/${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}/apps/$pkgname.png"
  done
  install -Dm644 "${_bundle_dir}/data/usr/share/icons/hicolor/256x256@2/apps/$pkgname-${pkgver//./-}.png" -t \
    "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  install -Dm644 "${_bundle_dir}/data/usr/share/applications/$pkgname-${pkgver//./-}.desktop" -t \
    "$pkgdir/usr/share/applications/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
