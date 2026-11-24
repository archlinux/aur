# Maintainer: comodino <comodino at mailbox dot org>

pkgname=lossless
pkgver=0.1.0
pkgrel=1
pkgdesc='Bit-perfect music daemon for ALSA, with a CLI and a terminal UI'
arch=('x86_64' 'aarch64')
url='https://codeberg.org/comodino/lossless'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('dbus: MPRIS media controls')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a909539f73f4e8c24f0bcb91109319d4f11342ee29534d77842a4095efdca534')

_features='lossless-daemon/mpris,lossless-tui/scripts'

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --workspace --features "$_features"
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --workspace --features "$_features"
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/{losslessd,lossless,losslessd-tui} -t "$pkgdir/usr/bin/"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
