# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: David Birks <david at tellus dot space>
# Contributor: Jeff Henson <jeff at henson dot io>
pkgname=(
  'mullvad-vpn-beta'
  'mullvad-vpn-daemon-beta'
)
pkgbase=mullvad-vpn-beta
_pkgver=2026.5
_channel=beta
_rel=1
pkgver=${_pkgver}.${_channel}${_rel}  # beta
# pkgver=${_pkgver}.${_channel}  # stable
pkgrel=1
_nodeversion=24
pkgdesc="The Mullvad VPN client app for desktop - beta channel"
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
  'libxcrypt-compat'
  'nvm'
  'protobuf'
  'typescript'
)
source=(
  "git+https://github.com/mullvad/mullvadvpn-app.git#tag=${_pkgver}-${_channel}${_rel}?signed"  # beta
  # "git+https://github.com/mullvad/mullvadvpn-app.git#tag=${_pkgver}?signed"  # stable
  "git+https://github.com/mullvad/mullvadvpn-app-binaries.git"
  'no-rpm.diff'
  'no-publish.diff'
  "${pkgbase%-beta}.sh"
)
sha256sums=('4b886d6f9e776ea0776285858c78520754ed9b882200d7915ca52697c1a35eea'
            'SKIP'
            'f3976a76352b09677487569a8538819fd393dbd6c8dbc6345f3022a08054faa9'
            '0cd7bccb05af010cc26cb0a0bb91cb68f279c4d64d7ace35e1902f020bf50311'
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
  git submodule init dist-assets/binaries
  git config submodule.dist-assets/binaries.url "$srcdir/mullvadvpn-app-binaries"
  git -c protocol.file.allow=always submodule update

  # Disable building rpm
  patch --strip=1 desktop/packages/${pkgbase%-beta}/tasks/distribution.cjs < ../no-rpm.diff

  # Disable publishing for CIs
  patch --strip=1 desktop/packages/${pkgbase%-beta}/tasks/distribution.cjs < ../no-publish.diff

  # Create shell-completions output directory
  mkdir -p build/shell-completions

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple

  _ensure_local_nvm
  nvm install "${_nodeversion}"

  echo "Installing JavaScript dependencies..."

  pushd desktop
  export npm_config_cache="$srcdir/npm_cache"
  npm run ci
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

  echo "Building Rust code in release mode using ${RUSTC_VERSION}..."

  cargo_crates_to_build=(
    -p mullvad-daemon --bin mullvad-daemon
    -p mullvad-cli --bin mullvad
    -p mullvad-setup --bin mullvad-setup
    -p mullvad-problem-report --bin mullvad-problem-report
    -p mullvad-exclude --bin mullvad-exclude
  )
  cargo build "${CARGO_ARGS[@]}" "${cargo_crates_to_build[@]}"

  echo "Preparing for packaging Mullvad VPN ${PRODUCT_VERSION}..."

  for sh in bash zsh fish; do
    echo "Generating shell completion script for ${sh}..."
    cargo run --bin mullvad "${CARGO_ARGS[@]}" -- shell-completions "${sh}" \
      build/shell-completions/
  done

  # Move binaries to correct locations in dist-assets
  binaries=(
    mullvad-daemon
    mullvad
    mullvad-problem-report
    mullvad-setup
    mullvad-exclude
  )
  for binary in ${binaries[*]}; do
    cp "target/release/${binary}" "dist-assets/${binary}"
  done

  echo "Packing Mullvad VPN ${PRODUCT_VERSION} artifact(s)..."

  pushd "desktop/packages/${pkgbase%-beta}"
  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  npm run pack:linux --release
  popd
}

package_mullvad-vpn-beta() {
  pkgdesc+=" (desktop application)"
  depends+=('mullvad-vpn-daemon-beta')
  optdepends=('libappindicator: tray icon')
  provides=("${pkgname%-beta}")
  conflicts=("${pkgname%-beta}")
  install="${pkgname%-beta}.install"

  cd mullvadvpn-app
  install -d "$pkgdir/opt/Mullvad VPN"
  cp -r dist/linux-unpacked/* "$pkgdir/opt/Mullvad VPN/"
  install -Dm755 "$srcdir/${pkgname%-beta}.sh" "$pkgdir/usr/bin/${pkgname%-beta}"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  ln -s "/opt/Mullvad VPN/resources/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/"

  # Remove mullvad-vpn-daemon files
  rm "$pkgdir/opt/Mullvad VPN"/resources/{ca.crt,mullvad-{problem-report,setup},relays.json}

  # Install desktop file & icons from deb
  cd dist
  ar x *.deb
  bsdtar -xf data.tar.xz
  install -Dm644 "usr/share/applications/${pkgname%-beta}.desktop" -t \
    "$pkgdir/usr/share/applications/"

  for icon_size in 16 32 48 64 128 256 512; do
    icons_dir="usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
    install -Dm644 "${icons_dir}/${pkgname%-beta}.png" -t "$pkgdir/${icons_dir}/"
  done

  # The AppArmor profile allows Electron sandbox to work
  # This disables user namespace restrictions
  install -d "$pkgdir/etc/apparmor.d"
  ln -s "/opt/Mullvad VPN/resources/apparmor_mullvad" "$pkgdir/etc/apparmor.d/mullvad"
}

package_mullvad-vpn-daemon-beta() {
  pkgdesc+=" (daemon and CLI)"
  depends=(
    'dbus'
    'iputils'
    'libnftnl'
  )
  provides=("${pkgname%-beta}")
  conflicts=("${pkgname%-beta}")
  install="${pkgname%-beta}.install"

  cd mullvadvpn-app
  install -Dm755 dist-assets/{mullvad,mullvad{-daemon,-exclude}} -t "$pkgdir/usr/bin/"
  install -Dm755 target/release/mullvad{-problem-report,-setup} -t \
    "$pkgdir/opt/Mullvad VPN/resources/"
  ln -s "/opt/Mullvad VPN/resources/mullvad-problem-report" "$pkgdir/usr/bin/"
  install -Dm644 dist-assets/ca.crt -t "$pkgdir/opt/Mullvad VPN/resources/"
  install -m644 dist-assets/relays/relays.json -t "$pkgdir/opt/Mullvad VPN/resources/"
  install -Dm644 dist-assets/linux/mullvad{-daemon,-early-boot-blocking}.service -t \
    "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 build/shell-completions/mullvad.bash \
    "$pkgdir/usr/share/bash-completion/completions/mullvad"
  install -Dm644 build/shell-completions/_mullvad -t \
    "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 build/shell-completions/mullvad.fish -t \
    "$pkgdir/usr/share/fish/vendor_completions.d/"
}
