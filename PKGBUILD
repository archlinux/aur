# Maintainer: Carlos Prieto (prietus)
pkgname=obiplayer-git
_pkgname=obiplayer
pkgver=r0.0000000
pkgrel=1
pkgdesc="MPD client for people who care about editions, pressings and sound quality (GTK4/libadwaita)"
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/obiplayer"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'ffmpeg' 'glib2' 'gcc-libs' 'glibc')
optdepends=('mpd: local music server')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto')
source=("$_pkgname::git+https://github.com/prietus/obiplayer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p obiplayer
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release -p obiplayer-core
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/obiplayer "$pkgdir/usr/bin/obiplayer"
  install -Dm644 data/us.priet.ObiPlayer.desktop "$pkgdir/usr/share/applications/us.priet.ObiPlayer.desktop"
  install -Dm644 data/us.priet.ObiPlayer.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/us.priet.ObiPlayer.svg"
  install -Dm644 data/us.priet.ObiPlayer.metainfo.xml "$pkgdir/usr/share/metainfo/us.priet.ObiPlayer.metainfo.xml"
}
