# Maintainer: Noelo Lab <contact@noelo.org>
pkgname=kuna-git
pkgver=1.121.r121.g0123456
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
  export CARGO_TARGET_DIR="target"

  cd decompiler
  cargo build --release --frozen -p kuna-cli -p kuna-console -p kuna-slacomp

  cd "$srcdir/kuna"
  ./decompiler/target/release/slacomp -a specs
}

check() {
  cd "$srcdir/kuna/decompiler"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo test --workspace --frozen
}

package() {
  cd "$srcdir/kuna"

  install -Dm755 decompiler/target/release/kuna "$pkgdir/usr/bin/kuna"
  install -Dm755 decompiler/target/release/decomp_dbg "$pkgdir/usr/bin/decomp_dbg"
  install -Dm755 decompiler/target/release/slacomp "$pkgdir/usr/bin/slacomp"

  install -dm755 "$pkgdir/usr/share/kuna/specs"
  cp -r specs/* "$pkgdir/usr/share/kuna/specs/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
