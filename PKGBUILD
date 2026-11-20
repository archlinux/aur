# Maintainer: LIghtJUNction
pkgname=zcalld
pkgver=0.2.4
pkgrel=1
pkgdesc='Compact Linux AI gateway built on zcall with native zplugin extensions'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zcalld'
license=('MIT')
depends=('glibc' 'libgcc' 'curl')
makedepends=('cargo')
checkdepends=('python')
optdepends=('systemd: system and user service management' 'zcalld-compat>=0.1.5: privacy, audit history, OAuth accounts and community plugins' 'zcall-gui: optional native desktop interface' 'libsecret: configure Zed credentials through Secret Service')
backup=('etc/zcalld/config.conf')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/zcalld-$pkgver-source.tar.gz")
sha256sums=('be26976f7cb84e18dc584dc25a9959fa9d97473862bfef03f41092029c10f524')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --workspace
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace --all-targets
  python scripts/integration.py
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
