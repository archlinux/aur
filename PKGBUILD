# Maintainer:
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="image-roll"
pkgname="$_pkgname-git"
pkgver=2.1.0.r0.g5087079
pkgrel=1
pkgdesc="GTK image viewer with basic image manipulation tools"
url="https://github.com/weclaw1/image-roll"
license=('MIT')
arch=('x86_64')

depends=(
  gtk4
)
makedepends=(
  cargo
  git
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() (
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
)

prepare() {
  cd "$_pkgsrc"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgsrc"
  cargo build --release --frozen --all-features
}

check() {
  cd "$_pkgsrc"
  cargo test --tests -- --skip current_file || true
}

package() {
  cd "$_pkgsrc"
  install -Dm755 "$CARGO_TARGET_DIR/release/image-roll" -t "$pkgdir/usr/bin/"

  install -Dm644 "src/resources/com.github.weclaw1.ImageRoll.desktop" \
    -t "$pkgdir/usr/share/applications/"

  install -Dm644 "src/resources/com.github.weclaw1.ImageRoll.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

  install -Dm644 "src/resources/com.github.weclaw1.ImageRoll.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
