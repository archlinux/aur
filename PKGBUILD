# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=codevis
pkgver=0.8.2
pkgrel=1
pkgdesc="A tool for turning your code into one large image"
arch=('x86_64')
url="https://github.com/sloganking/codevis"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver-version.patch::$url/commit/7a92be28349ccd91d09fe9052c37db614d7b8382.patch")
sha512sums=('64760e383cd6b3832fc7e861c055a1dc49b7521ffbd27c034bd08f918a1575964e25e1c3bc80f9bcee014ba1e87951bfe3779b0cd58c60e42729faf52f05a841'
            '8c5cb5b358cd3f4393741f2bb153848dbaa50e749b01efb322a797652b9a998cb794ebf87c84486a3830a4e3adf4c83ca92ec7a7c7fc00b8424a1348876c9e2a')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "../$pkgname-$pkgver-version.patch"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
