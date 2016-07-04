# Maintainer: Grego Dadone <grego.dadone@gmail.com>
# Based on UMS PKGBUILD

pkgname=ums-headless
pkgver=6.4.0
pkgrel=1
pkgdesc="Universal Media Server: a DLNA-compliant UPnP Media Server for headless systems. Build based on Java 8."
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'armv6h' 'arm')
url="http://www.universalmediaserver.com/"
license=('GPL2')
depends=('ffmpeg-headless' 'libmediainfo' 'java-runtime=8')
conflicts=('ums')
optdepends=("mencoder: Free command line video decoding, encoding and filtering tool"
            "ts-muxer-cli-ng: Remux/mux elementary streams without re-encoding")
makedepends=("unzip")
[ "$CARCH" = "x86_64" ] && \
optdepends=("dcraw: thumbnails creation support"
            "lib32-gcc-libs: tsMuxeR support"
            "lib32-glibc: tsMuxeR support")
backup=(opt/ums/UMS.conf \
        opt/ums/WEB.conf)
source=("http://downloads.sourceforge.net/project/unimediaserver/Official%20Releases/Linux/UMS-$pkgver-Java8.tgz"
        'ums.desktop'
        'ums.service')
sha256sums=('12ff5482db1c06a895b1dfb484a3bf0940b09e95dffebfb08c367082174d751c'
            '0cdadbabef215b6539e56755147a8f626d9f1fadfb85e2e5b7f7f1b66f1cdef9'
            'e9709c58a909b79062604425e18e0ab7a8ee5d7b823fb481dcc9269b02fcc4a7')

package() {
  mkdir -p $pkgdir/opt/ums
  mkdir $pkgdir/opt/ums/database
  mkdir -p $pkgdir/usr/bin
  chmod -R 755 $srcdir/ums-$pkgver/plugins $srcdir/ums-$pkgver/documentation
  rm -R $srcdir/ums-$pkgver/linux/*
  cp -r $srcdir/ums-$pkgver/* $pkgdir/opt/ums/
  ln -s /usr/bin/ffmpeg $pkgdir/opt/ums/linux/ffmpeg
  ln -s /usr/bin/ffmpeg $pkgdir/opt/ums/linux/ffmpeg64
  ln -s /usr/bin/tsMuxeR $pkgdir/opt/ums/linux/tsMuxeR
  ln -s /usr/bin/tsMuxeR $pkgdir/opt/ums/linux/tsMuxeR-new
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
}
