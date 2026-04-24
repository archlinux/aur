# Maintainer: willemw <willemw12@gmail.com>

pkgname=mstream-git
pkgver=6.5.1.r7.g772a237
pkgrel=1
pkgdesc='Music streaming server'
arch=(any)
url=https://mstream.io
license=(GPL-3.0-or-later)
depends=(nodejs)
#makedepends=(git jq npm nvm)
makedepends=(git jq npm)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/mstream.json")
options=('!strip')
install=$pkgname.install
source=(
  "$pkgname::git+https://github.com/IrosTheBeggar/mStream.git"
  mstream.json
  mstream.service
  mstream.sysusers
  mstream.tmpfiles)
sha256sums=(
  'SKIP'
  'd914176fd50bd7f565700006a31aa97b79d3ad17cee20c8e5ff2061d5cb74817'
  '9f8baaad75e3152685043da8f74a09d19c2290820f12f5c3ca5022afd2e97b14'
  '5f2e6aced1707f64ca4ae3ae647fb6a8420f5c2a747ba06fa9174920fd821437'
  '97b4f92b8abba82224b3fc0e8cd179aaa9ba282e7466ab96acb75a9d627f6b23')

#_ensure_local_nvm() {
#    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
#    export NVM_DIR="${srcdir}/.nvm"
#
#    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
#}

pkgver() {
  git -C $pkgname describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  jq '.version = "'$pkgver'"' $pkgname/package.json >$pkgname/package.json.tmp
  mv $pkgname/package.json{.tmp,}

  # Exclude built-in binaries from the bin folder, etc.
  tar cfz $pkgname.tgz \
    --exclude=$pkgname/".git*" \
    --exclude=$pkgname/bin \
    --exclude=$pkgname/image-cache \
    --exclude=$pkgname/save \
    $pkgname

  #_ensure_local_nvm
  #nvm install --lts
}

package() {
  #_ensure_local_nvm
  npm install --only=production -g --cache=npm-cache --prefix="$pkgdir/usr" $pkgname.tgz

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

  install -d "$pkgdir/usr/lib/node_modules/mstream/bin/ffmpeg" # Patch
  rm -r "$pkgdir/usr/lib/node_modules/mstream/bin/ffmpeg"
  install -dm750 "$pkgdir/var/lib/mstream/bin"{,/ffmpeg}
  ln -s /var/lib/mstream/bin/ffmpeg "$pkgdir/usr/lib/node_modules/mstream/bin/"

  install -d "$pkgdir/usr/lib/node_modules/mstream/image-cache" # Patch
  rm -r "$pkgdir/usr/lib/node_modules/mstream/image-cache"
  ln -s /var/cache/mstream "$pkgdir/usr/lib/node_modules/mstream/image-cache"

  install -d "$pkgdir/usr/lib/node_modules/mstream/save/"{conf,db,logs,sync} # Patch
  rm -r "$pkgdir/usr/lib/node_modules/mstream/save/"{conf,db,logs,sync}
  install -d "$pkgdir/usr/lib/node_modules/mstream/save"
  ln -s /var/lib/mstream/conf "$pkgdir/usr/lib/node_modules/mstream/save/"
  ln -s /var/lib/mstream/db "$pkgdir/usr/lib/node_modules/mstream/save/"
  ln -s /var/lib/mstream/sync "$pkgdir/usr/lib/node_modules/mstream/save/"
  ln -s /var/log/mstream "$pkgdir/usr/lib/node_modules/mstream/save/logs"
}
