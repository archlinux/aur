# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=zerobrew
_pkgname="${pkgname%-git}"
pkgver=r89.067c213
pkgrel=1
pkgdesc='A drop-in, 5-20x faster, experimental Homebrew alternative.'
arch=('x86_64' 'aarch64')
url='https://github.com/lucasgelfond/zerobrew'
license=('MIT' 'Apache-2.0')
makedepends=('cargo' 'git')
options=(!lto)
provides=('zb')
conflicts=('zerobrew' 'zerobrew-bin')
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # there are no tags then use number of revisions since beginning of the history
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

package() {
  cd "$_pkgname"
  install -Dm0755 "target/release/zb" "$pkgdir/usr/bin/zb"
  install -Dm644 LICENSE-MIT.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

