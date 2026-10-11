# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=arrow-tools
pkgver=0.26.1
pkgrel=1
pkgdesc="A collection of handy CLI tools to convert CSV and JSON to Apache Arrow and Parquet"
arch=('x86_64')
url="https://github.com/domoritz/arrow-tools"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'cmake')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e07431e32a90fc1b475453a51a1703406e3e475fc765c38501a22624cf0b9002')

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
