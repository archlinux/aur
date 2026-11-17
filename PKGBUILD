# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=pitchfork
pkgver=2.34.0
pkgrel=1
pkgdesc='Daemons with DX'
arch=('x86_64')
url='https://pitchfork.jdx.dev'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'nodejs' 'pnpm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/pitchfork/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4e85f09420d16fdefc94da42015347f163dbf8e0b9c50fe8b216a77cd8e1b989')
b2sums=('a85438aedcfd3c0f6dc1dd3ddb67ff953ef81b98d1cca08850109652637d2229a1a591b80b5051469bcc7b77a98a85a538341323312a4cf63884fb145b4b4f54')
options=('!lto')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc --print host-tuple)"

  cd ui
  pnpm install --frozen-lockfile
}

build() {
  cd "$pkgname-$pkgver"

  cd ui
  pnpm run build
  cd ..

  CARGO_TARGET_DIR=target \
    cargo build --frozen --release
}

# TODO: Fix tests
# check() {
#   cd "$pkgname-$pkgver"
#
#   RUSTFLAGS="$RUSTFLAGS -C debug-assertions" \
#     cargo test --frozen
# }

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/pitchfork

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}
