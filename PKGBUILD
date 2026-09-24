# Maintainer: VanillaGreen <ai1@vanillagreen.com>
pkgname=kendex-git
# kendex 1.0.0 follows 5.0.1, so the version number goes backwards. pacman
# compares versions, and without an epoch it reads 1.0.0 as older than the
# 5.x a machine already holds and refuses the upgrade. Every kendex package
# carries the same epoch so the four stay comparable with each other.
epoch=1
pkgver=r0.0000000
pkgrel=2
pkgdesc='Package manager for AI coding agents, skills, and hooks (desktop app and CLI, latest commit)'
arch=('x86_64' 'aarch64')
url='https://kendex.ai'
license=('MIT')
# `kendex` is the command, so a dependency on it is satisfied by this
# package; the other three install the same command and cannot be
# co-installed with it. No `replaces`: every name here already exists under
# its own recipe, and a `replaces` would swap a person's chosen variant for
# another one during an ordinary system upgrade.
provides=('kendex')
conflicts=('kendex' 'kendex-bin' 'kendex-cli-git')
# git is a runtime as well as a build need, and they are different needs:
# the build clones with it, and the installed program materializes a catalog
# with it. 2.41 is the first that takes `--attr-source`, below which every
# install of a package from a git repository is refused.
depends=(
  'git>=2.41'
  # The command links libdbus-1 directly: the keyring crate reaches
  # libdbus-sys through its sync-secret-service backend, and that build
  # probes dbus-1.pc with pkg-config and panics when it is absent. One name
  # carries the build need and the runtime one, since Arch ships the shared
  # library, the headers and dbus-1.pc in the same package.
  'dbus'
  # The desktop app is a webkit2gtk shell. gtk3 is linked directly as well
  # as through it, so it is named rather than left to webkit2gtk to pull.
  'webkit2gtk-4.1'
  'gtk3'
  'hicolor-icon-theme'
  # The app makes itself the `kendex://` handler on first launch, through
  # `update-desktop-database` (desktop-file-utils) and `xdg-mime`
  # (xdg-utils). Without them on PATH a `kendex://` link opens a browser.
  'desktop-file-utils'
  'xdg-utils'
)
makedepends=('cargo' 'git' 'npm')
# makepkg LTO makes ring's C objects fail to link with rust-lld.
options=('!lto')
source=('git+https://github.com/vanillagreencom/kendex.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kendex"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/kendex"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  npm ci --prefix ui
}

build() {
  cd "$srcdir/kendex"
  export RUSTUP_TOOLCHAIN=stable
  # The desktop binary embeds ui/dist through tauri's context macro. Only
  # `cargo tauri build` runs the frontend build on its own, and this package
  # builds plain binaries rather than a bundle, so the frontend is built
  # here or the app ships an empty window. `cargo tauri build` also turns on
  # tauri's `custom-protocol` feature; without it the binary is a dev build
  # whose window loads the dev server URL instead of the embedded frontend.
  npm run --prefix ui build
  cargo build --release --locked -p kendex-cli -p kendex-app --features tauri/custom-protocol
}

package() {
  cd "$srcdir/kendex"
  install -Dm755 target/release/kendex "$pkgdir/usr/bin/kendex"
  # The desktop app stays off PATH so the `kendex` command is the CLI.
  install -Dm755 target/release/kendex-app "$pkgdir/usr/lib/kendex/kendex-app"
  # Every size the app ships, each in its own slot: a launcher that picks
  # the 128px icon for a HiDPI slot upscales it and the result looks soft.
  install -Dm644 crates/app/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/kendex.png"
  install -Dm644 crates/app/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/kendex.png"
  install -Dm644 'crates/app/icons/128x128@2x.png' "$pkgdir/usr/share/icons/hicolor/256x256/apps/kendex.png"
  install -Dm644 crates/app/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/kendex.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # This entry has to match the one install.sh writes, field for field apart
  # from Exec — the same launcher reads whichever one is installed.
  # StartupWMClass ties the window to this entry: without it a launcher
  # shows the running app as a second, unnamed, iconless item.
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/kendex.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=kendex
Comment=Manage AI coding agents, skills, and hooks
Exec=/usr/lib/kendex/kendex-app
Icon=kendex
StartupWMClass=kendex-app
Categories=Development;Utility;
Terminal=false
DESKTOP
}
