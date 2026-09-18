# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=dethumb
pkgver=0.3.3
pkgrel=1
pkgdesc='Thumbnailer for Linux .desktop files and Windows .exe binaries'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/dethumb'
license=('GPL-3.0-or-later')
depends=('libgcc' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f804a13505884b2e943db00a46f906bac4da0b626ac96aa3c7bbc91ff7e3e5ae')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/dethumb -t "$pkgdir/usr/bin"
  install -Dm644 packaging/usr/share/thumbnailers/dethumb.thumbnailer -t "$pkgdir/usr/share/thumbnailers"
}
