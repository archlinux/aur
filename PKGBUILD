# Contributor: Florian Bruhin <archlinux.org@the-compiler.org>
# Contributor: Bjonnh <bjonnh-arch@bjonnh.net>
# Based on the tt-rss PKGBUILD
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: David Rosenstrauch <darose@darose.net>
# Contributor: Erik Mank <erik@braindisorder.org>

pkgname=tt-rss-git
epoch=1
pkgver=r12421.c75cf09a6
pkgrel=1
pkgdesc='Web-based news feed (RSS/Atom) aggregator (Git version)'
arch=(any)
url='https://github.com/tt-rss/tt-rss'
license=(GPL)
backup=(etc/webapps/tt-rss/config.php)
depends=(php php-intl)
conflicts=('tt-rss')
provides=('tt-rss')
optdepends=('mysql'
            'postgresql'
            'php-gd: for coloured feed badges')
makedepends=('git')
options=('!strip')
source=('git+https://github.com/tt-rss/tt-rss.git'
        service)
sha256sums=('SKIP'
            'c9eb3acb18ab15562e3c3b8f1e3092f5699f5281fc40e04400615469aa39f217')

pkgver() {
  cd tt-rss
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd tt-rss
  _instdir="$pkgdir"/usr/share/webapps/tt-rss

  install -d "$_instdir"
  cp -ra * "$_instdir/"

  install -Dm640 -g http config.php-dist "$pkgdir"/etc/webapps/tt-rss/config.php
  ln -s /etc/webapps/tt-rss/config.php "$_instdir"/config.php

  install -d "$pkgdir"/var/lib/tt-rss
  mv "$_instdir"/{lock,feed-icons,cache} "$pkgdir"/var/lib/tt-rss
  ln -s /var/lib/tt-rss/lock "$_instdir"/lock
  ln -s /var/lib/tt-rss/feed-icons "$_instdir"/feed-icons
  ln -s /var/lib/tt-rss/cache "$_instdir"/cache
  chown -R 33:33 "$pkgdir"/var/lib/tt-rss
  chmod -R 777 "$pkgdir"/var/lib/tt-rss/*

  install -Dm644 "$srcdir"/service "$pkgdir"/usr/lib/systemd/system/tt-rss.service

  git log --date='format:%y.%m' --pretty='%cd-%h' -n1 HEAD > "$_instdir/version_static.txt"
}
