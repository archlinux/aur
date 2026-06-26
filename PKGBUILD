# Maintainer: bipin kumar <kbipinkumar@pm.me>
pkgname=salmon2
_pkgname=salmon
provides=('salmon')
conflicts=('salmon' 'salmon-cpp')
pkgver=2.1.2
pkgrel=1
pkgdesc="Highly-accurate & wicked fast transcript-level quantification from RNA-seq reads using lightweight alignments (v2)"
arch=('x86_64')
url="https://combine-lab.github.io/$_pkgname/"
license=('BSD-3-Clause')
depends=('glibc' 'bzip2' 'xz')
makedepends=('cargo')
options=('!emptydirs' '!lto')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/COMBINE-lab/salmon/archive/v$pkgver.tar.gz")
sha256sums=('3afe902cb7bab1546b8f05267e99b209846b276a1db09cd787401348bafa92ff')

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
  ulimit -n 4096
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
