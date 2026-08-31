# Maintainer: rokuroo171 <rokuroo171 at github dot com>

pkgname=glean-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A note-taking app with a night-sky canvas"
arch=('x86_64')
url="https://github.com/rokuroo171/glean"
license=('GPL-3.0-or-later')
provides=('glean')
conflicts=('glean')
options=(!strip)
depends=('webkit2gtk-4.1' 'gtk3')
optdepends=('libappindicator-gtk3: system tray support')
source=("$url/releases/download/v$pkgver/glean-desktop"
  "$url/raw/v$pkgver/LICENSE")
sha256sums=('0434e1eb119a0cd58f8f73ec8e5428d5259c0eeeafe9f71969aa9f21be49ba20'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

prepare() {
  LINE=$(awk '/^__GLEAN_ARCHIVE__$/{ print NR; exit }' "$srcdir/glean-desktop")
  if [ -z "$LINE" ]; then
    echo "glean-desktop: corrupt bundle (payload marker not found)" >&2
    return 1
  fi
  tail -n +"$((LINE + 1))" "$srcdir/glean-desktop" | tar -xzf - -C "$srcdir"
}

package() {
  install -Dm755 "$srcdir/glean" "$pkgdir/usr/bin/glean"
  install -Dm644 "$srcdir/glean.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/glean.png"
  install -Dm644 "$srcdir/glean.desktop" \
    "$pkgdir/usr/share/applications/glean.desktop"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
