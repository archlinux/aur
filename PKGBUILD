# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ognibuild
pkgver=0.2.0
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
sha256sums=('3506ca56d2d76924f8e66a795e8cad27addcd1951a8a1aadaeb2e05e35db2f3c')

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
