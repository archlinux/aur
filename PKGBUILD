# Maintainer: gilbus <aur (AT) tinkershell.eu>

pkgbase=rssbridge
pkgname=rss-bridge
pkgver=2020_02_26
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
  "https://github.com/RSS-Bridge/$pkgname/archive/${pkgver//_/-}.tar.gz"
  "$pkgname.sysusers"
  "$pkgname.tmpfiles"
)
sha256sums=('f4dd0dc07828cca0c533eb112134f2a29efe1e083d2e92f4c474e961af62b391'
            '0dfb4e2cbd0f0ddfe622c0198906ec8c38aaec9d4732e518dca3c9c0950341da'
            'c18b4f42a36fa8f57b4b73165bdfedd1d492e6bb7888431c0f5f260273432b41')

package() {

  cd "$pkgname-${pkgver//_/-}"
  _instdir=$pkgdir/usr/share/webapps/$pkgname/

  # install project
  mkdir -p "$_instdir"
  cp -ra * "$_instdir/"

  # move config to /etc
  install -D config.default.ini.php $pkgdir/etc/webapps/$pkgname/config.ini.php

  # setup user and directory creation
  install -Dm644 "$srcdir/$pkgname.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  ln -sf /var/cache/$pkgname "$_instdir"/cache

  find "$pkgdir"/usr/share/webapps/${pkgname} -type f -exec chmod 0644 {} \;
  find "$pkgdir"/usr/share/webapps/${pkgname} -type d -exec chmod 0755 {} \;
}

