# Maintainer: comodino <comodino at mailbox dot org>

pkgname=lossless
pkgver=0.1.0
pkgrel=2
pkgdesc='Bit-perfect music daemon for ALSA, with a CLI and a terminal UI'
arch=('x86_64' 'aarch64')
url='https://codeberg.org/comodino/lossless'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('cargo' 'git')
optdepends=('dbus: MPRIS media controls')
source=("git+$url.git#tag=v$pkgver?signed")
sha256sums=('39afcfb0f0e3e83e89dc4c3bb76fcb4e0fb835b09ee241fe9a7c36426613d763')
validpgpkeys=('337E26D8DAE4DE178834A5F4EC00AAF65545F0B8') # comodino

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
