# Maintainer: Bjonnh <bjonnh-arch@bjonnh.net>
# Based on the tt-rss PKGBUILD
# Contributor:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: David Rosenstrauch <darose@darose.net>
# Contributor: Erik Mank <erik@braindisorder.org>

pkgname=tt-rss-git
_gitname=Tiny-Tiny-RSS
pkgver=1.3.0.r4196.g0c4c0ab
pkgrel=1
pkgdesc='Web-based news feed (RSS/Atom) aggregator (Git version)'
arch=('any')
url='http://tt-rss.org/redmine/'
license=('GPL')
depends=('php')
makeodepends=('git')
conflicts=('tt-rss')
provide=('tt-rss')
optdepends=('mysql' 'postgresql' 'php-curl')
install=tt-rss.install
source=("$_gitname"::'git://github.com/gothfox/Tiny-Tiny-RSS.git'
        service)
sha256sums=('SKIP'
            '8c33ab29cdb2eda25724e738ed04cb472a7fec0a9edca45729f29b17c46e55df')
options=(!strip)

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  _instdir="$pkgdir"/usr/share/webapps/$pkgname

  install -d "$_instdir"
  cp -ra * "$_instdir/"
  rm -rf "$_instdir"/debian

  install -d "$pkgdir"/etc/webapps/tt-rss
  install -gm640 -g http config.php-dist "$pkgdir"/etc/webapps/tt-rss/config.php-dist
  ln -s /etc/webapps/tt-rss/config.php "$_instdir"/config.php

  install -d "$pkgdir"/var/lib/tt-rss
  mv "$_instdir"/{lock,feed-icons,cache} "$pkgdir"/var/lib/tt-rss
  ln -s /var/lib/tt-rss/lock "$_instdir"/lock
  ln -s /var/lib/tt-rss/feed-icons "$_instdir"/feed-icons
  ln -s /var/lib/tt-rss/cache "$_instdir"/cache
  chown -R 33:33 "$pkgdir"/var/lib/tt-rss
  chmod -R 777 "$pkgdir"/var/lib/tt-rss/*

  install -Dm644 "$srcdir"/service "$pkgdir"/usr/lib/systemd/system/tt-rss.service
}
