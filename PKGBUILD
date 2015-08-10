# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgbase=vdr-epg-daemon
pkgname=('epgd' 'mariadb-epglv')
pkgver=0.2.2
_gitver=e2230b6e8d0121233dc8861ceea3e6669fed8f57
pkgrel=1
url='http://projects.vdr-developer.org/projects/vdr-epg-daemon'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
makedepends=('curl' 'git' 'imlib2' 'jansson' 'libarchive' 'libjpeg' 'libmariadbclient' 'libxslt')
source=("git://projects.vdr-developer.org/$pkgbase.git#commit=$_gitver")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgbase"
  git tag -a v0.2.2 -m 'Added Tag' e2230b6e8d0121233dc8861ceea3e6669fed8f57 2> /dev/null
  git describe --tags | sed 's/-/_/g;s/v//'
}

prepare() {
  cd "$srcdir/$pkgbase"/epglv
  sed -i '/CPP_FLAGS_32/d' Makefile
  sed -i '/CPP_FLAGS_64/d' Makefile
}

build() {
  cd "$srcdir/$pkgbase"
  make PREFIX=/usr
}

package_epgd() {
  pkgdesc='write epg data to a mysql database'
  depends=('curl' 'jansson' 'libarchive' 'libmariadbclient' 'libxslt')
  cd "$srcdir/$pkgbase"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 contrib/epgd.service "$pkgdir/usr/lib/systemd/system/epgd.service"
  rm "$pkgdir/mysqlepglv.so"
  cd $pkgdir
  backup=($(find etc -type f))
}

package_mariadb-epglv() {
  pkgdesc='epglv plugin for mysql/mariadb'
  depends=('libmariadbclient')
  backup=("$(mysql_config --plugindir | cut -d/ -f2-)/mysqlepglv.so")
  install='mariadb-epglv.install'
  cd "$srcdir/$pkgbase"
  install -Dm755 epglv/mysqlepglv.so "$pkgdir/$(mysql_config --plugindir)/mysqlepglv.so"
}
