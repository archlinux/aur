# Maintainer: Jake Stanger <mail@jstanger.dev>

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="mpd-discord-rpc"
pkgname="$_pkgname"
pkgver=1.9.0
pkgrel=1
pkgdesc="Displays metadata of currently playing song from MPD in Discord using Rich Presence"
url="https://github.com/JakeStanger/mpd-discord-rpc"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('MIT')

depends=(
  'gcc-libs'
  'openssl'
)
makedepends=(
  'cargo'
  'git'
  'rust'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('96121896b35bc917a7514e071aa7c062b75f26c74f027b872b2b0584c4c3bbd9')

build() {
  cd "$_pkgsrc"
  cargo build --release --locked --target-dir target
}

package() {
  cd "$_pkgsrc"
  install -Dm755 "target/release/mpd-discord-rpc" "$pkgdir/usr/bin/mpd-discord-rpc"
  install -Dm644 "mpd-discord-rpc.service" -t "$pkgdir/usr/lib/systemd/user/"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
