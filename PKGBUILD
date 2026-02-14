# Maintainer: Whyme Lyu <callme5long@gmail.com>

pkgname=libslz
pkgver=1.2.1
pkgrel=1
pkgdesc="Stateless, zlib-compatible, and very fast compression library"
arch=('x86_64')
# The official website doesn't support https, just plain-text http.
url="http://www.libslz.org"
license=('MIT')
depends=(glibc)
provides=(libslz.so)
source=("$pkgname-$pkgver.tar.gz::https://github.com/wtarreau/libslz/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c1fa88556e97541a550e59fd1f0fc8f6b4c02444b14c13eb553c9827123122c5')


_make() {
  make "DESTDIR=$pkgdir" PREFIX=/usr USR_CFLAGS="$CFLAGS" \
    "USR_LFLAGS=$LDFLAGS" "$@"
}

build() {
  # _srcdir="$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"
  # CLI tools (zenc) are not built. The project is too niche.
  # It's basically "a faster z-lib developed for haproxy".
  # Besides, I can't figure out how to build zenc dynamically
  # linked to libslz.so
  _make shared
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  _make install-headers install-shared
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
