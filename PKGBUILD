# Maintainer: jim3692 <jim3692 at gmail.com>
pkgname="pipewire-screenaudio"
pkgver=0.4.1
pkgrel=2
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
  "${url}/archive/refs/tags/${pkgver}.tar.gz"
  )
sha256sums=(
  'SKIP'
  )

prepare() {
  cd $srcdir/${pkgname}-${pkgver}/native/connector-rs
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
   cd $srcdir/${pkgname}-${pkgver}/native/connector-rs
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --all-features
}

package() {
  cd $srcdir/${pkgname}-${pkgver}/native
  install -Dm644 'native-messaging-hosts/firefox.json' "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.icedborn.pipewirescreenaudioconnector.json"
  sed -i 's|target/debug|target/release|g' "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.icedborn.pipewirescreenaudioconnector.json"
  install -Dm755 'connector-rs/target/release/connector-rs' "$pkgdir/usr/lib/pipewire-screenaudio/connector-rs/target/release/connector-rs"
}
