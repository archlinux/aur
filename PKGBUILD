# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgbase=vdr-epg-daemon
pkgname=('epgd' 'mariadb-epglv')
pkgver=1.1.146
pkgrel=1
url='http://projects.vdr-developer.org/projects/vdr-epg-daemon'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
makedepends=('curl' 'git' 'imlib2' 'jansson' 'libarchive' 'libjpeg' 'libmariadbclient' 'libmicrohttpd' 'libxslt' 'python')
source=("https://projects.vdr-developer.org/git/vdr-epg-daemon.git/snapshot/$pkgbase-$pkgver.tar.bz2"
        "epgd.service"
        "epghttpd.service")
md5sums=('6a892aedd6af850be6880d702b9222d5'
         'c1b7f66bc84dbedba2ec4104ebefaba4'
         'd84f1a9383e22baa922455eaf9dd60b6')

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  make -j1 PREFIX=/usr

  echo "done once"

  make -j1 PREFIX=/usr
}

package_epgd() {
  pkgdesc='write epg data to a mysql database'
  depends=('curl' 'imlib2' 'jansson' 'libarchive' 'libmariadbclient' 'libmicrohttpd' 'libxslt' 'python')

  cd "$srcdir/$pkgbase-$pkgver"

  make -j1 PREFIX=/usr DESTDIR="$pkgdir" install
  rm "$pkgdir/etc/systemd/system/epgd.service"
  rm "$pkgdir/etc/systemd/system/epghttpd.service"

  install -Dm644 "${srcdir}/epgd.service" $pkgdir/usr/lib/systemd/system/epgd.service
  install -Dm644 "${srcdir}/epghttpd.service" $pkgdir/usr/lib/systemd/system/epghttpd.service

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
