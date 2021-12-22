# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: John Andrews <theunderdog09 at gmail dot com>
# Contributor: Timo Kramer <fw minus aur at timokramer dot de>
pkgname=mullvad-vpn-cli
pkgver=2021.6
pkgrel=2
pkgdesc="The Mullvad VPN CLI client"
arch=('x86_64')
url="https://www.mullvad.net"
license=('GPL3')
depends=('dbus' 'iputils')
makedepends=('cargo' 'git' 'go')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=('!lto')
install="${pkgname%-*}.install"
_commit=19a97997b188855d0ba5aedb7419683df45d93bc
source=("git+https://github.com/mullvad/mullvadvpn-app.git#tag=${pkgver}?signed"
        "git+https://github.com/mullvad/mullvadvpn-app-binaries.git#commit=${_commit}?signed"
        'override.conf')
sha256sums=('SKIP'
            'SKIP'
            'ed978958f86da9acbce950a832491b140a350c594e2446b99a7c397a98731316')
validpgpkeys=('EA0A77BF9E115615FC3BD8BC7653B940E494FE87'
              # Linus Färnstrand (code signing key) <linus@mullvad.net>
              '8339C7D2942EB854E3F27CE5AEE9DECFD582E984'
              # David Lönnhager (code signing) <david.l@mullvad.net>
              )

prepare() {
  cd "$srcdir/mullvadvpn-app"
  git submodule init
  git config submodule.dist-assets/binaries.url "$srcdir/mullvadvpn-app-binaries"
  git submodule update

  export RUSTUP_TOOLCHAIN=stable
  echo "Removing old Rust build artifacts"
  cargo clean

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

  # Prevent creation of a `go` directory in one's home.
  # Sometimes this directory cannot be removed with even `rm -rf` unless
  # one becomes root or changes the write permissions.
  export GOPATH="$srcdir/gopath"
  go clean -modcache
}

build() {
  cd "$srcdir/mullvadvpn-app"
  local RUSTC_VERSION=$(rustc --version)
  source env.sh ""

  echo "Building Mullvad VPN CLI $pkgver..."

  echo "Building wireguard-go..."
  pushd wireguard/libwg
  mkdir -p "../../build/lib/$CARCH-unknown-linux-gnu"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "../../build/lib/$CARCH-unknown-linux-gnu"/libwg.a -buildmode c-archive
  popd

  # Clean mod cache for makepkg -C
  go clean -modcache

  export MULLVAD_ADD_MANIFEST="1"

  echo "Building Rust code in release mode using $RUSTC_VERSION..."

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release

  mkdir -p dist-assets/shell-completions
  for sh in bash zsh fish; do
    echo "Generating shell completion script for $sh..."
    cargo run --bin mullvad --frozen --release -- shell-completions "$sh" \
      dist-assets/shell-completions/
  done

  echo "Copying binaries"
  binaries=(
    mullvad-daemon
    mullvad
    mullvad-problem-report
    libtalpid_openvpn_plugin.so
    mullvad-setup
    mullvad-exclude
  )
  for binary in ${binaries[*]}; do
    cp "target/release/$binary" "dist-assets/$binary"
  done

  echo "Updating relay list..."
  cargo run --bin relay_list --frozen --release > dist-assets/relays.json

  echo "Updating API address cache..."
  cargo run --bin address_cache --frozen --release > dist-assets/api-ip-address.txt
}

package() {
  cd "$srcdir/mullvadvpn-app"

  # Install main files
  install -d "$pkgdir/opt/$pkgname"
  cp -r dist-assets/* "$pkgdir/opt/$pkgname"

  # Symlink daemon service to correct directory
  install -d "$pkgdir/usr/lib/systemd/system"
  ln -s "/opt/$pkgname/linux/mullvad-daemon.service" \
    "$pkgdir/usr/lib/systemd/system"

  # Install binaries
  install -Dm755 dist-assets/{mullvad,mullvad-exclude} -t "$pkgdir/usr/bin"

  # Link to the problem report binary
  ln -s "/opt/$pkgname/resources/mullvad-problem-report" \
    "$pkgdir/usr/bin/mullvad-problem-report"

  # Install completions
  install -Dm755 dist-assets/shell-completions/mullvad.bash \
    "$pkgdir/usr/share/bash-completion/completions/mullvad"
  install -Dm755 dist-assets/shell-completions/_mullvad -t \
    "$pkgdir/usr/share/zsh/site-functions"
  install -Dm755 dist-assets/shell-completions/mullvad.fish -t \
    "$pkgdir/usr/share/fish/vendor_completions.d"

  # Install override for daemon
  install -Dm644 "$srcdir/override.conf" -t \
    "$pkgdir/etc/systemd/system/mullvad-daemon.service.d"
}
