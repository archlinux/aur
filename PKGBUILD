# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=ludusavi
_app_id="com.github.mtkennerly.$pkgname"
pkgver=0.24.2
pkgrel=1
pkgdesc="Backup tool for PC game saves"
arch=('x86_64')
url="https://github.com/mtkennerly/ludusavi"
license=('MIT')
depends=(
  'bzip2'
  'gcc-libs'
  'hicolor-icon-theme'
)
makedepends=(
  'cargo'
  'git'
  'libx11'
  'libxcb'
  'python'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
optdepends=(
  'rclone: upload backups to the cloud'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/$pkgname-v$pkgver-legal.zip")
sha256sums=('7995ae71d4678e0c2000d7b7468c259e1b12b63f03d21420a45cbf7507c53fa3'
            '2ab0e5f7646c99ea9f896df1172f37abbd3363353bd5a992b2f3e6bcba3b0567')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features

  appstreamcli validate --no-net "assets/${_app_id}.metainfo.xml"
  desktop-file-validate "assets/$pkgname.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "assets/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 assets/icon.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm644 assets/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 "assets/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/${_app_id}.desktop"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir/$pkgname-v$pkgver-legal.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/legal.txt"
}
