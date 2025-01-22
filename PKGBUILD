# Maintainer: willemw <willemw12@gmail.com>

pkgname=mstream-git
pkgver=5.13.1.r0.g81a931c
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
source=(
  "$pkgname::git+https://github.com/IrosTheBeggar/mStream.git"
  mstream.json
  mstream.service
  mstream.sysusers
  mstream.tmpfiles)
sha256sums=(
  'SKIP'
  '1d6faa9e1a76d13f3ab8558a3640158b1f0a54f624a4e37ddc3ef41ed4191058'
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
    --exclude="$pkgname/.git*" \
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

  # See "npm install" issue https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -Dm644 mstream.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 mstream.sysusers   "$pkgdir/usr/lib/sysusers.d/mstream.conf"
  install -Dm644 mstream.tmpfiles   "$pkgdir/usr/lib/tmpfiles.d/mstream.conf"

  install -D mstream.json -t "$pkgdir/etc"

  #

  install -d                        "$pkgdir/usr/lib/node_modules/mstream/"{bin,save}

  # Avoid message "warning: directory permissions differ on /var/lib/mstream/"
  # by matching the permissions to the ones set in mstream.tmpfiles
  install -dm750 "$pkgdir/var/lib/mstream"

  install -d     "$pkgdir/var/lib/mstream/"{album-art,bin/ffmpeg,conf,db,media,sync}
  ln -s /var/lib/mstream/bin/ffmpeg "$pkgdir/usr/lib/node_modules/mstream/bin/ffmpeg"
  ln -s /var/lib/mstream/conf       "$pkgdir/usr/lib/node_modules/mstream/save/conf"
  ln -s /var/lib/mstream/db         "$pkgdir/usr/lib/node_modules/mstream/save/db"
  ln -s /var/lib/mstream/sync       "$pkgdir/usr/lib/node_modules/mstream/save/sync"

  ln -s /var/cache/mstream          "$pkgdir/usr/lib/node_modules/mstream/image-cache"
  ln -s /var/log/mstream            "$pkgdir/usr/lib/node_modules/mstream/save/logs"
}
