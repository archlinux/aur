# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

_gitname=lk-jwt-service
pkgname="element-${_gitname}-git"
pkgver=r210.33e5465
pkgrel=1
pkgdesc='LiveKit Management Service for Element Call'
arch=(x86_64)
url='https://github.com/element-hq/lk-jwt-service/'
license=("AGPL-3")
makedepends=(rust git)
source=(
  "git+https://github.com/element-hq/lk-jwt-service.git"
  "${_gitname}.service"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd $_gitname
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}


build() {
  cd $_gitname
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  # https://github.com/aws/aws-lc-rs/issues/1211
  export CFLAGS=$(echo $CFLAGS | sed 's/-flto=[^ ]*//')
  cargo build --offline --release --all-features
}

package() {
  install -vDm755 $_gitname/target/release/lk-jwt-service -t "$pkgdir/usr/bin"
  install -vDm644 $_gitname.service -t "$pkgdir/usr/lib/systemd/system/"
}
