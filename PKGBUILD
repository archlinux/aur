# Maintainer:  shtrophic <aur at shtrophic dot net>
# Contributor: Albert Sebastian <albertsebe2 at gmail dot com>

pkgname=wstunnel
pkgver=10.5.1
pkgrel=1
pkgdesc="tunnel all your traffic over Websocket or HTTP2"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
options=('!lto')
url="https://github.com/erebe/wstunnel"
license=('BSD-3-Clause')
provides=('wstunnel')
conflicts=('wstunnel-bin' 'nodejs-wstunnel' 'haskell-wstunnel-bin')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'git')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cf600e97ec15d243be6f32f5418ff48ab59f0714258f18f7dc7b95759847a9d7')

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
