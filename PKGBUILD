# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=retoc
pkgver=0.1.5
pkgrel=1
pkgdesc="Convert Unreal Engine IoStore (.utoc/.ucas) containers to/from legacy .pak format"
arch=('x86_64')
url="https://github.com/trumank/retoc"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/trumank/retoc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('77db43389db898a5dbc0046fa266bcf1a318a45958a774a36060ea854f9141f3')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # jmap is a git dependency; allow cargo to fetch all deps (incl. git) here.
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Arch's makepkg.conf sets CFLAGS="-march=native ...". That flag reaches the
  # `ring` crate's asm build via the cc crate and breaks its p384 object link
  # (undefined ring_core_*_p384_* symbols). Drop the injected C/linker flags;
  # ring builds and links cleanly with cargo's own defaults.
  unset CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS
  cargo build --release --bin retoc
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/retoc" "$pkgdir/usr/bin/retoc"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

latestver() {
  gh api --paginate repos/trumank/retoc/tags --jq '.[].name' |
      sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}
