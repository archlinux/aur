# Maintainer: IRendy <irendy@qq.com>

pkgname="komitoto"
pkgver=0.1.1
pkgrel=1
pkgdesc="A CLI assistant for HAM"
url="https://github.com/IRendy/komitoto"
arch=("x86_64" "aarch64")
license=("MIT")
options=(!debug)

makedepends=(
  'cargo'
  'git'
  'sqlite'
)
depends=('gcc-libs' 'sqlite')
source=("git+$url.git#tag=v0.1.1")
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
  export RUSTFLAGS+=" --remap-path-prefix=$srcdir=/ "
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

  install -Dm644 -t "$pkgdir/usr/share/$pkgname/"     "hamradio-zones-geojson-main/cqzones.geojson"     "hamradio-zones-geojson-main/ituzones.geojson"
}
