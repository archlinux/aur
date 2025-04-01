# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=arrow-tools
pkgver=0.22.3
pkgrel=2
pkgdesc="A collection of handy CLI tools to convert CSV and JSON to Apache Arrow and Parquet"
arch=('x86_64')
url="https://github.com/domoritz/arrow-tools"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'cmake')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

BINFILES=(
    csv2arrow
    csv2parquet
    json2arrow
    json2parquet
)

prepare() {
  cd $srcdir/$pkgname-$pkgver

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $srcdir/$pkgname-$pkgver

  cargo build --frozen --release
}

package() {
  cd $srcdir/$pkgname-$pkgver

  # binary
  for binfile in "${BINFILES[@]}"; do
    install -vDm755 -t "$pkgdir/usr/bin" target/release/$binfile
  done

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # rename md files to reduce directory nesting
  #   csv2parquet/Readme.md -> csv2parquet.md
  for binfile in "${BINFILES[@]}"; do
    install -vm644 crates/$binfile/Readme.md "$pkgdir/usr/share/doc/$pkgname/$binfile.md"
  done

  # licenses
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" ./LICEN*
}

sha256sums=('f04916e24a488aa08f63915954b54a71271e76cc3cb5f3f53ec9fecdf12e9eda')
