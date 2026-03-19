# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ognibuild
pkgver=0.2.10
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
sha256sums=('443f74862bdc64d01c0d0f84470eb31d939c3a57175f1092febda69f519a650d')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # https://github.com/aws/aws-lc-rs/issues/1008#issuecomment-3774105038
  export AWS_LC_SYS_NO_JITTER_ENTROPY=1

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
