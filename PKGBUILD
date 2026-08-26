# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=spinframework-cli
_realname=spin
pkgver=4.1.0
pkgrel=1
pkgdesc='an open source framework for building and running fast, secure, and composable cloud microservices with WebAssembly'
arch=('x86_64')
url="https://spinframework.dev/"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++' 'openssl' 'sqlite')
makedepends=('cargo' 'rust-wasm' 'cmake' 'git')
source=("https://github.com/spinframework/spin/archive/v${pkgver}/${_realname}-${pkgver}.tar.gz")
options=("!lto" "!debug")
# this package was previously called fermyon-spin
conflicts=("fermyon-spin")
provides=("fermyon-spin")

prepare() {
  cd $_realname-$pkgver

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $_realname-$pkgver

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1 # force building against system sqlite libraries (negate bundled feature)
  cargo build --frozen --target "$CARCH-unknown-linux-gnu" --release --bin spin
}

package() {
  install -Dm0755 $_realname-$pkgver/target/$CARCH-unknown-linux-gnu/release/spin "$pkgdir"/usr/bin/spin-cli
}

sha256sums=('2d6784dc4b2fa5dc055abd9b8058d5a187a15ba21e5a13b2a4c0030fa9e3b702')
