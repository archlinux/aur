# Maintainer: kojq <kojq@mailfence.com>

pkgname=dust-emu-git
_pkgname=dust
pkgver=0
pkgrel=1
pkgdesc='A Nintendo DS emulator written in Rust for desktop devices and the web, with debugging features and a focus on accuracy'
url=https://github.com/kelpsyberry/dust
source=(git+https://github.com/kelpsyberry/dust)
license=(GPL-3.0)
arch=(x86_64)
options=(!lto)
depends=(alsa-lib)
makedepends=(git rustup)
conflicts=(dust-emu dust-emu-bin)
provides=(dust-emu)
sha256sums=(SKIP)

prepare() {
  cd $_pkgname
  rustup default nightly
  cargo fetch --locked --target $CARCH-unknown-linux-gnu
}

build() {
  cd $_pkgname
  cargo build --frozen --profile ci --features=dldi --package dust-desktop
}

check() {
  cd $_pkgname
  cargo test --frozen --release --package dust-desktop
}

package() {
  cd $_pkgname
  install -Dm755 -t $pkgdir/usr/bin target/ci/dust-desktop
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}
