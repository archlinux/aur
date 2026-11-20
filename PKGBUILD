# Maintainer: LIghtJUNction
pkgname=zcalld
pkgver=0.2.0
pkgrel=1
pkgdesc='Compact Linux AI gateway built on zcall with native zplugin extensions'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zcalld'
license=('MIT')
depends=('glibc' 'libgcc' 'curl')
makedepends=('cargo')
checkdepends=('python')
optdepends=('systemd: system and user service management' 'zcalld-compat>=0.1.3: privacy, audit history, OAuth accounts and community plugins' 'zcall-gui: optional native desktop interface' 'libsecret: configure Zed credentials through Secret Service')
backup=('etc/zcalld/config.conf')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/zcalld-$pkgver-source.tar.gz")
sha256sums=('4aba9a62008c868dafbee774651cb504774c737c2939f2f78b95d9243528b550')

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
