# Maintainer: gilbus <aur (AT) tinkershell.eu>

pkgname=rss-bridge-git
_pkgname=rss-bridge
pkgver=2021.04.25.r72.g32493264
pkgrel=1
pkgdesc="The RSS feed for websites missing it"
arch=("any")
url="https://github.com/RSS-Bridge/rss-bridge/wiki"
license=("Unlicense")
depends=(php)
makedepends=(git)
backup=(
  "etc/webapps/$_pkgname/config.ini.php"
  "etc/webapps/$_pkgname/whitelist.txt"
  )
source=(
  "$_pkgname::git+https://github.com/RSS-Bridge/rss-bridge.git"
  "$_pkgname.sysusers"
  "$_pkgname.tmpfiles"
)
sha256sums=('SKIP'
            '42eb933a4632ada3247341d24f967c76cf363ff50e6ed13b39963983454f8020'
            '32bc1d3a61862fe87dd8b72b814feebe72e2d2b975e489e00d612fc607ae9d7a')
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

  # copy default config to /etc
  install -D config.default.ini.php $pkgdir/etc/webapps/$_pkgname/config.ini.php
  install -D whitelist.default.txt $pkgdir/etc/webapps/$_pkgname/whitelist.txt

  # and symlink it into correct location
  ln -s /etc/webapps/$_pkgname/config.ini.php "$_instdir"
  ln -s /etc/webapps/$_pkgname/whitelist.txt "$_instdir"

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
