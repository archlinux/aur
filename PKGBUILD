# Maintainer: Noelo Lab <contact@noelo.org>
pkgname=kuna-git
pkgver=1.152.r152.a6507e95
pkgrel=1
pkgdesc="An agent-first decompiler designed to be refined by other agents (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/Noelo-Lab/kuna"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=('kuna')
conflicts=('kuna')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kuna"
  local major=$(tr -d '[:space:]' < VERSION)
  local last_bump=$(git log -1 --format=%H -- VERSION)
  local minor=$(git rev-list --count "${last_bump}..HEAD")
  local hash=$(git rev-parse --short HEAD)
  echo "${major}.${minor}.r${minor}.${hash}"
}

prepare() {
  cd "$srcdir/kuna/decompiler"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/kuna"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/kuna/target"

  cd decompiler
  cargo build --release --frozen -p kuna-cli -p kuna-console -p kuna-slacomp

  cd "$srcdir/kuna"
  "$srcdir/kuna/target/release/slacomp" -a specs
}

check() {
  cd "$srcdir/kuna/decompiler"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/kuna/target"
  cargo build --frozen -p kuna-harness
  cargo test --workspace --frozen -- --skip golden_opbehavior --skip resolve_extra_pop --skip diverges --skip panic --skip at4_widefloat_callarg_concat_built_with_keystone
}

package() {
  cd "$srcdir/kuna"

  install -Dm755 "$srcdir/kuna/target/release/kuna" "$pkgdir/usr/bin/kuna"
  install -Dm755 "$srcdir/kuna/target/release/decomp_dbg" "$pkgdir/usr/bin/decomp_dbg"
  install -Dm755 "$srcdir/kuna/target/release/slacomp" "$pkgdir/usr/bin/slacomp"

  install -dm755 "$pkgdir/usr/share/kuna/specs"
  cp -r specs/* "$pkgdir/usr/share/kuna/specs/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
