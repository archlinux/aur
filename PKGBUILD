# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Till Faelligen <tfaelligen at gmail dot com>
pkgname='conduwuit-git'
_pkgname='conduwuit'
epoch=1
pkgver=0.3.1.3213.g42e35671
pkgrel=1
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/girlbossceo/conduwuit'
pkgdesc='A very cool, featureful fork of the Conduit matrix server'
license=('Apache')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git' 'clang')
provides=('conduwuit')
source=(
  "$_pkgname::git+https://github.com/girlbossceo/conduwuit.git"
  "$_pkgname.service"
)
backup=(
  'etc/conduwuit/conduwuit.toml'
)
sha256sums=('SKIP'
            '94a643d2731bbd4279c14baa83a9e417cbe7b6ec9522a035f12fe3718274069c')
options=(!lto) # lto breaks linking with vendored dependencies (ring, zstd, rocksdb) due to unresolved symbols

prepare() {
  cd "$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
  export CONDUWUIT_VERSION_EXTRA=$(git rev-parse --short HEAD)
  cargo build --frozen --release
}

package() {
  install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/conduwuit.service"

  cd "$_pkgname"
  install -D -m755 target/release/conduit "$pkgdir/usr/bin/conduwuit"
  install -D -m0644 conduwuit-example.toml "$pkgdir/etc/conduwuit/conduwuit.toml"
  install -D -m0644 conduwuit-example.toml "$pkgdir/usr/share/doc/conduwuit/conduwuit-example.toml"
}

# vim: set et ts=2:
