# Maintainer: Noelo Lab <contact@noelo.org>
pkgname=kuna
pkgver=1.197
pkgrel=1
pkgdesc="An agent-first decompiler designed to be refined by other agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Noelo-Lab/kuna"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname/decompiler"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/$pkgname/target"
  export CARGO_PROFILE_DEV_DEBUG=0
  export CARGO_PROFILE_TEST_DEBUG=0

  cd decompiler
  cargo build --release --frozen -p kuna-cli -p kuna-console -p kuna-slacomp

  cd "$srcdir/$pkgname"
  "$srcdir/$pkgname/target/release/slacomp" -a specs
}

check() {
  cd "$pkgname/decompiler"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/$pkgname/target"
  export CARGO_PROFILE_DEV_DEBUG=0
  export CARGO_PROFILE_TEST_DEBUG=0
  cargo build --frozen -p kuna-harness
  cargo test --workspace --frozen -- --skip golden_opbehavior --skip resolve_extra_pop --skip diverges --skip panic --skip at4_widefloat_callarg_concat_built_with_keystone
}

package() {
  cd "$pkgname"

  install -Dm755 "$srcdir/$pkgname/target/release/kuna" "$pkgdir/usr/bin/kuna"
  install -Dm755 "$srcdir/$pkgname/target/release/decomp_dbg" "$pkgdir/usr/bin/decomp_dbg"
  install -Dm755 "$srcdir/$pkgname/target/release/slacomp" "$pkgdir/usr/bin/slacomp"

  install -dm755 "$pkgdir/usr/share/kuna/specs"
  cp -r specs/* "$pkgdir/usr/share/kuna/specs/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
