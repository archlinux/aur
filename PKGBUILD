# Maintainer: angelodalzotto <angelodalzotto97 at gmail dot com>

_target=riscv64-elf
_pkgname=picolibc
pkgname=$_target-$_pkgname
pkgver=1.8.10
pkgrel=1
pkgdesc='C library designed for embedded 32- and 64- bit systems'
arch=(x86_64)
url='https://github.com/picolibc/picolibc'
license=('BSD')
makedepends=("$_target-gcc" 'meson')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d1fc2a20f217472f8d9da084a519a25678e8d91852a41c7f3f1840d3508f7163')
options=(!strip !buildflags)

prepare() {
  cp "$_pkgname-$pkgver/scripts/cross-riscv64-unknown-elf.txt" "cross-$_target.txt"
  sed -i 's/unknown-//g' "cross-$_target.txt"
}

build() {
  meson setup \
    --prefix="/usr/$_target" \
    --cross-file "cross-${_target}.txt" \
    -Dincludedir=lib/$_pkgname/include \
    -Dlibdir=lib/$_pkgname/lib \
    -Dspecsdir=lib/ \
    "$_pkgname-$pkgver" build

  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$_pkgname-$pkgver/COPYING."{GPL2,NEWLIB,picolibc}
}
