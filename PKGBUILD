# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ognibuild
pkgver=0.1.5
pkgrel=1
epoch=1
pkgdesc="Detect and invoke build systems"
arch=('x86_64')
url="https://github.com/jelmer/ognibuild"
license=('GPL-2.0-or-later')
depends=(
  'breezy'
  'gcc-libs'
  'glibc'
  'openssl'
  'python'
)
makedepends=('cargo')
#checkdepends=('mmdebstrap')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b521c210ded4da2aa3246e57b4243d61fd7fa05410aea73ca508109a07a94b69')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

#check() {
#  cd "$pkgname-$pkgver"
#  export RUSTUP_TOOLCHAIN=stable

  # Exclude debian features:
#  cargo test --frozen --no-default-features --features=breezy,dep-server,upstream || :
#}

package() {
  cd "$pkgname-$pkgver"

  targets=(
    ogni
    "$pkgname-dist"
  )
  for target in ${targets[*]}; do
    install -Dm755 target/release/${target} -t "$pkgdir/usr/bin/"
  done
}
