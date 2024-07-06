# Maintainer: Jeremy M. Reed <reeje76@gmail.com>
pkgname=image-file-name-fixer
pkgver=0.0.9
pkgrel=2
pkgdesc="A tool to enforce a consistent naming scheme for image files."
arch=('x86_64')
url="https://github.com/jeremymreed/image-file-name-fixer"
license=('MIT')
options=('!lto')
depends=()
makedepends=('cargo' 'pandoc-cli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jeremymreed/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('dcc26ea86596924f1bdb1d6581326c80118f9009be3f1e3fe7ab335cd13adb90604714a3d50e9f9bea1b0bbf39e8d56c73ec2ed9fc099e935d643c5ba4feac0e')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --frozen
  pandoc manpage/${pkgname}.1.md -s -t man -o manpage/${pkgname}.1
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 "manpage/${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"
}

