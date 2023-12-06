# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: John Andrews <theunderdog09 at gmail dot com>
# Contributor: Timo Kramer <fw minus aur at timokramer dot de>
pkgname=mullvad-vpn-cli
pkgver=2023.6
pkgrel=1
pkgdesc="The Mullvad VPN CLI client"
arch=('x86_64')
url="https://www.mullvad.net"
license=('GPL3')
depends=('dbus' 'iputils' 'libnftnl')
makedepends=('cargo' 'git' 'go' 'protobuf')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=('!lto')
install="${pkgname%-*}.install"
_tag=c2f7f75dee35c050540b90c6ebc9084969b1a93b  # tags/2023.6^0
_commit=d5772339cee9c1a0d7671968746f02499b78e245
source=("git+https://github.com/mullvad/mullvadvpn-app.git#commit=${_tag}"  # signed by Oskar Nyberg (raksooo), public key not uploaded yet
        "git+https://github.com/mullvad/mullvadvpn-app-binaries.git#commit=${_commit}?signed")
sha256sums=('SKIP'
            'SKIP')
validpgpkeys=('225E40C8F1C8DEB7977ABF59F293063FECE2E8ED' # Linus Färnstrand <linus@mullvad.net>
              '8339C7D2942EB854E3F27CE5AEE9DECFD582E984' # David Lönnhager (code signing) <david.l@mullvad.net>
              '4B986EF5222BA1B810230C602F391DE6B00D619C' # Oskar Nyberg (code signing) <oskar@mullvad.net>
              )

pkgver() {
  cd "$srcdir/mullvadvpn-app"
  git describe --tags | sed 's/-/./g'
}

prepare() {
  cd mullvadvpn-app
  git submodule init
  git config submodule.dist-assets/binaries.url "$srcdir/mullvadvpn-app-binaries"
  git -c protocol.file.allow=always submodule update

  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

  pushd wireguard/libwg
  export GOPATH="$srcdir/gopath"
  mkdir -p "../../build/lib/$CARCH-unknown-linux-gnu"
  go mod download -x
  popd
}

build() {
  cd mullvadvpn-app
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  local RUSTC_VERSION=$(rustc --version)
  local PRODUCT_VERSION=$(cargo run -q --bin mullvad-version)

  echo "Building Mullvad VPN ${PRODUCT_VERSION}..."

  echo "Building wireguard-go..."
  pushd wireguard/libwg
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "../../build/lib/$CARCH-unknown-linux-gnu"/libwg.a -buildmode c-archive
  popd

  # Clean module cache for makepkg -C
  go clean -modcache

  echo "Building Rust code in release mode using ${RUSTC_VERSION}..."

  cargo_crates_to_build=(
    -p mullvad-daemon --bin mullvad-daemon
    -p mullvad-cli --bin mullvad
    -p mullvad-setup --bin mullvad-setup
    -p mullvad-problem-report --bin mullvad-problem-report
    -p talpid-openvpn-plugin --lib
    -p mullvad-exclude --bin mullvad-exclude
  )
  cargo build --frozen --release "${cargo_crates_to_build[@]}"

  echo "Preparing for packaging Mullvad VPN ${PRODUCT_VERSION}..."
  mkdir -p build/shell-completions
  for sh in bash zsh fish; do
    echo "Generating shell completion script for ${sh}..."
    cargo run --bin mullvad --frozen --release -- shell-completions ${sh} \
      build/shell-completions/
  done

  echo "Updating relays.json..."
  cargo run --bin relay_list --frozen --release > dist-assets/relays.json
}

package() {
  cd mullvadvpn-app

  # Install binaries
  install -Dm755 target/release/mullvad{-problem-report,-setup} -t \
    "$pkgdir/opt/Mullvad VPN/resources/"

  install -Dm755 target/release/{mullvad,mullvad{-daemon,-exclude}} -t \
    "$pkgdir/usr/bin/"

  install -m644 target/release/libtalpid_openvpn_plugin.so -t \
    "$pkgdir/opt/Mullvad VPN/resources/"

  install -m755 "dist-assets/binaries/$CARCH-unknown-linux-gnu/openvpn" -t \
    "$pkgdir/opt/Mullvad VPN/resources/"

  # Link to the problem report binary
  ln -s "/opt/Mullvad VPN/resources/mullvad-problem-report" "$pkgdir/usr/bin/"

  # Install relay list
  install -m644 dist-assets/relays.json -t "$pkgdir/opt/Mullvad VPN/resources/"

  # Install OpenVPN certificate
  install -m644 dist-assets/ca.crt -t "$pkgdir/opt/Mullvad VPN/resources/"

  # Install services
  install -Dm644 dist-assets/linux/mullvad{-daemon,-early-boot-blocking}.service -t \
    "$pkgdir/usr/lib/systemd/system/"

  # Install completions
  install -Dm644 build/shell-completions/mullvad.bash \
    "$pkgdir/usr/share/bash-completion/completions/mullvad"
  install -Dm644 build/shell-completions/_mullvad -t \
    "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 build/shell-completions/mullvad.fish -t \
    "$pkgdir/usr/share/fish/vendor_completions.d/"
}
