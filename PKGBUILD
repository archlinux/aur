# Maintainer: jim3692 <jim3692 at gmail.com>
pkgname="pipewire-screenaudio"
pkgver=0.4.2
pkgrel=3
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

  install -Dm755 'connector-rs/target/release/connector-rs' "$pkgdir/usr/lib/pipewire-screenaudio/connector/connector-rs"

  # Firefox based browsers
  install -Dm644 'native-messaging-hosts/com.icedborn.pipewirescreenaudioconnector.json'  "$pkgdir/usr/lib/pipewire-screenaudio/messaging-hosts/firefox.json"
  sed -i 's|CONNECTOR_BINARY_PATH|/usr/lib/pipewire-screenaudio/connector/connector-rs|g' "$pkgdir/usr/lib/pipewire-screenaudio/messaging-hosts/firefox.json"
  sed -i 's|ALLOWED_FIELD|allowed_extensions|g'                                           "$pkgdir/usr/lib/pipewire-screenaudio/messaging-hosts/firefox.json"
  sed -i 's|ALLOWED_VALUE|pipewire-screenaudio@icenjim|g'                                 "$pkgdir/usr/lib/pipewire-screenaudio/messaging-hosts/firefox.json"

  # Firefox
  mkdir -p "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
  ln -s "/usr/lib/pipewire-screenaudio/messaging-hosts/firefox.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.icedborn.pipewirescreenaudioconnector.json"

  # LibreWolf
  mkdir -p "$pkgdir/usr/lib/librewolf/native-messaging-hosts"
  ln -s "/usr/lib/pipewire-screenaudio/messaging-hosts/firefox.json" "$pkgdir/usr/lib/librewolf/native-messaging-hosts/com.icedborn.pipewirescreenaudioconnector.json"
}
