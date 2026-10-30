# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=atto-editor-git
pkgver=r115.g0b2c5bb
pkgrel=1
pkgdesc='Small Emacs-like terminal editor by Hugh Barney'
arch=('x86_64' 'aarch64')
url='https://github.com/hughbarney/atto'
license=('LicenseRef-Public-Domain')
depends=('glibc' 'ncurses')
makedepends=('git')
provides=("atto-editor=$pkgver")
# The Nano wallet and NetBSD variant also install /usr/bin/atto.
conflicts=('atto' 'atto-editor' 'atto-netbsd-git')
options=(!debug)
source=("git+$url.git#branch=master"
        'atto.1')
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/atto"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/atto"
  # Upstream uses pre-C23 empty-parameter function declarations.
  make CFLAGS="$CPPFLAGS $CFLAGS -std=gnu17 -D_DEFAULT_SOURCE" LDFLAGS="$LDFLAGS"
}

package() {
  cd "$srcdir/atto"
  install -Dm755 atto "$pkgdir/usr/bin/atto"
  install -Dm644 "$srcdir/atto.1" "$pkgdir/usr/share/man/man1/atto.1"
  install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/README.md"
}
