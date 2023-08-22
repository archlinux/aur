# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=ludusavi
_app_id="com.github.mtkennerly.$pkgname"
pkgver=0.21.0
pkgrel=1
pkgdesc="Backup tool for PC game saves"
arch=('x86_64')
url="https://github.com/mtkennerly/ludusavi"
license=('MIT')
depends=('bzip2' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('cargo' 'git' 'libx11' 'libxcb' 'python')
checkdepends=('appstream-glib' 'desktop-file-utils')
optdepends=('rclone: upload backups to the cloud')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/$pkgname-v$pkgver-legal.zip")
sha256sums=('e11c96dba3192dfc70bcbad4c49f9c010201264d885f3e1d3eca6a5e132a8e01'
            '173c35c2684ccdc70ec65b29c0946f1114e8d96279c3d3843613ec9164cf6b9a')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
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

  appstream-util validate-relax --nonet "assets/${_app_id}.metainfo.xml"
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
  install -Dm644 "assets/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir/$pkgname-v$pkgver-legal.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/legal.txt"
}
