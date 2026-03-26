# Maintainer: Johannes Schöpp <darkdiscover at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=evtx
pkgver=0.11.2
pkgrel=1
pkgdesc="Cross-platform parser for Windows XML EventLog Format"
arch=('x86_64')
url="https://github.com/omerbenamram/evtx"
license=('MIT' 'Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b1a8d6c2e176fc67d9c6431255847d657024ac4ec32c8752375e189171bcfa57')

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "$pkgname-$pkgver"
  cargo build --frozen --release
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  cd "$pkgname-$pkgver"
  # skipping template_research since those tests depend on files hosted on
  # git-lfs and are not included in the tar ball
  cargo test --frozen -- --skip wevt_templates_research
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm755 target/release/evtx_dump -t "$pkgdir/usr/bin/"
  install -Dvm644 LICENSE-{APACHE,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
