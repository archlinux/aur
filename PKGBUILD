# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgbase=vdr-epg-daemon
pkgname=('epgd' 'mariadb-epglv')
pkgver=1.3.5
pkgrel=1
url='https://github.com/horchi/vdr-epg-daemon'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
makedepends=('curl' 'imlib2' 'jansson' 'libarchive' 'libjpeg' 'libmariadbclient' 'libmicrohttpd' 'libxslt' 'python')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/horchi/vdr-epg-daemon/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('559c61323311ae8aa5ecb3ecbb4dfd2dfc1d1352dd230919a33b1ab421535985')

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  make -j1 PREFIX=/usr
}

package_epgd() {
  pkgdesc='write epg data to a mysql database'
  depends=('curl' 'imlib2' 'jansson' 'libarchive' 'libmariadbclient' 'libmicrohttpd' 'libxslt' 'python' 'perl')

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
