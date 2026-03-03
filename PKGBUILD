# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ognibuild
pkgver=0.2.8
pkgrel=1
epoch=1
pkgdesc="Detect and invoke build systems"
arch=('x86_64')
url="https://github.com/jelmer/ognibuild"
license=('GPL-2.0-or-later')
depends=(
  'breezy'
  'glibc'
  'libgcc'
  'openssl'
  'python'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9f5cc2f96ace8a2d47c551ee0399bcc9bc93d652b96bff3f80c6df752f018c17')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release
}

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
