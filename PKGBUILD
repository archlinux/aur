# Maintainer: Joseph R. Quinn <quinn.josephr@gmail.com>
pkgname=tuxtunes-git
# Set by pkgver() below; this value only matters before the first build.
pkgver=0.1.0.r1.g13b0860
pkgrel=1
# pkgver() used to count every commit ($ver.r<rev-list count>), which put
# the last untagged build at 0.1.0.r278. Now that the repo is tagged, it
# counts commits since the tag instead, so v0.1.0 restarts at r1 — a
# lower version than what is already installed. The epoch keeps upgrades
# moving forwards across that one-time reset; it can go back to 0 (or be
# dropped) if the package is ever rebuilt from scratch.
epoch=1
pkgdesc="Music library manager and player (Tauri + Angular)"
arch=('x86_64' 'aarch64')
url="https://github.com/quinnjr/tuxtunes"
license=('MIT' 'Apache-2.0')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
  'mpv'
  'sqlite'
  'dbus'
  'openssl'
  'xdg-utils'
)
optdepends=(
  'ffmpeg: convert library files to FLAC or M4A'
)
makedepends=(
  'git'
  'cargo'
  'nodejs'
  'npm'
)
provides=('tuxtunes')
conflicts=('tuxtunes')
# Set TUXTUNES_SRC=file:///path/to/checkout to build from a local clone.
source=("$pkgname::git+${TUXTUNES_SRC:-$url.git}#branch=develop"
        'tuxtunes.desktop')
sha256sums=('SKIP'
            'SKIP')

# The repo is pnpm-only, but Arch's pnpm package collides with an
# npm-global pnpm (both own /usr/bin/pnpm), so it is not a makedepend.
# Use whatever pnpm is on PATH — pnpm 10+ switches itself to the
# version pinned in package.json's "packageManager" — and otherwise
# fetch exactly that version through npx.
_pnpm() {
  if command -v pnpm >/dev/null 2>&1; then
    pnpm "$@"
  else
    local ver
    ver=$(node -p "require('./package.json').packageManager.split('@')[1]")
    npx --yes "pnpm@$ver" "$@"
  fi
}

# <last tag without the v>.r<commits since it>.g<short sha>, e.g.
# 0.1.0.r1.g13b0860. --long keeps the r/g suffix even when HEAD is
# exactly on a tag, so a release build sorts consistently with the
# builds either side of it rather than dropping to a bare 0.1.0.
#
# Falls back to the old count-every-commit form when no tag is reachable
# — a shallow clone, or a fork that has never tagged — so the build does
# not simply fail there.
pkgver() {
  cd "$pkgname"
  if git describe --tags --long >/dev/null 2>&1; then
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    local ver
    ver=$(sed -n 's/^version = "\(.*\)"/\1/p' src-tauri/Cargo.toml | head -1)
    printf '%s.r%s.g%s' "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$pkgname"
  _pnpm install --frozen-lockfile
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export NG_CLI_ANALYTICS=false
  _pnpm exec tauri build --no-bundle -- --frozen
}

package() {
  cd "$pkgname"
  install -Dm755 src-tauri/target/release/tuxtunes "$pkgdir/usr/bin/tuxtunes"
  install -Dm755 src-tauri/target/release/tuxtunes-cli "$pkgdir/usr/bin/tuxtunes-cli"
  install -Dm644 "$srcdir/tuxtunes.desktop" "$pkgdir/usr/share/applications/tuxtunes.desktop"
  install -Dm644 src-tauri/icons/32x32.png      "$pkgdir/usr/share/icons/hicolor/32x32/apps/tuxtunes.png"
  install -Dm644 src-tauri/icons/128x128.png    "$pkgdir/usr/share/icons/hicolor/128x128/apps/tuxtunes.png"
  install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/tuxtunes.png"
  install -Dm644 src-tauri/icons/icon.png       "$pkgdir/usr/share/icons/hicolor/512x512/apps/tuxtunes.png"
  install -Dm644 LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
