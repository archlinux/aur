# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
# Contributor: Orhun Parmaksız <orhun@archlinux.org>

pkgname=tek
_pkgver=0.2.0-rc.6
pkgver=0.2.0.rc6
pkgrel=2
pkgdesc='A colorful music making program for your linux terminal'
arch=('x86_64')
url="https://codeberg.org/unspeaker/$pkgname"
license=('custom:tek')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha256sums=('15966fba23b6ea121522ebfa741cfaf73fd3b306869bd690912aa54857c7a2d1')
makedepends=('cargo')
depends=('pipewire-jack' 'gcc-libs')

_binaries=(
  "${pkgname}_arranger"
  "${pkgname}_groovebox"
  "${pkgname}_sampler"
  "${pkgname}_sequencer"
  "${pkgname}_transport"
)

prepare() {
  cd "$pkgname"
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
