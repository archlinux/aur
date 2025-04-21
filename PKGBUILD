# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=edgee
pkgver=1.2.0
pkgrel=1
pkgdesc='The full-stack edge platform for your edge oriented applications'
arch=('x86_64')
url='https://www.edgee.cloud'
license=('Apache-2.0')
depends=('openssl' 'bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/edgee-cloud/edgee/archive/v$pkgver.tar.gz")
sha256sums=('c2753b42d2e0d53e24c5a816df213f92d519ab9f78cf335bc54597ed55378bd0')
b2sums=('8219e57c0748466bd34326a4bd8bdfaf761cb45009d59c095e8d8c2cd8bd5565af2e272f0ca399b0e19811c63e9e5e7101691ce488bd326441f158696082371c')
options=('!lto')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR=target \
  cargo build --frozen --release --package edgee --bin edgee
}

check() {
  cd "$pkgname-$pkgver"

  RUSTFLAGS="$RUSTFLAGS -C debug-assertions" cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/edgee

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}
