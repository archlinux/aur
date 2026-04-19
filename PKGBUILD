# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

pkgname=stremio-service
pkgver=0.1.21
pkgrel=1
pkgdesc="The companion app of Stremio Web"
arch=('x86_64')
url='https://github.com/Stremio/stremio-service'
license=('GPL-2.0-only')
depends=(
  'bun'
  'cairo'
  'ffmpeg'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'libayatana-appindicator'
)
makedepends=(
  'openssl'
  'pkgconf'
  'rust'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Stremio/stremio-service/archive/refs/tags/v$pkgver.tar.gz"
  "server.js::https://dl.strem.io/server/v4.20.17/desktop/server.js"
)
sha256sums=('1f64ffaed845a6ee5b6e192fdc6cbcf5e8e60615598752e7616fd4c8b75b3c9e'
            '567a397bb11b788571bf1750fd05dd78927f97bec0c9ddeaa6d9cc1eccee3922')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked --features bundled,offline-build --bin stremio-service
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo test --release --locked --features bundled,offline-build --lib --test copyright --bin stremio-service
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 resources/stremio-service "$pkgdir/usr/bin/stremio-service"
  install -Dm755 target/release/stremio-service "$pkgdir/usr/share/stremio-service/stremio-service"
  install -Dm755 "$srcdir/server.js" "$pkgdir/usr/share/stremio-service/server.js"

  ln -s /usr/bin/bun "$pkgdir/usr/share/stremio-service/stremio-runtime"
  ln -s /usr/bin/ffmpeg "$pkgdir/usr/share/stremio-service/ffmpeg"
  ln -s /usr/bin/ffprobe "$pkgdir/usr/share/stremio-service/ffprobe"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 resources/com.stremio.service.desktop "$pkgdir/usr/share/applications/com.stremio.service.desktop"
  install -Dm644 resources/com.stremio.service.metainfo.xml "$pkgdir/usr/share/metainfo/com.stremio.service.metainfo.xml"
  install -Dm644 resources/com.stremio.service.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.stremio.service.svg"
}
