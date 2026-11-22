# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Chris Down <chris@chrisdown.name>

pkgname=udp-over-tcp
pkgver=0.5.0
pkgrel=1
pkgdesc="Proxy UDP traffic over a TCP stream"
arch=('i686' 'x86_64')
url="https://github.com/mullvad/udp-over-tcp"
license=('Apache-2.0 AND MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('608f77d630e3895622f47f2ec502b16a7089c967d99e083ea4cdff64bef1e9bc')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable \
  cargo fetch \
  --locked \
  --target "$(rustc -vV | sed -n 's/host: //p')"

}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  CARGO_TARET_DIR=target \
  RUSTUP_TOOLCHAIN=stable \
  cargo \
  build \
  --frozen \
  --release \
  --all-features

}

package() {
  cd "$srcdir"/udp-over-tcp-"$pkgver"

  RUSTUP_TOOLCHAIN=stable cargo install \
    --all-features \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path .
}
