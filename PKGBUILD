# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=spinframework-cli
_realname=spin
pkgver=3.3.1
pkgrel=2
pkgdesc='an open source framework for building and running fast, secure, and composable cloud microservices with WebAssembly'
arch=('x86_64')
url="https://spinframework.dev/"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'openssl' 'sqlite')
makedepends=('cargo' 'rust-wasm' 'cmake' 'git')
source=("${_realname}-${pkgver}.tar.gz::https://github.com/spinframework/spin/archive/v${pkgver}.tar.gz"
	"01-fix-compiler-warnings.patch")
options=("!debug")
# this package was previously called fermyon-spin
conflicts=("fermyon-spin")
provides=("fermyon-spin")

prepare() {
  cd $_realname-$pkgver
  # fix compile errors with onig 6.4.0 / onig_sys 69.8.1
  cargo update onig

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  patch -p1 < $srcdir/01-fix-compiler-warnings.patch
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

sha256sums=('5137573e757a7d2cef68bf59b4a4a017149f3286353e68e16aeb6686b100f653'
            'b6694fc7699efd915d8a3049e8ed85bdd67a0fc1b5cee346db49d470ba9b4476')
