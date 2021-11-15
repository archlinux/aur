# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=lxd-snapper
pkgver=1.2
pkgrel=1
pkgdesc="A tool that automates creating & removing LXD snapshots"
arch=('x86_64')
url="https://github.com/Patryk27/lxd-snapper"
license=('MIT')
depends=('lxd' 'gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7535f9f66be58899f7bdb1f09a43993a2f80f997e209034cf726441931accb66d4250e62be92fc2a44bc1d0281eaa2b54f851dc049e41fb2706cee2a446643bc')
b2sums=('cd9d36cad3a74e8a82c660d4f33f083c650e303ea982ae1f129e16f24afed5d3e13a253a789456534cb11d97565c53b4730f43856f25dfaec144e5dc33d237f7')

prepare() {
  cd "$pkgname-$pkgver"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
  cargo build --release --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -r docs/example-configs "$pkgdir/usr/share/doc/$pkgname"
  chmod 644 "$pkgdir/usr/share/doc/$pkgname/example-configs/"*

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
