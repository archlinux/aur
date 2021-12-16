# Maintainer: George Rawlinson <grawlinson@archlinux.org>
pkgname=lapce
pkgver=0.0.4
pkgrel=1
pkgdesc="Lightning-fast and Powerful Code Editor"
arch=('x86_64')
url="https://github.com/lapce/lapce"
license=('Apache')
depends=('gcc-libs' 'libxcb' 'expat' 'freetype2' 'libxkbcommon')
makedepends=('rust' 'python' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" 'Cargo.lock')
sha512sums=('844fc8f8405b63b2b7de3480892e462ce9e8dc6f3a83523b3d893353cde68e45c4ce03198448b7a40c5b5286c45c8b2d427e8810f59d84e3165e1d6b79d04561'
            'cd32fca8d46bfe47c7352b10dd58c3007110704b083ea21544b5bd93a56678fbf1b362d614e7da357303bf9034daf6a4fbee3cf8181ff22751eb222072163bc6')
b2sums=('a2838a3e00f0daea61e2239adda92952d306bf8e3aab79a37f59492d77366ee840dd7f305062314dbc5969951436571a4a805c6e5f04df0b5be0ef511b84eba3'
        'ef2927f07edb0dea4b476941be329c567e072b3fc8e0e731cab14c9120cb4ae42d3f03b2be8c922f4c440bbcec89f751165ac8117235ef8309a6cab975c82d26')

prepare() {
  cd "$pkgname-$pkgver"

  # upstream's Cargo.lock is out of sync, use pre-generated one
  cp -vf ../Cargo.lock .

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver/target/release"

  install -vDm755 -t "$pkgdir/usr/bin" "$pkgname" "$pkgname-proxy"
}
