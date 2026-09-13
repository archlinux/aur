# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@disroot.org>
pkgname=cassis-git
_pkgname=cassis
pkgver=41.b06a04c.0.1.1
pkgrel=1
pkgdesc="Fast and powerful music player with a Rust core and thin frontends (git version)"
arch=('x86_64')
url="https://git.disroot.org/trougnouf/cassis"
license=('GPL-3.0-or-later')
depends=(
    'gcc-libs'
    'glibc'
    'opus'       # opus playback (libopus, linked by the opus crate)
    'libogg'     # ogg container demuxer (libogg, linked by the ogg crate)
    'alsa-lib'   # audio output via cpal/rodio
)
makedepends=('cargo' 'pkgconf' 'git')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
options=('!lto' '!strip' '!debug')

pkgver() {
  cd "$_pkgname"
  local commit_hash=$(git rev-parse --short HEAD)
  local commit_count=$(git rev-list --count HEAD)
  local latest_tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "rolling")
  # Strip leading package-name prefixes (e.g. cassis-core-v0.1.1 -> 0.1.1)
  # and sanitize characters that makepkg forbids in pkgver.
  latest_tag="${latest_tag##*-v}"
  latest_tag="${latest_tag#v}"
  latest_tag="${latest_tag//[-\/]/.}"
  echo "$commit_count.$commit_hash.$latest_tag"
}

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$_pkgname"

  install -Dm755 "target/release/cassis-tui" "$pkgdir/usr/bin/cassis-tui"
  install -Dm755 "target/release/cassis-ctl" "$pkgdir/usr/bin/cassis-ctl"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
