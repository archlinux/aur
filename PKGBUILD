# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=zps-git
pkgver=2.0.0.r0.g76ffe80
pkgrel=1
pkgdesc="A small utility for listing and reaping zombie processes (git)"
arch=('x86_64')
url="https://github.com/orhun/zps"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('git' 'cmake')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "${pkgname%-git}/build"
  cd "${pkgname%-git}/build"
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname%-git}/build"
  make DESTDIR="$pkgdir" install
  install -Dm 644 "../README.md" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "../man/${pkgname%-git}.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "../.application/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
