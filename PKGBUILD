# Maintainer: jim3692 <jim3692 at gmail.com>
pkgname="pipewire-screenaudio-git"
pkgver=0.4.1.r5.gfbeaa4c
pkgver() {
  cd "pipewire-screenaudio"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="Extension to passthrough pipewire audio to WebRTC Screenshare"
arch=('x86_64')
url="https://github.com/IceDBorn/pipewire-screenaudio"
license=('GPL3')
makedepends=(
  'cargo'
  'clang'
  'pkgconf'
  )
depends=(
  'pipewire'
  )
optdepends=(
  'pipewire-screenaudio-librewolf: Native Messaging for LibreWolf'
  )
options=(!lto)
conflicts=()
provides=('pipewire-screenaudio')
source=(
  'git+https://github.com/IceDBorn/pipewire-screenaudio.git#branch=main'
  )
sha256sums=(
  'SKIP'
  )

prepare() {
  cd $srcdir/pipewire-screenaudio/native/connector-rs
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $srcdir/pipewire-screenaudio/native/connector-rs
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --all-features
}

package() {
  install -Dm644 "$srcdir/pipewire-screenaudio/native/native-messaging-hosts/firefox.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.icedborn.pipewirescreenaudioconnector.json"
  sed -i 's|target/debug|target/release|g' "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.icedborn.pipewirescreenaudioconnector.json"
  install -Dm755 "$srcdir/pipewire-screenaudio/native/connector-rs/target/release/connector-rs" "$pkgdir/usr/lib/pipewire-screenaudio/connector-rs/target/release/connector-rs"
}
