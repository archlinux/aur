# Maintainer: bipin kumar <kbipinkumar@pm.me>
pkgname=salmon2
_pkgname=salmon
provides=('salmon')
conflicts=('salmon' 'salmon-cpp')
pkgver=2.0.0
pkgrel=0
pkgdesc="Highly-accurate & wicked fast transcript-level quantification from RNA-seq reads using lightweight alignments (v2)"
arch=('x86_64')
url="https://combine-lab.github.io/$_pkgname/"
license=('BSD-3-Clause')
depends=('glibc' 'bzip2' 'xz')
makedepends=('cargo')
options=('!emptydirs' '!lto')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/COMBINE-lab/salmon/archive/v$pkgver.tar.gz")
sha256sums=('5d118d0e18c999984407e46fad17d3aadb7d2f6076f6402578b2d84b6bf46b70')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/salmon" "$pkgdir/usr/bin/salmon"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
