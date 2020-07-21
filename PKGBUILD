# Maintainer: gilbus <aur (AT) tinkershell.eu>

pkgname=rss-bridge-git
_pkgname=rss-bridge
pkgver=2020.02.26.r45.g976445b4
pkgrel=1
pkgdesc="The RSS feed for websites missing it"
arch=("any")
url="https://github.com/RSS-Bridge/rss-bridge/wiki"
license=("Unlicense")
depends=(php)
backup=(
  "etc/webapps/$pkgname/config.ini.php"
  "usr/share/webapps/$pkgname/whitelist.txt"
  )
source=(
  "$_pkgname::git+https://github.com/RSS-Bridge/rss-bridge.git"
  "$_pkgname.sysusers"
  "$_pkgname.tmpfiles"
)
sha256sums=('SKIP'
            '42eb933a4632ada3247341d24f967c76cf363ff50e6ed13b39963983454f8020'
            '6f9122e50e2b9164e59b1b9062663559cb5bc3ef3bd59b3ffafb7d486ec71a13')
provides=("rss-bridge")
conflicts=("rss-bridge")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {

  cd "$_pkgname"
  _instdir=$pkgdir/usr/share/webapps/$_pkgname/

  # install project
  mkdir -p "$_instdir"
  cp -ra * "$_instdir/"

  # move config to /etc
  install -D config.default.ini.php $pkgdir/etc/webapps/$_pkgname/config.ini.php

  # setup user and directory creation
  install -Dm644 "$srcdir/$_pkgname.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"

  rm -r "$_instdir"/cache
  ln -s /var/cache/$_pkgname "$_instdir"/cache

  find "$pkgdir"/usr/share/webapps/${_pkgname} -type f -exec chmod 0644 {} \;
  find "$pkgdir"/usr/share/webapps/${_pkgname} -type d -exec chmod 0755 {} \;
}

