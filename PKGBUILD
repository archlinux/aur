# Maintainer: gilbus <aur (AT) tinkershell.eu>

pkgbase=rssbridge
pkgname=rss-bridge
pkgver=2024_02_02
pkgrel=1
pkgdesc="The RSS feed for websites missing it"
arch=("any")
url="https://github.com/RSS-Bridge/rss-bridge/wiki"
license=("Unlicense")
depends=(php-interpreter)
backup=(
  "etc/webapps/$pkgname/config.ini.php"
  )
source=(
  "https://github.com/RSS-Bridge/$pkgname/archive/${pkgver//_/-}.tar.gz"
  "$pkgname.sysusers"
  "$pkgname.tmpfiles"
)
sha256sums=('290636a7b8f8389e2274946afa8a5b5b3e1d0aed0005088e964a6b8952c45eb4'
            '42eb933a4632ada3247341d24f967c76cf363ff50e6ed13b39963983454f8020'
            '53103f6c5ad1bb59823ed3b0da6d0900517ed199bf64881b7bbf85f12dee39ad')

package() {

  cd "$pkgname-${pkgver//_/-}"
  _instdir=$pkgdir/usr/share/webapps/$pkgname/

  # install project
  mkdir -p "$_instdir"
  cp -ra * "$_instdir/"

  # copy default config to /etc
  install -D config.default.ini.php $pkgdir/etc/webapps/$pkgname/config.ini.php

  # and symlink it into correct location
  ln -s /etc/webapps/$pkgname/config.ini.php "$_instdir"

  # setup user and directory creation
  install -Dm644 "$srcdir/$pkgname.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  rm -r "$_instdir"/cache
  ln -s /var/cache/$pkgname "$_instdir"/cache

  find "$pkgdir"/usr/share/webapps/${pkgname} -type f -exec chmod 0644 {} \;
  find "$pkgdir"/usr/share/webapps/${pkgname} -type d -exec chmod 0755 {} \;
}
