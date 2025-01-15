# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=ludusavi
_app_id="com.mtkennerly.$pkgname"
pkgver=0.28.0
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
sha256sums=('c5aa44b95326028df48c14efd9d561991c0eb19c66bb72b8f21394a04439d1fe'
            '373461e8485eee6e1cc1cf02ff2db5014d49505fd8d5bd21617fb14ec1953c56')

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
  cargo build --frozen --release --all-features
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
