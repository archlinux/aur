# Maintainer: Boris Momcilovic <boris.momcilovic@gmail.com>
pkgname=apache-flume-ng
pkgver=1.9.0
pkgrel=1
pkgdesc='Distributed system for moving large amounts of log data.'
arch=('any')
url='http://flume.apache.org'
license=('Apache License')
depends=('java-environment')
makedepends=('java-environment')
install=flume-ng.install

source=("http://www.eu.apache.org/dist//flume/${pkgver}/apache-flume-${pkgver}-bin.tar.gz"
	"flume-ng-conf"
	"flume-ng.profile"
	"flume-ng.service")

md5sums=('cc17aaa30cbd051eaa2cdbecd73c3bab'
         '4ee8391d354fb58817efb8ed1058405c'
         '9d1e8ab323df2d8dd747f27c51841c1a'
         '06ec3866251641e056534657b3d236e3')

package() {
  _usr_lib=$pkgdir/usr/lib/

  mkdir -p $_usr_lib
  cp -r $srcdir/apache-flume-$pkgver-bin $_usr_lib/$pkgname-$pkgver
  mkdir -p $_usr_lib/$pkgname-$pkgver/plugins.d

  install -Dm755 ${srcdir}/apache-flume-$pkgver-bin/conf/flume-conf.properties.template  ${pkgdir}/etc/flume-ng/flume.conf
  install -Dm755 ${srcdir}/apache-flume-$pkgver-bin/conf/flume-env.sh.template ${pkgdir}/etc/flume-ng/flume-env.sh
  install -Dm755 ${srcdir}/flume-ng.profile ${pkgdir}/etc/profile.d/flume-ng.sh

  install -Dm755 ${srcdir}/flume-ng-conf ${pkgdir}/etc/conf.d/flume-ng
  install -Dm755 ${srcdir}/flume-ng.profile ${pkgdir}/etc/profile.d/flume-ng.sh

  mkdir -p $pkgdir/usr/lib/systemd/system
  install -Dm644 ${srcdir}/flume-ng.service ${pkgdir}/usr/lib/systemd/system/

  mkdir -p $pkgdir/usr/bin
  echo -e '#!/bin/sh\n\nfor f in /etc/profile.d/*.sh\ndo\n. $f\ndone\n/usr/lib/apache-flume-ng/bin/flume-ng "$@"' > $pkgdir/usr/bin/flume-ng
  chmod 755 $pkgdir/usr/bin/flume-ng

  cd $_usr_lib
  ln -s $pkgname-$pkgver $pkgname
}
