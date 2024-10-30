# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Matthew McGinn <mamcgi at gmail dot com>
# Contributor: alicewww <almw at protonmail dot com>
# Contributor: David Birks <david at tellus dot space>
# Contributor: Jeff Henson <jeff at henson dot io>
pkgname=mullvad-vpn
pkgver=2024.7
pkgrel=1
_nodeversion=20
pkgdesc="The Mullvad VPN client app for desktop"
arch=('x86_64')
url="https://www.mullvad.net"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'gtk3' 'iputils' 'libnftnl' 'libnotify' 'nss')
makedepends=('cargo' 'git' 'go' 'libxcrypt-compat' 'nvm' 'protobuf')
install="$pkgname.install"
_ab_commit=049d5d3bc0c86c29c20f2073460186a83c1d7094
_wg_commit=b1cf09a982bba6f6c63fadc956d88e8c2326d05e
#_mn_commit=7254d70ea92e59778a99611999e4ed88a4aa821b  ## commit does not exist
_mn_commit=b06094e81701782d28cd2312f58e0654109d04ce
source=("git+https://github.com/mullvad/mullvadvpn-app.git#tag=$pkgver?signed"
        "git+https://github.com/mullvad/mullvadvpn-app-binaries.git#commit=${_ab_commit}?signed"
        "git+https://github.com/mullvad/wireguard-go.git#commit=${_wg_commit}?signed"
        "git+https://github.com/mullvad/maybenot.git#commit=${_mn_commit}"
        'no-rpm.diff'
        'no-publish.diff'
        "$pkgname.sh")
sha256sums=('ce7bf4773bc2d377731f0d7525b34cbdbf43c65b39430bbc109d5b8838193be7'
            '2f7ff0d5c2c5bab63b9babc6c91d921ef9965413b0b92996be8c9fd5a9c0d862'
            'a65a9a650066e653f50871c17758ddc8a4ecfa6fbb9684035855d6f0d8a655a4'
            '905d2c0b697cb594babdf4e84066f3bdf666ab5d889642b002a1390f52fc7cf8'
            'ea35edffea2cbbb05586abce19581fdd9f133801ed47e6af30fa64a29c5cf116'
            '968967efff8e9588f15c382825b609cf89d54c47e0632e92e9ef2354aa46f31b'
            '2262346cb57deb187fe32a88ccd873dab669598889269088e749197c6e88954f')
validpgpkeys=('225E40C8F1C8DEB7977ABF59F293063FECE2E8ED' # Linus Färnstrand <linus@mullvad.net>
              '8339C7D2942EB854E3F27CE5AEE9DECFD582E984' # David Lönnhager (code signing) <david.l@mullvad.net>
              '1D0026CBD1F1858DF8DB54DFCB87E2B919A6454C' # Oskar Nyberg <oskar@mullvad.net>
              )

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="$srcdir/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

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

  # Disable building rpm
  patch --strip=1 gui/tasks/distribution.js < ../no-rpm.diff

  # Disable publishing for CIs
  patch --strip=1 gui/tasks/distribution.js < ../no-publish.diff

  # Create shell-completions output directory
  mkdir -p build/shell-completions

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Create wireguard-go build directory
  mkdir -p "build/lib/$CARCH-unknown-linux-gnu"

  pushd gui
  echo "Installing JavaScript dependencies..."
  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  nvm install "${_nodeversion}"
  npm ci
  popd
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

  # Move binaries to correct locations in dist-assets
  binaries=(
    mullvad-daemon
    mullvad
    mullvad-problem-report
    libtalpid_openvpn_plugin.so
    mullvad-setup
    mullvad-exclude
  )
  for binary in ${binaries[*]}; do
    cp "target/release/${binary}" "dist-assets/${binary}"
  done

  # Build Electron GUI
  pushd gui
  echo "Packing Mullvad VPN ${PRODUCT_VERSION} artifact(s)..."
  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  npm run pack:linux --release
  popd
}

package() {
  cd mullvadvpn-app

  # Install main files
  install -d "$pkgdir/opt/Mullvad VPN"
  cp -r dist/linux-unpacked/* "$pkgdir/opt/Mullvad VPN/"

  chmod 4755 "$pkgdir/opt/Mullvad VPN/chrome-sandbox"

  # Install services
  install -Dm644 dist-assets/linux/mullvad{-daemon,-early-boot-blocking}.service -t \
    "$pkgdir/usr/lib/systemd/system/"

  # Install binaries
  install -Dm755 dist-assets/{mullvad,mullvad{-daemon,-exclude}} -t "$pkgdir/usr/bin/"

  # Link to the problem report binary
  ln -s "/opt/Mullvad VPN/resources/mullvad-problem-report" "$pkgdir/usr/bin/"

  # Link to the GUI binary
  install -m755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # Install completions
  install -Dm644 build/shell-completions/mullvad.bash \
    "$pkgdir/usr/share/bash-completion/completions/mullvad"
  install -Dm644 build/shell-completions/_mullvad -t \
    "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 build/shell-completions/mullvad.fish -t \
    "$pkgdir/usr/share/fish/vendor_completions.d/"

  # Install desktop file & icons from deb
  cd dist
  ar x *.deb
  bsdtar -xf data.tar.xz
  install -Dm644 "usr/share/applications/$pkgname.desktop" -t \
    "$pkgdir/usr/share/applications/"

  for icon_size in 16 32 48 64 128 256 512 1024; do
    icons_dir="usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
    install -Dm644 "${icons_dir}/$pkgname.png" -t "$pkgdir/${icons_dir}/"
  done
}
