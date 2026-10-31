# Maintainer: Elmar Athmer <elmar+aur at athmer dot org>
pkgname=silverbullet-cli
pkgver=2.12.1
pkgrel=1
pkgdesc='Official command-line client for SilverBullet'
arch=('x86_64' 'aarch64')
url='https://github.com/silverbulletmd/silverbullet'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
optdepends=('xdg-utils: open URLs from the CLI')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d263988e8ad048bf1d1338d038e3a1bfd80c80844297186d726cafbe3f8a35e5')

prepare() {
  cd "silverbullet-$pkgver"
  printf '{"version":"%s"}\n' "$pkgver" > version.json
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "silverbullet-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  CFLAGS="$CFLAGS -fno-lto" cargo build --frozen --release --manifest-path bin/sb/Cargo.toml
}

check() {
  cd "silverbullet-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  CFLAGS="$CFLAGS -fno-lto" cargo test --frozen --manifest-path bin/sb/Cargo.toml
}

package() {
  cd "silverbullet-$pkgver"
  install -Dm755 target/release/sb "$pkgdir/usr/bin/sb"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
