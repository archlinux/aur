# Maintainer: VanillaGreen <ai1@vanillagreen.com>
pkgname=kendex-bin
# kendex 1.0.0 follows 5.0.1, so the version number goes backwards. pacman
# compares versions, and without an epoch it reads 1.0.0 as older than the
# 5.x a machine already holds and refuses the upgrade. Every kendex package
# carries the same epoch so the four stay comparable with each other.
epoch=1
pkgver=1.0.0
pkgrel=1
pkgdesc='Package manager for AI coding agents, skills, and hooks (prebuilt desktop app and CLI)'
arch=('x86_64' 'aarch64')
url='https://kendex.ai'
license=('MIT')
# kendex shells out to git to materialize a catalog, and 2.41 is the
# first that takes `--attr-source` — below it every install of a
# package from a git repository is refused.
depends=(
  'git>=2.41'
  # The released command links libdbus-1 directly, through the keyring
  # crate sync-secret-service backend, so the name is a runtime need here
  # rather than a build one.
  'dbus'
  # The released desktop app is an AppImage, which needs FUSE to mount.
  'fuse2'
  'hicolor-icon-theme'
  # The app makes itself the `kendex://` handler on first launch, through
  # `update-desktop-database` (desktop-file-utils) and `xdg-mime`
  # (xdg-utils). Without them on PATH a `kendex://` link opens a browser.
  'desktop-file-utils'
  'xdg-utils'
)
# The other three install the same `kendex` command and cannot be
# co-installed with this one. No `replaces`: every name here already exists
# under its own recipe, and a `replaces` would swap a person's chosen
# variant for another one during an ordinary system upgrade.
provides=('kendex')
conflicts=('kendex' 'kendex-git' 'kendex-cli-git')
options=('!strip')
# The icons are the same files whatever the machine, so they are fetched
# once here rather than per architecture.
source=(
  "kendex-32.png::https://raw.githubusercontent.com/vanillagreencom/kendex/v$pkgver/crates/app/icons/32x32.png"
  "kendex.png::https://raw.githubusercontent.com/vanillagreencom/kendex/v$pkgver/crates/app/icons/128x128.png"
  "kendex-256.png::https://raw.githubusercontent.com/vanillagreencom/kendex/v$pkgver/crates/app/icons/128x128@2x.png"
  "kendex-512.png::https://raw.githubusercontent.com/vanillagreencom/kendex/v$pkgver/crates/app/icons/icon.png"
)
source_x86_64=(
  "kendex-app-$pkgver.AppImage::https://github.com/vanillagreencom/kendex/releases/download/v$pkgver/kendex_${pkgver}_amd64.AppImage"
  "kendex-$pkgver::https://github.com/vanillagreencom/kendex/releases/download/v$pkgver/kendex-x86_64-unknown-linux-gnu"
)
source_aarch64=(
  "kendex-app-$pkgver.AppImage::https://github.com/vanillagreencom/kendex/releases/download/v$pkgver/kendex_${pkgver}_aarch64.AppImage"
  "kendex-$pkgver::https://github.com/vanillagreencom/kendex/releases/download/v$pkgver/kendex-aarch64-unknown-linux-gnu"
)
sha256sums=(
  '7a07078ec5d8fc8cb941833864e7a89f8cafb4986bfa711a5ae01ad4196a4981'
  '52932bde27a1ca3307d170e581742d3100f4d3bf32445b949b5da62ca42a55b6'
  'c305a76e0637c8d087ec347a2c66940b1174a8c37f25ae5508398eaa3bcb87b4'
  '2515f6d5e2d311b18baffee276dd21ab58c45082b87573528763c39f969868b4'
)
sha256sums_x86_64=(
  'e5d60339bf4f02c0f43bc09b9060c30d6bc0c2341c13b64feb5fbd77f04e322e'
  '0d4ae9ffa82f3600d34a18e4a36009bae29ecd06ba7fa8fb0ef1d569d3a0936f'
)
sha256sums_aarch64=(
  '193cd1565a04bfca34e30d3d688d8e8595041db445db1e3b6a90cf9a982a31c3'
  '04e16bcc316d764c5d275d5f89689f8ba531f3c9d438e23adca24c5ad5bc6126'
)

package() {
  # The desktop app stays off PATH so the `kendex` command is the CLI.
  # This entry has to match the one install.sh writes, field for field
  # apart from Exec — the same launcher reads whichever one is installed.
  install -Dm755 "$srcdir/kendex-app-$pkgver.AppImage" "$pkgdir/usr/lib/kendex/kendex.AppImage"
  install -Dm755 "$srcdir/kendex-$pkgver" "$pkgdir/usr/bin/kendex"
  install -Dm644 "$srcdir/kendex-32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/kendex.png"
  install -Dm644 "$srcdir/kendex.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/kendex.png"
  install -Dm644 "$srcdir/kendex-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/kendex.png"
  install -Dm644 "$srcdir/kendex-512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/kendex.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/kendex.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=kendex
Comment=Manage AI coding agents, skills, and hooks
Exec=/usr/lib/kendex/kendex.AppImage
Icon=kendex
StartupWMClass=kendex-app
Categories=Development;Utility;
Terminal=false
DESKTOP
}
