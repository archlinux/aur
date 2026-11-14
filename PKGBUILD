# Maintainer: chlorine3539 <undecided2448@proton.me>
#
# AUR package: builds the latest upstream git HEAD. Publish the project to
# https://github.com/chlorine3539/studyplan before submitting this PKGBUILD.

pkgname=studyplan-git
# Placeholder only: pkgver() computes the real version on every build.
pkgver=0.1.0.r1.g5a2c6bd
pkgrel=1
pkgdesc='Turn YouTube course playlists into a daily study to-do list, with a terminal UI'
arch=('x86_64' 'aarch64')
url='https://github.com/chlorine3539/studyplan'
license=('MIT')
depends=('gcc-libs' 'yt-dlp')
makedepends=('cargo' 'git')
provides=('studyplan')
conflicts=('studyplan')
source=("git+$url.git")
sha256sums=('SKIP')

_commitname=studyplan

pkgver() {
  cd "$srcdir/$_commitname"
  printf '%s.r%s.g%s' \
    "$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -n1)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_commitname"
  cargo fetch --locked
}

build() {
  cd "$srcdir/$_commitname"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/$_commitname"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo test --frozen --all-features
}

package() {
  install -Dm755 "$srcdir/target/release/studyplan" "$pkgdir/usr/bin/studyplan"
  install -Dm644 "$srcdir/$_commitname/README.md" "$pkgdir/usr/share/doc/studyplan/README.md"
  install -Dm644 "$srcdir/$_commitname/LICENSE" "$pkgdir/usr/share/licenses/studyplan/LICENSE"
}
