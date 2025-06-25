# Maintainer:

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="mpd-discord-rpc"
pkgname="$_pkgname-git"
pkgver=1.8.1.r1.ga5c3361
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

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' --exclude='*[a-zA-Z]' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

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
