# Maintainer: prowly <pmbaprow@gmail.com>
#
# Builds the desktop app from source against the system's own WebKitGTK and
# GPU stack. That is the whole point of shipping Linux this way: the AppImage
# we used to publish bundled ubuntu-22.04's WebKitGTK, which aborts with
# `Could not create default EGL display: EGL_BAD_PARAMETER` against a
# rolling-release Mesa and shows a white window. Linking against whatever the
# user already runs cannot drift out of sync like that.
#
# Updates are pacman's job here — the in-app updater deliberately no-ops on
# Linux (see companion/tennoworth-desktop/src/update.rs).

pkgname=tennoworth
pkgver=0.3.6
pkgrel=1
pkgdesc="Warframe inventory + market dashboard — see what's worth selling right now"
arch=('x86_64')
url="https://github.com/tennoworth/tennoworth"
license=('MIT')
# webkit2gtk-4.1 is the webview; libayatana-appindicator backs the tray, which
# degrades gracefully but is expected to be present on a normal desktop.
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'openssl')
# `cargo` rather than `rust`: it is a virtual provide satisfied by either the
# rust package or rustup, so this doesn't force toolchain-manager users to
# install a second copy. bun builds the SPA; nodejs runs scripts/sync-csp.mjs,
# which the frontend build shells out to.
makedepends=('cargo' 'bun' 'nodejs')
# Grants cap_sys_ptrace so the first inventory scan works without the user
# hitting an error and being told to open a terminal. Re-runs on upgrade
# because replacing the binary clears file capabilities.
install=tennoworth.install
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/desktop-v$pkgver.tar.gz")
sha256sums=('48dfdc45b58757acdf4f98baacc76738f8109b760708b51dd90cb82a2e7891b5')

_srcdir="tennoworth-desktop-v$pkgver"

prepare() {
  cd "$_srcdir/prototype"
  bun install --frozen-lockfile
}

build() {
  # The SPA must exist before the Rust build: tauri-build embeds it at compile
  # time from the frontendDist path. `cargo build` does not run
  # tauri.conf.json's beforeBuildCommand — only `cargo tauri build` does — so
  # the frontend is built explicitly here.
  cd "$_srcdir/prototype"
  bun run build:desktop

  cd "$srcdir/$_srcdir/companion"
  export RUSTUP_TOOLCHAIN=stable
  # Strips the packager's absolute build paths out of debug info and panic
  # messages. This does NOT silence makepkg's "Package contains reference to
  # $srcdir" warning: one reference survives because tauri-build's generated
  # context embeds CARGO_MANIFEST_DIR as a literal, and --remap-path-prefix
  # only rewrites paths rustc emits, not strings baked in by a proc macro.
  # That single leftover is cosmetic and expected — don't chase it.
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/ ${RUSTFLAGS:-}"
  cargo build --release --frozen -p tennoworth-desktop
}

check() {
  cd "$_srcdir/companion"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --frozen -p tennoworth-desktop
}

package() {
  cd "$_srcdir"

  install -Dm755 "companion/target/release/tennoworth-desktop" \
    "$pkgdir/usr/bin/tennoworth-desktop"

  # Without these the window and taskbar entry fall back to a generic WM
  # avatar — the app sets its own window icon, but the desktop entry is what
  # the shell matches on (StartupWMClass=tennoworth-desktop — the binary
  # basename, which is what GTK reports as WM_CLASS; see that file).
  install -Dm644 "packaging/aur/tennoworth/tennoworth.desktop" \
    "$pkgdir/usr/share/applications/tennoworth.desktop"

  for size in 32 64 128; do
    install -Dm644 "companion/tennoworth-desktop/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/tennoworth.png"
  done
  install -Dm644 "companion/tennoworth-desktop/icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/tennoworth.png"
  install -Dm644 "companion/tennoworth-desktop/icons/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/tennoworth.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
