# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgbase=vdr-epg-daemon
pkgname=('epgd' 'mariadb-epglv')
pkgver=1.2.4
pkgrel=1
url='https://github.com/horchi/vdr-epg-daemon'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
makedepends=('curl' 'imlib2' 'jansson' 'libarchive' 'libjpeg' 'libmariadbclient' 'libmicrohttpd' 'libxslt' 'python')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/horchi/vdr-epg-daemon/archive/refs/tags/$pkgver.tar.gz"
        "$pkgbase-move-pthread-include.patch::https://patch-diff.githubusercontent.com/raw/horchi/vdr-epg-daemon/pull/3.patch")
sha256sums=('43f658c5e2fd08f51bac630b15ae8523d463a419ed8b6e2cd13d712473779318'
            '98e605031a1e0584eb75dc1d20dfad6eba31e8b452e099192a9db470b002a672')

prepare() {
  cd "$srcdir/$pkgbase-$pkgver"
  patch -p1 -i "${srcdir}/$pkgbase-move-pthread-include.patch"
}

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
