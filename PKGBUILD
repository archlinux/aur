# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgbase=vdr-epg-daemon
pkgname=('epgd' 'mariadb-epglv')
pkgver=1.1.157
pkgrel=1
url='http://projects.vdr-developer.org/projects/vdr-epg-daemon'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
makedepends=('curl' 'git' 'imlib2' 'jansson' 'libarchive' 'libjpeg' 'libmariadbclient' 'libmicrohttpd' 'libxslt' 'python')
source=("https://projects.vdr-developer.org/git/vdr-epg-daemon.git/snapshot/$pkgbase-$pkgver.tar.bz2")
sha256sums=('ad44e8094588fcdaedd2d6a28059bb014e81ac8d99db57db35051e6d14638b12')

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  make -j1 PREFIX=/usr
}

package_epgd() {
  pkgdesc='write epg data to a mysql database'
  depends=('curl' 'imlib2' 'jansson' 'libarchive' 'libmariadbclient' 'libmicrohttpd' 'libxslt' 'python')

  cd "$srcdir/$pkgbase-$pkgver"

  make -j1 PREFIX=/usr SYSTEMDDEST="$pkgdir/usr/lib/systemd/system" DESTDIR="$pkgdir" install

  rm "$pkgdir/usr/lib/mysql/plugin/mysqlepglv.so"
  cd $pkgdir
  backup=($(find etc -type f))
}

package_mariadb-epglv() {
  pkgdesc='epglv plugin for mysql/mariadb'
  depends=('libmariadbclient')
  backup=("usr/lib/mysql/plugin/mysqlepglv.so")
  install='mariadb-epglv.install'
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm755 epglv/mysqlepglv.so "$pkgdir/$(mysql_config --plugindir)/mysqlepglv.so"
}
