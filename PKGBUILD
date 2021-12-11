# Maintainer: Dylan Ferris (acerix) <dylan@pow7.com>

pkgbase=aquatic
pkgname=(aquatic-udp aquatic-http aquatic-ws)
pkgver=r1076.222fac0
pkgrel=1
pkgdesc="A multi-threaded BitTorrent tracker written in Rust."
url="https://github.com/greatest-ape/aquatic"
arch=(x86_64)
license=("Apache License 2.0")
makedepends=(rustup)
source=("git+https://github.com/greatest-ape/aquatic")
sha512sums=("SKIP")
install="$pkgbase.install"

pkgver() {
  cd $pkgbase
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rustup install stable
  rustup default stable
}

build() {
  cd $pkgbase

  # Enable support for CPU all extensions on current CPU except ~AVX-512.
  . ./scripts/env-native-cpu-without-avx-512

  # Compile
  cargo build --release -p aquatic_udp
  cargo build --release -p aquatic_http
  cargo build --release -p aquatic_ws # --features "with-glommio" --no-default-features

  # Generate config files
  ./target/release/aquatic_udp -p > aquatic_udp.toml
  ./target/release/aquatic_http -p > aquatic_http.toml
  ./target/release/aquatic_ws -p > aquatic_ws.toml
}

check() {
  cd $pkgbase
  RUSTC_BOOTSTRAP=1 cargo test --release
}

package_aquatic-udp() {
  pkgdesc="A multi-threaded BitTorrent tracker written in Rust - UDP daemon."
  _binname="aquatic_udp"
  install -Dm755 $pkgbase/target/release/$_binname $pkgdir/usr/bin/$pkgname
  install -Dm644 $pkgbase/$_binname.toml $pkgdir/etc/$pkgbase/$pkgname.toml
  install -Dm644 ../$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
}

package_aquatic-http() {
  pkgdesc="A multi-threaded BitTorrent tracker written in Rust - HTTPS daemon."
  _binname="aquatic_http"
  install -Dm755 $pkgbase/target/release/$_binname $pkgdir/usr/bin/$pkgname
  install -Dm644 $pkgbase/$_binname.toml $pkgdir/etc/$pkgbase/$pkgname.toml
  install -Dm644 ../$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
}

package_aquatic-ws() {
  pkgdesc="A multi-threaded BitTorrent tracker written in Rust - WebSocket daemon."
  _binname="aquatic_ws"
  install -Dm755 $pkgbase/target/release/$_binname $pkgdir/usr/bin/$pkgname
  install -Dm644 $pkgbase/$_binname.toml $pkgdir/etc/$pkgbase/$pkgname.toml
  install -Dm644 ../$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
}

# vim:set ts=2 sw=2 et:
