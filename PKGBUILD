# Maintainer: hanami117 <hanami117 at users dot noreply dot github dot com>
#
# The AUR package `kotora`, built from the release's source tarball (`git archive` of the tag, made by
# packaging/release.sh and uploaded to the GitHub release; GitHub's own archive/ tarball has other bytes).
# For a new release:
#   - pkgver        the version (Cargo.toml's [workspace.package])
#   - _build        the upstream build number (the BUILD file; 1 for a new version)
#   - sha256sums    the tarball's checksum (kotora-<release>.tar.gz.sha256 on the release)
#   - pkgrel        1 for a new version; one more for a change to this PKGBUILD only
# Then: makepkg --printsrcinfo > .SRCINFO, test (makepkg -si, namcap PKGBUILD *.pkg.tar.zst,
# extra-x86_64-build), and push PKGBUILD + .SRCINFO to ssh://aur@aur.archlinux.org/kotora.git.
#
# Layout:
#   /usr/bin/kotora, /usr/bin/kot
#   /usr/share/applications, /usr/share/icons/hicolor, /usr/share/licenses/kotora
# SQLite is bundled (rusqlite "bundled"), so there is no sqlite dependency.

pkgname=kotora
pkgver=0.5.1
pkgrel=1
_build=1
if ((_build > 1)); then _rel=$pkgver-$_build; else _rel=$pkgver; fi
pkgdesc='Anime and manga tracker for MyAnimeList and AniList: recognises the episode in your player and asks before it records it'
arch=('x86_64' 'aarch64')
url='https://kotora.moe'
license=('GPL-3.0-or-later')
# Run time. The app (Rune/winit/wgpu) loads Vulkan, xkbcommon and the Wayland and X11 client
# libraries with dlopen, so namcap cannot see them: they are listed by hand so both a Wayland and
# an X11 session work.
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
# cargo is provided by rust and by rustup (rustup users need a default toolchain).
makedepends=('cargo' 'pkgconf')
options=('!lto')
source=("$pkgname-$_rel.tar.gz::https://github.com/hanami117/kotora/releases/download/v$_rel/kotora-$_rel.tar.gz")
sha256sums=('e403e76ea2dd056231593e8ac4ad7ed3323e7a79e775e9d1ef98ba83a2205d2e')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The update check says "update with your AUR helper" and offers no download.
  export KOTORA_CHANNEL=aur
  # A source tarball has no .git: keep git from finding the AUR helper's clone above $srcdir, or
  # `kot --version` would show that clone's branch and hash.
  export GIT_CEILING_DIRECTORIES="$srcdir"
  cargo build --frozen --release -p kotora -p kotora-ctl
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Tests never touch the builder's own Kotora: scratch folders, no socket, no network.
  local scratch="$srcdir/check-home"
  mkdir -p "$scratch"
  KOTORA_TEST_INSTANCE=1 KOTORA_OFFLINE=1 KOTORA_CTL_SOCKET="$scratch/kotora.sock" \
    XDG_CONFIG_HOME="$scratch/config" XDG_DATA_HOME="$scratch/data" \
    XDG_CACHE_HOME="$scratch/cache" XDG_STATE_HOME="$scratch/state" XDG_RUNTIME_DIR="$scratch" \
    cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/kotora "$pkgdir/usr/bin/kotora"
  install -Dm755 target/release/kot "$pkgdir/usr/bin/kot"

  install -Dm644 packaging/linux/io.github.hanami117.kotora.desktop \
    "$pkgdir/usr/share/applications/io.github.hanami117.kotora.desktop"
  install -Dm644 assets/icons/io.github.hanami117.kotora.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.hanami117.kotora.svg"
  local icon size
  for icon in assets/icons/hicolor/*/apps/io.github.hanami117.kotora.png; do
    size=$(basename "$(dirname "$(dirname "$icon")")")
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$size/apps/io.github.hanami117.kotora.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY_NOTICES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
