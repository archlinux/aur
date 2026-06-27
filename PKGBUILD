# Maintainer: vi <vi70x3@atomicmail.io>

pkgname=animaksmd-git
pkgver=0.1.0.r23.g50b106c
pkgrel=1
pkgdesc="Rust userspace KSM daemon with a PSI-aware governor and memory scanner"
arch=('x86_64')
url="https://github.com/animaios/animaksm"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=('animaksmd' 'animaksm')
conflicts=('animaksmd' 'animaksm')
backup=('etc/animaksm.toml')
install=animaksmd-git.install
source=("git+https://github.com/animaios/animaksm.git"
        "$pkgname.tmpfiles")
b2sums=('SKIP'
        '7da2a448820d75d113802e5cd8d09ccdcb68ff4f20c141a16d2f468da29398cb771b21c36a56864ba852162a2c874c29ee9fb7c264e757fc633a8ac8325b337d')

pkgver() {
  cd animaksm
  local version
  version="$(cargo metadata --locked --no-deps --format-version=1 \
    | sed -n 's/.*"name":"animaksm-daemon","version":"\([^"]*\)".*/\1/p')"
  printf '%s.r%s.g%s' "${version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd animaksm
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd animaksm
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --workspace
}

check() {
  cd animaksm
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd animaksm

  install -Dm755 target/release/animaksm "$pkgdir/usr/bin/animaksm"
  install -Dm755 target/release/animaksm-swap-proxy "$pkgdir/usr/bin/animaksm-swap-proxy"

  install -Dm644 config/animaksm.toml "$pkgdir/etc/animaksm.toml"

  install -Dm644 systemd/animaksm.service "$pkgdir/usr/lib/systemd/system/animaksm.service"
  install -Dm644 systemd/animaksm-swap-proxy.service "$pkgdir/usr/lib/systemd/system/animaksm-swap-proxy.service"
  sed -i 's#/usr/local/bin/#/usr/bin/#g' \
    "$pkgdir/usr/lib/systemd/system/animaksm.service" \
    "$pkgdir/usr/lib/systemd/system/animaksm-swap-proxy.service"

  install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
