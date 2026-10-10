
# Maintainer: Aspenini <aspeninifeltner@gmail.com>
pkgname=stillalive-c-git
pkgver=r9.g140ef0e
pkgrel=1
pkgdesc='Terminal recreation of the Portal end credits sequence written in C'
arch=('x86_64' 'aarch64')
url='https://github.com/sidharthify/stillAlive-C'
license=('LicenseRef-Unknown')
depends=('glibc' 'mpv')
makedepends=('git')
provides=('stillalive-c')
conflicts=('stillalive-c')
source=('stillAlive-C::git+https://github.com/sidharthify/stillAlive-C.git#branch=main')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/stillAlive-C"
  printf 'r%s.g%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/stillAlive-C"
  # Prefer mpv for audio playback and timestamp seeking.
  sed -i \
    -e '/^[[:space:]]*"mpv",$/d' \
    -e '/static const char \*players\[\] = {/a\        "mpv",' \
    stillalive.c
}

build() {
  make -C "$srcdir/stillAlive-C"
}

package() {
  cd "$srcdir/stillAlive-C"

  install -Dm755 stillalive \
    "$pkgdir/usr/lib/stillalive/stillalive"

  install -Dm644 res/song/stillalive.ogg \
    "$pkgdir/usr/share/stillalive/res/song/stillalive.ogg"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/stillalive" <<'SH'
#!/bin/sh
cd /usr/share/stillalive || exit 1
exec /usr/lib/stillalive/stillalive "$@"
SH
  chmod 755 "$pkgdir/usr/bin/stillalive"
}
