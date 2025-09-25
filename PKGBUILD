# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=spinframework-cli
_realname=spin
pkgver=3.4.1
pkgrel=1
pkgdesc='an open source framework for building and running fast, secure, and composable cloud microservices with WebAssembly'
arch=('x86_64')
url="https://spinframework.dev/"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'openssl' 'sqlite')
makedepends=('cargo' 'rust-wasm' 'cmake' 'git')
source=("${_realname}-${pkgver}.tar.gz::https://github.com/spinframework/spin/archive/v${pkgver}.tar.gz")
options=("!debug")
# this package was previously called fermyon-spin
conflicts=("fermyon-spin")
provides=("fermyon-spin")

prepare() {
  cd $_realname-$pkgver

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $_realname-$pkgver
  export CFLAGS+=' -ffat-lto-objects' # fix issue compiling ring
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1 # force building against system sqlite libraries (negate bundled feature)
  cargo build --frozen --release --bin spin
}

package() {
  install -Dm0755 $_realname-$pkgver/target/release/spin "$pkgdir"/usr/bin/spin-cli
}

sha256sums=('196d6bbd9a9291fa3f87453cf8d0adfdcadfc504f7a6ce2d9456fdd51c79e0f0')
