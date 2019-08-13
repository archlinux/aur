# Maintainer: KingofToasters <dev@sgregoratto.me>
pkgname=mrsh-git
pkgver=r417.a2f07ab
pkgrel=3
pkgdesc='A minimal POSIX shell'
url='https://git.sr.ht/~emersion/mrsh'
license=('custom: MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('git' 'meson')
optdepends=('libedit: alternate readline library')
provides=('mrsh')
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')
install="mrsh-git.install"

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  arch-meson "$srcdir/build"
  ninja -C "$srcdir/build"
}

check() {
  ninja -C "$srcdir/build" test
}

package() {
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
  install -Dm644 "$srcdir/${pkgname%-git}/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
