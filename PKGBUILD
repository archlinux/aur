# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ognibuild
pkgver=0.0.34
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5e102d9c51d506248afaf21d555f85494c8a9be5a612744d22474e7f6c9482ba')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
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
    deb-fix-build
    deb-upstream-deps
    dep-server
    ogni
    "$pkgname-deb"
    "$pkgname-dist"
    report-apt-deps-status
  )
  for target in ${targets[*]}; do
    install -Dm755 target/release/${target} -t "$pkgdir/usr/bin/"
  done
}
