# Maintainer: Albert Sebastian <albertsebe2 at gmail dot com> 

pkgname=wstunnel
pkgver=10.1.9
pkgrel=1
pkgdesc="Tunnel all your traffic over websocket protocol - Bypass firewalls/DPI"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
options=('!lto')
url="https://github.com/erebe/wstunnel"
license=('BSD-3-Clause')
provides=('wstunnel')
conflicts=('wstunnel-bin' 'nodejs-wstunnel' 'haskell-wstunnel-bin')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'git')
source=("https://github.com/erebe/wstunnel/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('64977a8a453b4f35f8722dfb339d7a0c3cd197c513ef885269ece556294b1d1b')

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
  -p $pkgname-cli \
  --frozen \
  --release
}

package() {
  cd $pkgname-$pkgver

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
