# Maintainer: Albert Sebastian <albertsebe2 at gmail dot com> 

pkgname=wstunnel
pkgver=9.7.1
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
sha256sums=('c623e5ee46569795b5bad9186ab070b9d6e5b8c267c4631c6289af23b8d57e77')

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
