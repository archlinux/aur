# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Till Faelligen <tfaelligen at gmail dot com>
pkgname='conduwuit-git'
_pkgname='conduwuit'
pkgver=0.7.0.2615.g7809f0a6
pkgrel=1
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/girlbossceo/conduwuit'
pkgdesc='a fork of the matrix homeserver'
license=('Apache')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git' 'clang')
provides=('conduwuit')
source=(
  "$_pkgname::git+https://github.com/girlbossceo/conduwuit.git"
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
  install -D -m0644 conduwuit-example.toml "$pkgdir/etc/matrix-conduit/conduit.toml"
  install -D -m0644 conduwuit-example.toml "$pkgdir/usr/share/doc/conduwuit/matrix-conduwuit.toml"
  install -D -m0644 debian/matrix-conduit.service "$pkgdir/usr/lib/systemd/system/matrix-conduit.service"
}
