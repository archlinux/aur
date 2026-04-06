# Maintainer: willemw <willemw12@gmail.com>
# Contributor: AlphaJack <alphajack at tuta dot io>

pkgname=mstream
_srcname=mStream
pkgver=6.0.0
pkgrel=1
pkgdesc='Music streaming server'
arch=(any)
url=https://mstream.io
license=(GPL-3.0-or-later)
depends=(nodejs)
makedepends=(npm)
backup=("etc/mstream.json")
options=('!strip')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/IrosTheBeggar/mStream/archive/refs/tags/v$pkgver.tar.gz"
  mstream.json
  mstream.service
  mstream.sysusers
  mstream.tmpfiles)
sha256sums=(
  '7a7e0151fd401001b973d770583e5adbd1d34cfb7d60978d2db96d6810bae1c4'
  '730c09a4a866b0dd53617073ebfb54b3022b7e7d84370232e255602c5a4d0b16'
  '833f86daaffb12857612ef5b1264e944b0a48a077d5a8bb8d217ec6565ed90c3'
  '5f2e6aced1707f64ca4ae3ae647fb6a8420f5c2a747ba06fa9174920fd821437'
  '3664207c5b2782d55acc77a6ff1ced5c80447047c4c036837983dc03e19896de')

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

  #

  install -d "$pkgdir/usr/lib/node_modules/mstream/"{bin,save}

  # Avoid message "warning: directory permissions differ on /var/lib/mstream/"
  # by matching the permissions to the ones set in mstream.tmpfiles
  install -dm750 "$pkgdir/var/lib/mstream"

  install -d "$pkgdir/var/lib/mstream/"{album-art,bin/ffmpeg,conf,db,media,sync}

  ln -s /var/lib/mstream/bin/ffmpeg "$pkgdir/usr/lib/node_modules/mstream/bin/ffmpeg"
  ln -s /var/lib/mstream/conf "$pkgdir/usr/lib/node_modules/mstream/save/conf"
  ln -s /var/lib/mstream/db "$pkgdir/usr/lib/node_modules/mstream/save/db"
  ln -s /var/lib/mstream/sync "$pkgdir/usr/lib/node_modules/mstream/save/sync"

  ln -s /var/cache/mstream "$pkgdir/usr/lib/node_modules/mstream/image-cache"
  ln -s /var/log/mstream "$pkgdir/usr/lib/node_modules/mstream/save/logs"
}
