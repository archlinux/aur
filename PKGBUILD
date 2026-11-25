# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

# Co-Maintainer: Harsh Vyapari <harshv5094@gmail.com>
# https://github.com/harshv5094

pkgname=linutil
pkgver=2026.11.14
pkgrel=1
pkgdesc="Distro-agnostic toolbox designed to simplify everyday Linux tasks"
arch=('x86_64' 'aarch64')
url="https://github.com/ChrisTitusTech/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('37e2b8fe3b6d42606b0147ede679b4d90b6b4f2dda0b1a968faa6818ace25926')
makedepends=('cargo')
depends=('git' 'pacman' 'gcc-libs' 'glibc')
optdepends=('ttf-nerd-fonts-symbols: symbols and icons')
options=('!lto')

prepare() {
  echo "Version=$pkgver" >>"$pkgname.desktop"
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 "man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
