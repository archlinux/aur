# Maintainer: Javad Rajabzadeh <ja7ad@live.com>

pkgname=hydra-download-manager
_pkgname=hydra
pkgver=0.4.0
pkgrel=1
pkgdesc="Multi-connection download accelerator and manager (GUI, CLI, browser integration)"
arch=('x86_64' 'aarch64')
url="https://github.com/ja7ad/hydra"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libx11'
  'libxrandr'
  'libxcb'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'git'
  'pkgconf'
)
optdepends=(
  'gnome-shell-extension-appindicator: StatusNotifierItem system tray icon in GNOME Shell'
  'xdg-utils: Open completed files and download directories'
)
provides=('hydra')
conflicts=('hydra' 'hydra-bin' 'hydra-git')
source=("git+$url.git#tag=v$pkgver")
b2sums=('SKIP')

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p hya-cli -p hya-gui -p hya-host -p hya-updater
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen -p hya-cli -p hya-gui -p hya-host -p hya-updater
}

package() {
  cd "$_pkgname"

  # 1. Executables (CLI, GUI, Host, Updater)
  install -Dm755 target/release/hydra "$pkgdir/usr/bin/hydra"
  install -Dm755 target/release/hydra-gui "$pkgdir/usr/bin/hydra-gui"
  install -Dm755 target/release/hydra-host "$pkgdir/usr/bin/hydra-host"
  install -Dm755 target/release/hydra-updater "$pkgdir/usr/bin/hydra-updater"

  # Short second name for the CLI: this package already conflicts with the
  # THC `hydra`, and three letters types better for a command run as often
  # as a download.
  ln -sf hydra "$pkgdir/usr/bin/hya"

  # 2. Desktop Launcher & Autostart
  install -Dm644 packaging/debian/hydra.desktop "$pkgdir/usr/share/applications/hydra.desktop"
  install -Dm644 packaging/debian/hydra-autostart.desktop "$pkgdir/etc/xdg/autostart/hydra.desktop"

  # 3. Application Icon
  install -Dm644 docs/logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/hydra.png"

  # 4. Native Messaging Host Manifests (Chromium / Chrome / Edge + Firefox)
  for d in etc/opt/chrome etc/chromium etc/opt/edge; do
    install -Dm644 packaging/debian/com.hydra.host.chrome.json "$pkgdir/$d/native-messaging-hosts/com.hydra.host.json"
  done
  install -Dm644 packaging/debian/com.hydra.host.mozilla.json "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.hydra.host.json"

  # 5. Shell Completions (Bash, Zsh, Fish)
  install -d "$pkgdir/usr/share/bash-completion/completions"
  install -d "$pkgdir/usr/share/zsh/site-functions"
  install -d "$pkgdir/usr/share/fish/vendor_completions.d"
  "target/release/hydra" completions bash > "$pkgdir/usr/share/bash-completion/completions/hydra"
  "target/release/hydra" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_hydra"
  "target/release/hydra" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/hydra.fish"
  # The `hya` alias needs its own scripts: a completion script names the
  # command it completes, so the hydra one never fires for it.
  "target/release/hydra" completions bash --bin-name hya > "$pkgdir/usr/share/bash-completion/completions/hya"
  "target/release/hydra" completions zsh --bin-name hya > "$pkgdir/usr/share/zsh/site-functions/_hya"
  "target/release/hydra" completions fish --bin-name hya > "$pkgdir/usr/share/fish/vendor_completions.d/hya.fish"

  # 6. Man Pages
  for page in docs/man/*.1; do
    install -Dm644 "$page" "$pkgdir/usr/share/man/man1/$(basename "$page")"
  done

  # 7. License & Documentation
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSING.md "$pkgdir/usr/share/licenses/$pkgname/LICENSING.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 THIRD-PARTY-NOTICES.md "$pkgdir/usr/share/doc/$pkgname/THIRD-PARTY-NOTICES.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
