# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=ludusavi
_app_id="com.mtkennerly.$pkgname"
pkgver=0.29.1
pkgrel=1
pkgdesc="Backup tool for PC game saves"
arch=('x86_64')
url="https://github.com/mtkennerly/ludusavi"
license=('MIT')
depends=(
  'bzip2'
  'gcc-libs'
  'gtk3'
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
sha256sums=('6f1ea88f2483a1179d6797239fc4a57339e8c870add807ceacaa50a239031f0c'
            '34ade6a8c5dc133f33ec071483adf03ad5da9b3ac8d1fb3f3e12a663051dded6')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
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
