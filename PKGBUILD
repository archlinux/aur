# Maintainer: Grego Dadone <grego.dadone@gmail.com>
# Based on UMS PKGBUILD

pkgname=ums-headless
pkgver=7.0.0
pkgrel=1
pkgdesc="Universal Media Server: a DLNA-compliant UPnP Media Server for headless systems. Build based on Java 8."
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'armv6h' 'arm')
url="http://www.universalmediaserver.com/"
license=('GPL2')
depends=('java-runtime=8')
conflicts=('ums')
optdepends=("mencoder: Free command line video decoding, encoding and filtering tool"
            "ts-muxer-cli-ng: Remux/mux elementary streams without re-encoding")
makedepends=("unzip")
[ "$CARCH" = "x86_64" ] && \
optdepends=("dcraw: thumbnails creation support")
backup=(opt/ums/UMS.conf \
        opt/ums/WEB.conf)
source=("http://downloads.sourceforge.net/project/unimediaserver/Official%20Releases/Linux/UMS-$pkgver.tgz"
        'ums.desktop'
        'ums.service'
        'ums.timer')
sha256sums=('c017e1d15583cb5c2131910dc4757c5614fd27cf08b65c9862d34cd666ce1e68'
            '0cdadbabef215b6539e56755147a8f626d9f1fadfb85e2e5b7f7f1b66f1cdef9'
            '1f6efefa58dde9148396bd9236a6985db0fa27f1c767067b52bfae1832f32284'
            '7fd36db71f39fde3d515c697101190f979b308d910b3c4210b90422669683ab0')

package() {
  mkdir -p $pkgdir/opt/ums
  mkdir $pkgdir/opt/ums/database
  mkdir -p $pkgdir/usr/bin
  chmod -R 755 $srcdir/ums-$pkgver/plugins $srcdir/ums-$pkgver/documentation
  rm -R $srcdir/ums-$pkgver/linux/*
  cp -r $srcdir/ums-$pkgver/* $pkgdir/opt/ums/
  chmod +x $pkgdir/opt/ums/UMS.sh
  touch $pkgdir/opt/ums/UMS.conf
  touch $pkgdir/opt/ums/debug.log
  chgrp users $pkgdir/opt/ums/UMS.conf \
              $pkgdir/opt/ums/WEB.conf \
              $pkgdir/opt/ums/debug.log \
              $pkgdir/opt/ums/database

  chmod g+w $pkgdir/opt/ums/UMS.conf \
            $pkgdir/opt/ums/WEB.conf \
            $pkgdir/opt/ums/debug.log \
            $pkgdir/opt/ums/database 

  unzip -q -u $srcdir/ums-$pkgver/ums.jar -d ums_jar
  install -d -m 755 $pkgdir/usr/share/pixmaps
  install -D -m 644 $srcdir/ums_jar/resources/images/logo.png $pkgdir/usr/share/pixmaps/ums.png
  install -D -m 644 $srcdir/ums.desktop $pkgdir/usr/share/applications/ums.desktop
  install -D -m 644 $srcdir/ums.service $pkgdir/usr/lib/systemd/system/ums@.service
  install -D -m 644 ${srcdir}/ums.timer ${pkgdir}/usr/lib/systemd/system/ums@.timer
}
