# Maintainer: asafelobotomy <https://github.com/asafelobotomy>
#
# romforge built from a tagged release's source: the app, romforge-cli and
# romforge-provider (romforge's games in uQ's launcher), and the uQ
# integration folder (uq/, inert without uQ). The prebuilt package is
# romforge-bin, made by the release workflow from the .deb.
# After editing, regenerate .SRCINFO: makepkg --printsrcinfo > .SRCINFO

pkgname=romforge
pkgver=0.22.2
pkgrel=1
pkgdesc="Identify, tidy and play your ROM collection"
arch=('x86_64')
url="https://github.com/asafelobotomy/romforge"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'libsoup3' 'cairo' 'gdk-pixbuf2' 'dbus'
         'hicolor-icon-theme' 'glibc' 'libgcc' 'systemd-libs' 'libayatana-appindicator')
makedepends=('cargo' 'nodejs' 'npm')
optdepends=('retroarch: play games (with its cores)'
            'libretro-scummvm: ScummVM games in RetroArch'
            'scummvm: ScummVM games, and naming them'
            'mame: Arcade, FM-7 and FM Towns games'
            'flatpak: DOSBox Staging or DOSBox-X from Flathub'
            'gtk-layer-shell: the radial menu over a fullscreen game'
            'gst-plugins-good: music in the fullscreen mode (MP3, FLAC, WAV)'
            'gst-libav: music in M4A/AAC'
            'uq: your games in look=see>do_ on uQ, its game-mode window rule and its theme')
conflicts=('romforge-bin')
# Rust does its own LTO; makepkg's C flags for it break the bundled C code.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('be69347bbdf69dfc997557e1709a3fd4a10498401d9ec21e014a0a73e0156377')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cd app
  npm ci --no-audit --no-fund
}

build() {
  cd "$pkgname-$pkgver/app"
  export RUSTUP_TOOLCHAIN=stable
  # The web UI, romforge-cli and romforge-provider first (beforeBuildCommand
  # in tauri.conf.json), then the app; no .deb or AppImage.
  npx tauri build --no-bundle -- --frozen
}

check() {
  # Every release's tests passed in CI before it was tagged. Running them again while the
  # package installs only makes setup longer, and a test that needs a terminal or a
  # session can fail in a clean build. UQ_CHECK=1 runs them.
  [ -n "${UQ_CHECK:-}" ] || { msg2 'skipping tests (CI runs them; set UQ_CHECK=1 to run)'; return 0; }
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # The provider's own tests (its D-Bus tests run when dbus-daemon is there);
  # the core's need the network for some sources.
  cargo test --frozen --release -p romforge-provider
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 -t "$pkgdir/usr/bin" \
    target/release/romforge-app target/release/romforge-cli target/release/romforge-provider

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/romforge.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=romforge
Comment=Identify, tidy and play your ROM collection
Exec=romforge-app
Icon=romforge
Categories=Game;
Terminal=false
DESKTOP
  install -Dm644 -t "$pkgdir/usr/share/metainfo" packaging/dev.romforge.app.metainfo.xml
  # Opens a ROM from a file manager (romforge-cli launch FILE); hidden from menus.
  install -Dm644 packaging/romforge-open.desktop \
    "$pkgdir/usr/share/applications/romforge-open.desktop"
  local size
  for size in 32 64 128 256; do
    install -Dm644 "app/src-tauri/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/romforge.png"
  done
  install -Dm644 app/src-tauri/icons/romforge.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/romforge.svg"

  # uQ integration (uq/README.md): inert without uQ.
  install -Dm644 uq/launcher/romforge.provider \
    "$pkgdir/usr/share/uq/launcher/romforge.provider"
  install -Dm644 uq/dbus/org.romforge.Provider.service \
    "$pkgdir/usr/share/dbus-1/services/org.romforge.Provider.service"
  install -Dm644 uq/integrations/romforge/rules.toml \
    "$pkgdir/usr/share/uq/integrations/romforge/rules.toml"
  install -Dm644 -t "$pkgdir/usr/share/uq/settings/pages/romforge" uq/pages/romforge/*
  install -Dm644 uq/diag/romforge.toml "$pkgdir/usr/share/uq/diag/romforge.toml"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md GUIDE.md
}
