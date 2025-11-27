# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: David Birks <david at tellus dot space>
# Contributor: Jeff Henson <jeff at henson dot io>
pkgname=mullvad-vpn-beta
_pkgver=2025.14
_channel=beta
_rel=2
pkgver=${_pkgver}.${_channel}${_rel}  # beta
#pkgver=${_pkgver}.${_channel}  # stable
pkgrel=1
_nodeversion=22
pkgdesc="The Mullvad VPN client app for desktop (beta channel)"
arch=('x86_64')
url="https://www.mullvad.net"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'iputils'
  'libnftnl'
  'libnotify'
  'nss'
)
makedepends=(
  'cargo'
  'git'
  'go'
  'libxcrypt-compat'
  'nvm'
  'protobuf'
#  'typescript'  ## build fails with current version
)
optdepends=('libappindicator-gtk3: tray icon')
provides=("${pkgname%-beta}")
conflicts=("${pkgname%-beta}")
install="${pkgname%-beta}.install"
source=(
  "git+https://github.com/mullvad/mullvadvpn-app.git#tag=${_pkgver}-${_channel}${_rel}?signed"  # beta
#  "git+https://github.com/mullvad/mullvadvpn-app.git#tag=${_pkgver}?signed"  # stable
  "git+https://github.com/mullvad/mullvadvpn-app-binaries.git"
  "git+https://github.com/mullvad/wireguard-go.git"
  'no-rpm.diff'
  'no-publish.diff'
  "${pkgname%-beta}.sh"
)
sha256sums=('d46a8b977535e3d22ae48f07c5795d703711174082808ffd85f4fe6a7c450b31'
            'SKIP'
            'SKIP'
            '5773f4ea5b7e0db8340e0614d1b027237cb827a5db135ee633d491c271a7e499'
            '968967efff8e9588f15c382825b609cf89d54c47e0632e92e9ef2354aa46f31b'
            '2262346cb57deb187fe32a88ccd873dab669598889269088e749197c6e88954f')
validpgpkeys=('225E40C8F1C8DEB7977ABF59F293063FECE2E8ED' # Linus Färnstrand <linus@mullvad.net>
              '7ED98188F8F9AFF15D49E41BEB8D8AD83E8DA7BC' # David Lönnhager <david.l@mullvad.net>
              '1D0026CBD1F1858DF8DB54DFCB87E2B919A6454C' # Oskar Nyberg <oskar@mullvad.net>
              '049F58CC80D9C78452151EE6EF0CCD68D0E5B9B1' # Emīls Piņķis <emils@mullvad.net>
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
  git submodule init dist-assets/binaries wireguard-go-rs/libwg/wireguard-go
  git config submodule.dist-assets/binaries.url "$srcdir/mullvadvpn-app-binaries"
  git config submodule.wireguard-go-rs/libwg/wireguard-go.url "$srcdir/wireguard-go"
  git -c protocol.file.allow=always submodule update

  # Disable building rpm
  patch --strip=1 desktop/packages/${pkgname%-beta}/tasks/distribution.js < ../no-rpm.diff

  # Disable publishing for CIs
  patch --strip=1 desktop/packages/${pkgname%-beta}/tasks/distribution.js < ../no-publish.diff

  # Create wireguard-go build directory
  mkdir -p "build/lib/$CARCH-unknown-linux-gnu"

  # Create shell-completions output directory
  mkdir -p build/shell-completions

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"

  pushd "desktop/packages/${pkgname%-beta}"
  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  nvm install "${_nodeversion}"

  echo "Installing JavaScript dependencies..."
  npm install --install-strategy=shallow typescript@5.6.3
  npm ci --no-audit --no-fund
  popd
}

build() {
  cd mullvadvpn-app
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  local RUSTC_VERSION=$(rustc --version)
  local PRODUCT_VERSION=$(cargo run -q --bin mullvad-version)
  local CARGO_ARGS=(--frozen --release)

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
  cargo build "${CARGO_ARGS[@]}" "${cargo_crates_to_build[@]}"

  echo "Preparing for packaging Mullvad VPN ${PRODUCT_VERSION}..."
  for sh in bash zsh fish; do
    echo "Generating shell completion script for ${sh}..."
    cargo run --bin mullvad "${CARGO_ARGS[@]}" -- shell-completions "${sh}" \
      build/shell-completions/
  done

  echo "Updating relays.json..."
  cargo run -p mullvad-api --bin relay_list "${CARGO_ARGS[@]}" > build/relays.json

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
  pushd "desktop/packages/${pkgname%-beta}"
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
  install -m755 "$srcdir/${pkgname%-beta}.sh" "$pkgdir/usr/bin/${pkgname%-beta}"

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
  install -Dm644 "usr/share/applications/${pkgname%-beta}.desktop" -t \
    "$pkgdir/usr/share/applications/"

  for icon_size in 16 32 48 64 128 256 512 1024; do
    icons_dir="usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
    install -Dm644 "${icons_dir}/${pkgname%-beta}.png" -t "$pkgdir/${icons_dir}/"
  done

  # Symlink apparmor profile to allow Electron sandbox to work
  install -d "$pkgdir/etc/apparmor.d"
  ln -s /opt/Mullvad\ VPN/resources/apparmor_mullvad "$pkgdir/etc/apparmor.d/mullvad"
}
