# Maintainer: willemw <willemw12@gmail.com>
# Contributor: AlphaJack <alphajack at tuta dot io>

pkgname=mstream
_srcname=mStream
pkgver=6.5.1
pkgrel=1
pkgdesc='Music streaming server'
arch=(any)
url=https://mstream.io
license=(GPL-3.0-or-later)
depends=(nodejs)
makedepends=(npm)
backup=("etc/mstream.json")
options=('!strip')
install=$pkgname.install
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/IrosTheBeggar/mStream/archive/refs/tags/v$pkgver.tar.gz"
  mstream.json
  mstream.service
  mstream.sysusers
  mstream.tmpfiles)
sha256sums=(
  'ed71d40f5149c21cd7312a0a4ec92962056a3abd47cb1b556fb0feab5b0c05e5'
  'd914176fd50bd7f565700006a31aa97b79d3ad17cee20c8e5ff2061d5cb74817'
  '833f86daaffb12857612ef5b1264e944b0a48a077d5a8bb8d217ec6565ed90c3'
  '5f2e6aced1707f64ca4ae3ae647fb6a8420f5c2a747ba06fa9174920fd821437'
  '4374844b1cfee8f744f1c79b9dcd56e3c2ccf9e69af4a5b741bc1cdbb4bb31f3')

prepare() {
  # Exclude built-in binaries from the bin folder, etc.
  tar cfz $pkgname-$pkgver.tgz \
    --exclude=$pkgname/".git*" \
    --exclude=$pkgname/bin \
    --exclude=$pkgname/image-cache \
    --exclude=$pkgname/save \
    $_srcname-$pkgver
}

package() {
  npm install --only=production -g --cache=npm-cache --prefix="$pkgdir/usr" $pkgname-$pkgver.tgz

  # Patch for "SyntaxError: The requested module 'simple-xml-to-json' does not provide an export named 'default'"
  #grep -rl 'import xmlPackage from "simple-xml-to-json";' "$pkgdir/usr/lib/node_modules/" | xargs -r sed -i 's/import xmlPackage from "simple-xml-to-json";/import * as xmlPackage from "simple-xml-to-json";/g'
  sed -i 's/import xmlPackage from "simple-xml-to-json";/import * as xmlPackage from "simple-xml-to-json";/g' "$pkgdir/usr/lib/node_modules/mstream/node_modules/@jimp/plugin-print/dist/esm/load-bitmap-font.js"

  # See "npm install" issue https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -Dm644 mstream.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 mstream.sysusers "$pkgdir/usr/lib/sysusers.d/mstream.conf"
  install -Dm644 mstream.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/mstream.conf"

  install -D mstream.json -t "$pkgdir/etc"

  install -dm750 "$pkgdir/var/lib/mstream"
  install -d "$pkgdir/var/lib/mstream/"{album-art,media}

  rm -r "$pkgdir/usr/lib/node_modules/mstream/bin/ffmpeg"
  install -dm750 "$pkgdir/var/lib/mstream/bin"{,/ffmpeg}
  ln -s /var/lib/mstream/bin/ffmpeg "$pkgdir/usr/lib/node_modules/mstream/bin/"

  rm -r "$pkgdir/usr/lib/node_modules/mstream/image-cache"
  ln -s /var/cache/mstream "$pkgdir/usr/lib/node_modules/mstream/image-cache"

  rm -r "$pkgdir/usr/lib/node_modules/mstream/save/"{conf,db,logs,sync}
  install -d "$pkgdir/usr/lib/node_modules/mstream/save"
  ln -s /var/lib/mstream/conf "$pkgdir/usr/lib/node_modules/mstream/save/"
  ln -s /var/lib/mstream/db "$pkgdir/usr/lib/node_modules/mstream/save/"
  ln -s /var/lib/mstream/sync "$pkgdir/usr/lib/node_modules/mstream/save/"
  ln -s /var/log/mstream "$pkgdir/usr/lib/node_modules/mstream/save/logs"
}
