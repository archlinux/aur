# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=dethumb
pkgver=0.3.4
pkgrel=1
pkgdesc='Thumbnailer for Linux .desktop files and Windows .exe binaries'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/dethumb'
license=('GPL-3.0-or-later')
depends=('libgcc' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('51e77eabef5d78dc764a8775d4617942cea8d172ffdb91ed2cf5cd2abab9bad6')

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
