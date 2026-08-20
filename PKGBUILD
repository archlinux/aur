# Maintainer: Rikkahub contributors <https://github.com/yuh-G/rikkahub-desktop>
# Contributor: (add your name/email here when submitting to the AUR)

# Rikkahub — native multi-provider LLM chat client (Tauri desktop shell + Bun backend).
#
# This is a *source* build: it compiles the Tauri (Rust) shell and the
# Bun-compiled backend sidecar from the tagged release source. The heavy
# dependencies (webkit2gtk, cargo, bun) are only needed at build time; at
# runtime the app needs webkit2gtk-4.1 + gtk3 + libayatana-appindicator (tray).
#
# Notes for packagers:
#  - The in-app updater cannot write to /opt (root-owned), so updates must go
#    through `pacman -Syu`. Ignore the in-app "update available" prompt.
#  - User data lives in $XDG_DATA_HOME/rikkahub-pc (default ~/.local/share/
#    rikkahub-pc) — see resolve-data-dir.patch. The in-app "move data folder"
#    setting still works because it only overrides the fallback.

pkgname=rikkahub-pc
pkgver=1.5.0
pkgrel=2
pkgdesc="Rikkahub — native LLM chat client with multi-provider support (Tauri desktop app)"
arch=('x86_64')
url="https://github.com/yuh-G/rikkahub-desktop"
license=('AGPL-3.0-only')
# The Bun-compiled sidecar embeds its JS payload as an ELF trailer/section that
# `strip` corrupts — the binary then falls back to the bare `bun` CLI and the
# shell reports "后端进程意外退出". Never strip this package's binaries.
options=(!strip)
# Binary is compiled with Bun; the Tauri shell needs the webkit2gtk/gtk toolchain
# (headers + pkg-config files) to build.
makedepends=('bun' 'cargo' 'webkit2gtk-4.1' 'gtk3' 'glib2')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'libayatana-appindicator' 'gcc-libs' 'icu')
optdepends=(
  'unzip: restore backups from ZIP archives'
  'zip: export backups as ZIP archives'
  'wl-clipboard: read/write the system clipboard on Wayland'
  'xclip: read/write the system clipboard on X11'
  'espeak-ng: system text-to-speech'
)
install=rikkahub-pc.install
source=(
  "rikkahub-desktop-${pkgver}.tar.gz::https://github.com/yuh-G/rikkahub-desktop/archive/refs/tags/v${pkgver}.tar.gz"
  'resolve-data-dir.patch'
  'tray-icon.patch'
  'rikkahub-pc.sh'
  'rikkahub-pc.desktop'
)
sha256sums=(
  'd1b483dc879262eb6e895666e31e7988cfc3b72568e5426bb7a6ad4576f1ab75'
  'f6dc009ddda015bcb4d4b76246125bd1f8b2e7881b1b7af8a3774d8a465877c2'
  '89d89c29f0001ee7c30b6fe90b52a747d7f4f759d4249129183ff14b3d3b9e61'
  '0c54e97a8c8b21a50009004f684227ab80a9148e17fb11b9ca5e17f55e40bbf3'
  '04fa0ed93dde4ac68c21cd2fc48017e73cb5f025dff2811298e32b97a50ab696'
)

prepare() {
  cd "rikkahub-desktop-${pkgver}"
  # System installs keep user data under XDG_DATA_HOME instead of /opt/<...>/pc-data.
  patch -Np1 -i "$srcdir/resolve-data-dir.patch"
  # Feed the tray a supersampled icon on Linux so AppIndicator panels downscale
  # instead of upscaling the Windows-sized 16px icon (which rendered blurry).
  patch -Np1 -i "$srcdir/tray-icon.patch"
}

build() {
  cd "rikkahub-desktop-${pkgver}"

  # Locked JS dependency install (frontend + backend). Point bun's package
  # cache at $srcdir so the build's downloaded registry tarballs are cleaned
  # up with $srcdir by makepkg instead of polluting the builder's
  # ~/.bun/install/cache.
  (cd web-ui && bun install --frozen-lockfile --cache-dir "$srcdir/bun-cache")
  (cd pc-server && bun install --frozen-lockfile --cache-dir "$srcdir/bun-cache")

  # Bun's bundled react-dom/server.bun.js lacks renderToPipeableStream, which the
  # react-router SPA build needs. Swap in the Node server bundle (same as upstream
  # CI does before `bun run build`).
  (
    cd web-ui
    rm -f node_modules/react-dom/server.bun.js
    ln -sf server.node.js node_modules/react-dom/server.bun.js
    rm -f node_modules/react-dom/cjs/react-dom-server.bun.development.js
    ln -sf react-dom-server.node.development.js node_modules/react-dom/cjs/react-dom-server.bun.development.js
    rm -f node_modules/react-dom/cjs/react-dom-server.bun.production.js
    ln -sf react-dom-server.node.production.js node_modules/react-dom/cjs/react-dom-server.bun.production.js
  )

  # Compile the Bun backend into the sidecar Tauri expects, named for the Linux
  # x64 target triple (<name>-<target-triple> under src-tauri/binaries).
  mkdir -p web-ui/src-tauri/binaries
  (cd pc-server && bun build --compile --target=bun-linux-x64 server.ts \
    --outfile ../web-ui/src-tauri/binaries/rikkahub-server-x86_64-unknown-linux-gnu)

  # Compile the Tauri shell. --no-bundle: the configured NSIS target is
  # Windows-only; we assemble the Linux layout ourselves in package().
  # beforeBuildCommand (bun run build) produces web-ui/build/client.
  (cd web-ui && bunx tauri build --no-bundle)
}

package() {
  cd "rikkahub-desktop-${pkgver}"

  # Everything shares one app dir: the shell spawns the sidecar from exe_dir, and
  # the sidecar serves web-ui/build/client + reads fonts/ + icons/ from exe_dir.
  install -d "$pkgdir/opt/rikkahub-pc"

  install -Dm755 web-ui/src-tauri/target/release/rikkahub \
    "$pkgdir/opt/rikkahub-pc/rikkahub"
  install -Dm755 web-ui/src-tauri/binaries/rikkahub-server-x86_64-unknown-linux-gnu \
    "$pkgdir/opt/rikkahub-pc/rikkahub-server"

  install -d "$pkgdir/opt/rikkahub-pc/web-ui/build"
  cp -r web-ui/build/client "$pkgdir/opt/rikkahub-pc/web-ui/build/"
  cp -r fonts "$pkgdir/opt/rikkahub-pc/fonts"
  cp -r icons "$pkgdir/opt/rikkahub-pc/icons"

  # PATH launcher, desktop entry, icon, license.
  install -Dm755 "$srcdir/rikkahub-pc.sh" "$pkgdir/usr/bin/rikkahub-pc"
  install -Dm644 "$srcdir/rikkahub-pc.desktop" \
    "$pkgdir/usr/share/applications/rikkahub-pc.desktop"
  install -Dm644 web-ui/public/app-icon.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/rikkahub-pc.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
