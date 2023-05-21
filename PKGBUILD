# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=ludusavi
_app_id="com.github.mtkennerly.$pkgname"
pkgver=0.18.2
pkgrel=1
pkgdesc="Backup tool for PC game saves"
arch=('x86_64')
url="https://github.com/mtkennerly/ludusavi"
license=('MIT')
depends=('bzip2' 'fontconfig' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('cargo' 'git' 'libx11' 'libxcb' 'python')
checkdepends=('appstream-glib' 'desktop-file-utils')
optdepends=('rclone: upload backups to the cloud')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/$pkgname-v$pkgver-legal.zip")
sha256sums=('78111d370cb05e6e5bdd4d7130e35f6c717d9b4ace78240587346de7d2d03233'
            '42842cba202e5bcb23372c165e64b38e4756c29e77efd3979cf3dbbd4e1e1a1a')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
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
