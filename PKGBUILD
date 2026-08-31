# Maintainer: Kyler Clay <kylerclay@proton.me>

pkgname=shed-sh
pkgver=0.41.3
pkgrel=1
pkgdesc="A Linux shell with a powerful line editor and IPC socket extensibility"
arch=('x86_64')
url="https://github.com/km-clay/shed"
license=('MIT')
depends=('sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
install=shed.install

prepare()
{
  cd "shed-$pkgver"
  sed -i 's/, features = \["bundled"\]//' Cargo.toml
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build()
{
  cd "shed-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release
}

package()
{
  cd "shed-$pkgver"
  install -Dm755 "target/release/shed" "$pkgdir/usr/bin/shed"
  install -Dm644 include/help/*.txt -t "$pkgdir/usr/share/shed/doc/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
