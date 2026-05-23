# Maintainer: Cyb3rKo <cyb3rko-aur [ät] pm [dot] me>

pkgname=aerion-oauth-git
pkgver=0.2.4.r2.g839a498
pkgrel=3
pkgdesc="An Open Source Lightweight E-Mail Client (OAuth support via env variables)"
arch=(x86_64)
url="https://github.com/hkdb/aerion"
license=("Apache-2.0")
source=("$pkgname::git+$url.git")
b2sums=('SKIP')
depends=(at-spi2-core cairo gdk-pixbuf2 glib2 glibc gtk3 harfbuzz libsoup3 pango webkit2gtk-4.1 zlib)
makedepends=(git go wails)
provides=("aerion=$pkgver")
conflicts=("aerion")
install="$pkgname.install"
options=(!debug !lto)

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  make build-linux \
    GOOGLE_CLIENT_ID="$AERION_GOOGLE_CLIENT_ID" GOOGLE_CLIENT_SECRET="$AERION_GOOGLE_CLIENT_SECRET" \
    MICROSOFT_CLIENT_ID="$AERION_MICROSOFT_CLIENT_ID"
}

check() {
  cd "$pkgname"
  make test
}

package() {
  cd "$pkgname"
  msg "Installing to: $pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # run application-defined installation logic
  make install-linux \
    DESTDIR="$pkgdir" PREFIX="/usr" \
    GOOGLE_CLIENT_ID="$AERION_GOOGLE_CLIENT_ID" GOOGLE_CLIENT_SECRET="$AERION_GOOGLE_CLIENT_SECRET" \
    MICROSOFT_CLIENT_ID="$AERION_MICROSOFT_CLIENT_ID"

  rm -f "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
}
