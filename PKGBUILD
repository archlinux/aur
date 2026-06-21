# Maintainer: vodkanull <vodkanull@proton.me>

pkgname=pudu-git
pkgver=r0.1.g1123c1d
pkgrel=1
pkgdesc="Minimal tiling Wayland compositor built on top of wlroots"
arch=('x86_64')
url="https://github.com/vodkanull/pudu"
license=('GPL3')
depends=('wlroots0.19' 'wayland' 'libxkbcommon' 'libinput' 'cairo' 'kitty' 'seatd')
makedepends=('git' 'gcc' 'make' 'pkg-config')
provides=("pudu")
conflicts=("pudu")
source=("$pkgname::git+https://github.com/vodkanull/pudu.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo "r0.$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname/src"
  make
}

package() {
  cd "$srcdir/$pkgname/src"
  install -Dm755 build/pudu "$pkgdir/usr/bin/pudu"
  sed 's|/usr/local/bin/pudu|/usr/bin/pudu|' pudu.desktop > "$pkgdir/usr/share/wayland-sessions/pudu.desktop"
}
