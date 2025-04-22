# Maintainer: xiretza <aur@xiretza.xyz>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Till Faelligen <tfaelligen at gmail dot com>
_pkgname='grapevine'
pkgname="$_pkgname-git"
epoch=1
pkgver=r2814.d1370f9
pkgrel=1
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://gitlab.computer.surgery/matrix/grapevine'
pkgdesc='A matrix homeserver originally forked from Conduit'
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git' 'clang')
provides=("$_pkgname=$pkgver")
source=(
  "$_pkgname::git+$url.git"
  "$_pkgname.service"
  "$_pkgname-example.toml"
)
backup=(
  "etc/$_pkgname/$_pkgname.toml"
)
sha256sums=('SKIP'
            '07bcf3b52875c2fad1dcbe58dd77d95cf5a5ce98274afe293bb1fadc182157db'
            '5077a130242acd8328e1f61f7da0260a14dfdbfc964e6472248f9b6f8f28741c')
options=(!lto) # lto breaks linking with vendored dependencies (ring, zstd, rocksdb) due to unresolved symbols

prepare() {
  cd "$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
  export GRAPEVINE_VERSION_EXTRA=$(git rev-parse --short HEAD)
  cargo build --frozen --release
}

package() {
  install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 "$_pkgname-example.toml" "$pkgdir/etc/$_pkgname/$_pkgname-example.toml"

  cd "$_pkgname"
  install -D -m755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

# vim: set et ts=2:
