# Maintainer: kojq <kojq@mailfence.com>

pkgname=dust-emu-git
_pkgname=dust
pkgver=r210.618a418
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

pkgver() {
  cd $_pkgname
  printf r%s.%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
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
  install -Dm755 target/ci/dust-desktop -t $pkgdir/usr/bin
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}
