# Maintainer: hanami117 <hanami117 at users dot noreply dot github dot com>
#
# The AUR package `kotora-bin`: the release's prebuilt Linux x86_64 binaries (made by
# `packaging/release.sh --linux-bin` and uploaded to the GitHub release), installed like the source
# package `kotora` (packaging/aur/PKGBUILD) with nothing built. The two conflict.
# For a new release:
#   - pkgver, _build   as in packaging/aur/PKGBUILD (pkgrel back to 1)
#   - sha256sums       kotora-<release>-linux-x86_64.tar.gz.sha256 on the release
# Then: makepkg --printsrcinfo > .SRCINFO, test (makepkg -si, namcap PKGBUILD *.pkg.tar.zst),
# and push PKGBUILD + .SRCINFO to ssh://aur@aur.archlinux.org/kotora-bin.git.
#
# Layout: the same as `kotora`:
#   /usr/bin/kotora, /usr/bin/kot
#   /usr/share/applications, /usr/share/icons/hicolor, /usr/share/licenses/kotora-bin
# The binaries are built with KOTORA_CHANNEL=aur-bin, so the update check says "update with your AUR
# helper" and offers no download. SQLite is bundled (rusqlite "bundled"): no sqlite dependency.

pkgname=kotora-bin
_name=kotora
pkgver=0.5.2
# The upstream build: 1 is tag v<version>, a rebuild of the same version is v<version>-<build>.
_build=1
if ((_build > 1)); then _rel=$pkgver-$_build; else _rel=$pkgver; fi
pkgrel=1
pkgdesc='Anime and manga tracker for MyAnimeList and AniList: recognises the episode in your player and asks before it records it (prebuilt)'
arch=('x86_64')
url='https://kotora.moe'
license=('GPL-3.0-or-later')
# The same run-time needs as `kotora`. The app (Rune/winit/wgpu) loads Vulkan, xkbcommon and the
# Wayland and X11 client libraries with dlopen, so namcap cannot see them: they are listed by hand
# so both a Wayland and an X11 session work.
depends=(
  'dbus'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libx11'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrandr'
  'vulkan-icd-loader'
  'wayland'
)
optdepends=(
  'vulkan-driver: GPU drawing (vulkan-radeon, vulkan-intel or nvidia-utils)'
  'mpv: a supported player'
  'vlc: a supported player'
  'mpc-qt: a supported player'
)
provides=("$_name=$pkgver")
conflicts=("$_name")
# Prebuilt and already stripped; no debug package.
options=('!strip' '!debug')
_tarball=$_name-$_rel-linux-x86_64.tar.gz
source=("$pkgname-$_rel.tar.gz::https://github.com/hanami117/kotora/releases/download/v$_rel/$_tarball")
sha256sums=('afcc22b7d7457d36175d4c4019690a187d3dcf9848c28ef116fa5654812c327d')

package() {
  cd "$_name-$pkgver-linux-x86_64"

  install -Dm755 bin/kotora "$pkgdir/usr/bin/kotora"
  install -Dm755 bin/kot "$pkgdir/usr/bin/kot"

  install -Dm644 share/applications/io.github.hanami117.kotora.desktop \
    "$pkgdir/usr/share/applications/io.github.hanami117.kotora.desktop"
  install -Dm644 share/icons/hicolor/scalable/apps/io.github.hanami117.kotora.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.hanami117.kotora.svg"
  local icon size
  for icon in share/icons/hicolor/*x*/apps/io.github.hanami117.kotora.png; do
    size=$(basename "$(dirname "$(dirname "$icon")")")
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$size/apps/io.github.hanami117.kotora.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY_NOTICES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
