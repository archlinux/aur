# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
# Contributor: Orhun Parmaksız <orhun@archlinux.org>

pkgname=tek
_pkgver=0.3.0-rc.1
pkgver=0.3.0.rc.1
pkgrel=1
pkgdesc='A colorful music making program for your linux terminal'
arch=('x86_64')
url="https://codeberg.org/unspeaker/$pkgname"
license=('custom:tek')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha256sums=('13dd96aef8590346160e3c9fdebdc22cc40f46fdb7e8f80e3d5a7c843fd4a298')
makedepends=('cargo')
depends=('pipewire-jack' 'gcc-libs' 'git')

_binaries=(
  "${pkgname}_arranger"
  "${pkgname}_groovebox"
  "${pkgname}_sampler"
  "${pkgname}_sequencer"
  "${pkgname}_transport"
)

prepare() {
  cd "$pkgname"
  cd "deps"
  rmdir rust-jack
  git clone https://codeberg.org/unspeaker/rust-jack
  rmdir tengri
  git clone https://codeberg.org/unspeaker/tengri
  cd ..
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTFLAGS=-Awarnings
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname"
  
  for bin in "${_binaries[@]}"; do
    install -Dm0755 "target/release/$bin" -t "$pkgdir/usr/bin"
  done
  
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
