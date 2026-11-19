# Maintainer: Chris <goabonga@pm.me>

pkgname=ctui
pkgver=0.2.0
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
sha256sums=('3340572e8dae1771c8af9b4c65495a418c83af63493dfabe63aeb4eb6149ab6e')

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
