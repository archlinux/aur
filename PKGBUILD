# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sergei Lebedev <superbobry at gmail dot com>

pkgname=rutorrent
_pkgname=ruTorrent-master
pkgver=3.7
pkgrel=4
pkgdesc="Yet another web front-end for rTorrent"
arch=('any')
url="http://code.google.com/p/rutorrent/"
license=('GPL')
depends=(php curl gzip coreutils)
optdepends=('mod_scgi: for SCGI protocol')
conflicts=(rutorrent-plugins)
source=(
$pkgname-$pkgver.zip::"http://dl.bintray.com/novik65/generic/ruTorrent-$pkgver.zip"
apache.example.conf
apache.example.site.conf)
sha256sums=('c1fb86317231c8e8fa9e1a7dea450ce4687d94caad22d763bc68d90c56d0749f'
            '79b5aab7ef928727b3ec2aa0f1b0869310adde11cd774d148c03025deb6dec0c'
            '9afe7d2a9aadb5fd6a0fcd907f7f46bdc3630c369a5a684c51bbeeb5b4d354aa')
backup=(
etc/webapps/rutorrent/conf/config.php
etc/webapps/rutorrent/conf/plugins.ini
etc/webapps/rutorrent/conf/access.ini
)
options=(emptydirs !strip)
prepare() {
  cd $srcdir/$_pkgname
  rm .gitignore
}

package() {
  cd $srcdir/$_pkgname

  install -d "$pkgdir"/usr/share/webapps
  install -d "$pkgdir"/etc/webapps/$pkgname

  cp -r conf "$pkgdir"/etc/webapps/$pkgname/
  cp -r . "$pkgdir"/usr/share/webapps/$pkgname/

  rm -rf "$pkgdir"/usr/share/webapps/$pkgname/conf

  install -Dm644 ../apache.example.conf "$pkgdir"/etc/webapps/rutorrent/
  install -Dm644 ../apache.example.site.conf "$pkgdir"/etc/webapps/rutorrent/

  cd "$pkgdir"/usr/share/webapps/$pkgname
  ln -s /etc/webapps/$pkgname/conf

  #fix perms
  #chown http\: $pkgdir/usr/share/webapps/$pkgname/share/{settings,torrents,users}
  chmod 0777 $pkgdir/usr/share/webapps/$pkgname/share/{settings,torrents,users}

}
