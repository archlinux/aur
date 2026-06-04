# Maintainer: Brandon Pollack <brandonpollack23@gmail.com>
pkgname=aion-git
pkgver=0.1.17.r0.g2706c7d
pkgrel=1
pkgdesc="Keyboard-first terminal UI for Google Calendar"
arch=('x86_64' 'aarch64')
url="https://github.com/brandonpollack23/aion"
license=('MIT')
depends=()
makedepends=('git' 'bun')
provides=('aion')
conflicts=('aion')
options=('!strip')
source=("$pkgname::git+https://github.com/brandonpollack23/aion.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  bun install --frozen-lockfile
  bun build --compile src/index.tsx --outfile dist/aion
}

package() {
  cd "$pkgname"
  install -Dm755 dist/aion "$pkgdir/usr/bin/aion"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
