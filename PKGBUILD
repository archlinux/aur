# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=hdrcopier
pkgname=$_pkgname-git
pkgver=0.2.3.r22.91c75fa
pkgrel=1
pkgdesc='Copies colorspace and HDR metadata from one file to another'
arch=(x86_64)
url=https://github.com/shssoichiro/hdrcopier
license=(MIT)
makedepends=(
  git
  cargo
)
depends=(
  mkvtoolnix-cli
  mediainfo
  ffmpeg
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  git -C $_pkgname describe --long --tags | \
    sed -E 's/^v//; s/-([^-]*)-g([^-]*)$/-r\1.\2/; s/-/./g'
}

prepare() {
  cd $_pkgname
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd $_pkgname
  RUSTUP_TOOLCHAIN=stable
  CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

package() {
  install -Dvm755 $_pkgname/target/release/$_pkgname -t "$pkgdir/usr/bin"
  install -Dm644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
