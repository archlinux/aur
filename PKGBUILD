# Maintainer: VanillaGreen <ai1@vanillagreen.com>
pkgname=kendex-bin
# kendex 1.0.0 follows 5.0.1, so the version number goes backwards. pacman
# compares versions, and without an epoch it reads 1.0.0 as older than the
# 5.x a machine already holds and refuses the upgrade. Every kendex package
# carries the same epoch so the four stay comparable with each other.
epoch=1
pkgver=1.5.0
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
# The icons and the license are the same files whatever the machine, so
# they are fetched once here rather than per architecture.
source=(
  "kendex-32.png::https://raw.githubusercontent.com/vanillagreencom/kendex/v$pkgver/crates/app/icons/32x32.png"
  "kendex.png::https://raw.githubusercontent.com/vanillagreencom/kendex/v$pkgver/crates/app/icons/128x128.png"
  "kendex-256.png::https://raw.githubusercontent.com/vanillagreencom/kendex/v$pkgver/crates/app/icons/128x128@2x.png"
  "kendex-512.png::https://raw.githubusercontent.com/vanillagreencom/kendex/v$pkgver/crates/app/icons/icon.png"
  "kendex-LICENSE-$pkgver::https://raw.githubusercontent.com/vanillagreencom/kendex/v$pkgver/LICENSE"
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
  '1097d93034e32eaa55c2a08e73960a886a62394691f8c3456617336c458dfc36'
)
sha256sums_x86_64=(
  'd15a5b855ba582b234b8e1b5b3a382d90b414c6bc4ed506310aff602654d3370'
  '2bf386fbbcbefcae522d5b6b47125bdc1f310434032031d7e23c2a93ccfe1450'
)
sha256sums_aarch64=(
  '166c9fd5c041d29f4d699c6d262991263e559923f6b8a8409c33783045e3afbd'
  '5dfcac992952538a90a59ec94264c92a21b297cf3c57e89656d641592e5713fb'
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
  install -Dm644 "$srcdir/kendex-LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
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
