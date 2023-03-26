# Maintainer: Till Faelligen <tfaelligen at gmail dot com>
pkgname='matrix-conduit-git'
_pkgname='conduit'
pkgver=0.6.0.1841.gf704169a
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://conduit.rs'
pkgdesc='A Matrix homeserver written in Rust'
license=('Apache')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git' 'clang')
provides=('conduit')
source=(
  "$_pkgname::git+https://gitlab.com/famedly/conduit"
)
backup=(
  'etc/matrix-conduit/conduit.toml'
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd $_pkgname/
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

check() {
  cd "$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

build(){
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd $_pkgname
  install -D -m755 target/release/conduit "$pkgdir/usr/bin/matrix-conduit"
  install -D -m0644 conduit-example.toml "$pkgdir/etc/matrix-conduit/conduit.toml"
  install -D -m0644 conduit-example.toml "$pkgdir/usr/share/doc/matrix-conduit/conduit-example.toml"
  install -D -m0644 debian/matrix-conduit.service "$pkgdir/usr/lib/systemd/system/matrix-conduit.service"
}
