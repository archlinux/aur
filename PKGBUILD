# Maintainer: Albert Sebastian <albertsebe2 at gmail dot com> 

pkgname=wstunnel
pkgver=9.2.5
pkgrel=1
pkgdesc="Tunnel all your traffic over websocket protocol - Bypass firewalls/DPI"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/erebe/wstunnel"
license=('BSD-3-Clause')
provides=('wstunnel')
conflicts=('wstunnel-bin' 'nodejs-wstunnel' 'haskell-wstunnel-bin')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'git')
source=("https://github.com/erebe/wstunnel/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5ad84a9e888539a63e81df4a7e8702e228b7e0fc5a51777bdb45ec0ebe36140d')

prepare() {
  cd $pkgname-$pkgver

  RUSTUP_TOOLCHAIN=stable \
  cargo fetch \
  --locked \
  --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver

  CARGO_TARET_DIR=target \
  RUSTUP_TOOLCHAIN=stable \
  cargo build \
  --frozen \
  --release
}

package() {
  cd $pkgname-$pkgver

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
