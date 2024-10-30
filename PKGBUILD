# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: John Andrews <theunderdog09 at gmail dot com>
# Contributor: Timo Kramer <fw minus aur at timokramer dot de>
pkgname=mullvad-vpn-cli
pkgver=2024.7
pkgrel=1
pkgdesc="The Mullvad VPN CLI client"
arch=('x86_64')
url="https://www.mullvad.net"
license=('GPL-3.0-or-later')
depends=('dbus' 'iputils' 'libnftnl')
makedepends=('cargo' 'git' 'go' 'protobuf')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
_ab_commit=049d5d3bc0c86c29c20f2073460186a83c1d7094
_wg_commit=b1cf09a982bba6f6c63fadc956d88e8c2326d05e
#_mn_commit=7254d70ea92e59778a99611999e4ed88a4aa821b  ## commit does not exist
_mn_commit=b06094e81701782d28cd2312f58e0654109d04ce
source=("git+https://github.com/mullvad/mullvadvpn-app.git#tag=$pkgver?signed"
        "git+https://github.com/mullvad/mullvadvpn-app-binaries.git#commit=${_ab_commit}?signed"
        "git+https://github.com/mullvad/wireguard-go.git#commit=${_wg_commit}?signed"
        "git+https://github.com/mullvad/maybenot.git#commit=${_mn_commit}")
sha256sums=('ce7bf4773bc2d377731f0d7525b34cbdbf43c65b39430bbc109d5b8838193be7'
            '2f7ff0d5c2c5bab63b9babc6c91d921ef9965413b0b92996be8c9fd5a9c0d862'
            'a65a9a650066e653f50871c17758ddc8a4ecfa6fbb9684035855d6f0d8a655a4'
            '905d2c0b697cb594babdf4e84066f3bdf666ab5d889642b002a1390f52fc7cf8')
validpgpkeys=('225E40C8F1C8DEB7977ABF59F293063FECE2E8ED' # Linus Färnstrand <linus@mullvad.net>
              '8339C7D2942EB854E3F27CE5AEE9DECFD582E984' # David Lönnhager (code signing) <david.l@mullvad.net>
              '1D0026CBD1F1858DF8DB54DFCB87E2B919A6454C' # Oskar Nyberg <oskar@mullvad.net>
              )

prepare() {
  cd mullvadvpn-app
  git submodule init
  git config submodule.dist-assets/binaries.url "$srcdir/mullvadvpn-app-binaries"
  git config submodule.wireguard-go-rs/libwg/wireguard-go.url "$srcdir/wireguard-go"
  git -c protocol.file.allow=always submodule update

#  pushd wireguard-go-rs/libwg/wireguard-go
#  git submodule init
#  git config submodule.maybenot.url "$srcdir/maybenot"
#  git -c protocol.file.allow=always submodule update
#  popd

  cp -rf "$srcdir/maybenot" wireguard-go-rs/libwg/wireguard-go/

  # Create shell-completions output directory
  mkdir -p build/shell-completions

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Create wireguard-go build directory
  mkdir -p "build/lib/$CARCH-unknown-linux-gnu"
}

build() {
  cd mullvadvpn-app
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  local RUSTC_VERSION=$(rustc --version)
  local PRODUCT_VERSION=$(cargo run -q --bin mullvad-version)

  echo "Building Mullvad VPN ${PRODUCT_VERSION}..."

  echo "Building wireguard-go..."
  pushd wireguard-go-rs/libwg
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
  for sh in bash zsh fish; do
    echo "Generating shell completion script for ${sh}..."
    cargo run --bin mullvad --frozen --release -- shell-completions ${sh} \
      build/shell-completions/
  done

  echo "Updating relays.json..."
  cargo run --bin relay_list "${CARGO_ARGS[@]}" > build/relays.json
}

package() {
  cd mullvadvpn-app

  # Install binaries
  install -Dm755 target/release/mullvad{-problem-report,-setup} -t \
    "$pkgdir/opt/Mullvad VPN/resources/"

  install -Dm755 target/release/{mullvad,mullvad{-daemon,-exclude}} -t \
    "$pkgdir/usr/bin/"

  install -m755 target/release/libtalpid_openvpn_plugin.so -t \
    "$pkgdir/opt/Mullvad VPN/resources/"

  install -m755 "dist-assets/binaries/$CARCH-unknown-linux-gnu/openvpn" -t \
    "$pkgdir/opt/Mullvad VPN/resources/"

  # Link to the problem report binary
  ln -s "/opt/Mullvad VPN/resources/mullvad-problem-report" "$pkgdir/usr/bin/"

  # Install relay list
  install -m644 build/relays.json -t "$pkgdir/opt/Mullvad VPN/resources/"

  # Install OpenVPN certificate
  install -m644 dist-assets/ca.crt -t "$pkgdir/opt/Mullvad VPN/resources/"

  # Install list of maybenot machines to support DAITA
  install -m644 dist-assets/maybenot_machines -t "$pkgdir/opt/Mullvad VPN/resources/"

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
