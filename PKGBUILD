# Maintainer: Chris <goabonga@pm.me>

pkgname=ctui
pkgver=0.1.0
pkgrel=1
pkgdesc='C library of reusable ncursesw terminal user interface components'
arch=('x86_64' 'aarch64')
url='https://github.com/goabonga/ctui'
license=('MIT')
depends=('ncurses')
makedepends=('pkgconf')
# !lto: the upstream tests build with -Werror, which LTO turns on false warnings.
options=('staticlibs' '!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f2d3c2c024d17455c35235a2c29e6380e431064a6706225999e4da7038dfa006')

build() {
  cd "$pkgname-$pkgver"
  make all shared
}

check() {
  cd "$pkgname-$pkgver"
  # The sanitizers are a development option of upstream.
  make SANITIZE= test
}

package() {
  cd "$pkgname-$pkgver"
  make install-shared DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
