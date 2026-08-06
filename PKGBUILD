# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=ludusavi
_app_id="com.mtkennerly.$pkgname"
pkgver=0.31.0
pkgrel=2
pkgdesc="Backup tool for PC game saves"
arch=('x86_64')
url="https://github.com/mtkennerly/ludusavi"
license=('MIT')
depends=(
  'bzip2'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'zstd'
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
optdepends=('rclone: upload backups to the cloud')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/$pkgname-v$pkgver-legal.zip")
sha256sums=('e7dcfa4fb17fcd2be9ef34d55fe0ca0d3f79fdf570107aeaa5b4e76910e2f8a1'
            '9fce11fc44942efdd5969928d89b106c229f9a041d7a713c424a6da981660ebf')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export ZSTD_SYS_USE_PKG_CONFIG=1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release
}

check() {
  cd "$pkgname-$pkgver"
  appstreamcli validate --no-net "assets/linux/${_app_id}.metainfo.xml"
  desktop-file-validate "assets/linux/${_app_id}.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "assets/linux/${_app_id}.metainfo.xml" -t \
    "$pkgdir/usr/share/metainfo/"
  install -Dm644 assets/icon.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/${_app_id}.png"
  install -Dm644 assets/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
  install -Dm644 "assets/linux/${_app_id}.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 "$srcdir/$pkgname-v$pkgver-legal.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/legal.txt"
}
