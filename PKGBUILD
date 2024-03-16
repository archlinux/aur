# Maintainer: Jake Stanger <mail@jstanger.dev>

_pkgname="mpd-discord-rpc"
pkgname="$_pkgname"
pkgver=1.7.2
pkgrel=1
pkgdesc="Displays metadata from currently playing song from MPD in Discord using Rich Presence"
url="https://github.com/JakeStanger/mpd-discord-rpc"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('MIT')

makedepends=(
  'cargo'
  'git'
  'rust'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('9dfe7dbdda36d39c034c10e0787f642af12f3898e9b313f98df266b2e9939076')

build() {
  export CARGO_HOME="${CARGO_HOME:-$SRCDEST/cargo-home}"
  export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
  export CARGO_TARGET_DIR=target

  cd "$_pkgsrc"
  cargo build --release --locked --target-dir target
}

package() {
  cd "$_pkgsrc"
  install -Dm755 "target/release/mpd-discord-rpc" "$pkgdir/usr/bin/mpd-discord-rpc"
  install -Dm644 "mpd-discord-rpc.service" -t "$pkgdir/usr/lib/systemd/user/"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
