# Maintainer: IRendy <irendy@qq.com>

pkgname="komitoto"
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI assistant for HAM"
url="https://github.com/IRendy/komitoto"
arch=("x86_64" "aarch64")
license=("MIT")

makedepends=(
  'cargo'
  'git'
  'sqlite'
)
depends=('gcc-libs' 'sqlite')
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  sed -n 's/^version = "\([^"]*\)"/\1/p' Cargo.toml | head -1
}

prepare() {
  cd "$pkgname"

  # Use system SQLite instead of bundled
  sed -i 's/features = \["bundled"\]/features = []/' Cargo.toml
  cargo update

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: \(.*\)/\1/p')"
}

build() {
  cd "$pkgname"
  export SQLITE3_LIB_DIR="/usr/lib"
  export SQLITE3_INCLUDE_DIR="/usr/include"
  cargo build --release --locked --target-dir target
}

check() {
  cd "$pkgname"
  export SQLITE3_LIB_DIR="/usr/lib"
  export SQLITE3_INCLUDE_DIR="/usr/include"
  cargo test --release --locked
}

package() {
  cd "$pkgname"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 -t "$pkgdir/usr/share/$pkgname/" \
    "hamradio-zones-geojson-main/cqzones.geojson" \
    "hamradio-zones-geojson-main/ituzones.geojson"
}
