# Maintainer: Mitch <mitch at znation dot nl>
# Contributor: Red Squirrel <iam at redsquirrel87 dot com>
# Based on PMS PKGBUILD

pkgname=ums
pkgver=7.7.0
pkgrel=1
pkgdesc="Universal Media Server: a DLNA-compliant UPnP Media Server. Build based on Java 8."
arch=('i686' 'x86_64')
url="http://www.universalmediaserver.com/"
license=('GPL2')
depends=('mplayer' 'ffmpeg' 'mencoder' 'libmediainfo' 'java-runtime=8' 'tsmuxer-ng-cli-bin')
makedepends=("unzip")
[ "$CARCH" = "i686" ] && \
optdepends=("vlc: For Internet video/audio")
[ "$CARCH" = "x86_64" ] && \
optdepends=("vlc: Internet video/audio support"
            "dcraw: thumbnails creation support"
            "lib32-gcc-libs: tsMuxeR support"
            "lib32-glibc: tsMuxeR support")
backup=(opt/ums/UMS.conf \
        opt/ums/WEB.conf)
#source=("http://downloads.sourceforge.net/project/unimediaserver/Official%20Releases/Linux/UMS-$pkgver.tgz"
source=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/$pkgver/UMS-$pkgver.tgz"
        'ums.desktop'
        'ums.service'
        'ums.timer')
sha256sums=('d30f121217c07eb684265edd3ec387a177b86803b0298b37e334ce6a8669c2d8'
            '0cdadbabef215b6539e56755147a8f626d9f1fadfb85e2e5b7f7f1b66f1cdef9'
            '1f6efefa58dde9148396bd9236a6985db0fa27f1c767067b52bfae1832f32284'
            '7fd36db71f39fde3d515c697101190f979b308d910b3c4210b90422669683ab0')

package() {
  mkdir -p ${pkgdir}/opt/ums
  mkdir ${pkgdir}/opt/ums/database
  mkdir -p ${pkgdir}/usr/bin
  chmod -R 755 ${srcdir}/ums-$pkgver/plugins ${srcdir}/ums-$pkgver/documentation
  rm -R ${srcdir}/ums-$pkgver/linux/*
  cp -r ${srcdir}/ums-$pkgver/* ${pkgdir}/opt/ums/
  ln -s /usr/bin/ffmpeg ${pkgdir}/opt/ums/linux/ffmpeg
  ln -s /usr/bin/ffmpeg ${pkgdir}/opt/ums/linux/ffmpeg64
  ln -s /usr/bin/tsMuxeR ${pkgdir}/opt/ums/linux/tsMuxeR
  ln -s /usr/bin/tsMuxeR ${pkgdir}/opt/ums/linux/tsMuxeR-new
  chmod +x ${pkgdir}/opt/ums/UMS.sh
  touch ${pkgdir}/opt/ums/UMS.conf
  touch ${pkgdir}/opt/ums/debug.log
  chgrp users ${pkgdir}/opt/ums/UMS.conf \
              ${pkgdir}/opt/ums/WEB.conf \
              ${pkgdir}/opt/ums/debug.log \
              ${pkgdir}/opt/ums/database

  chmod g+w ${pkgdir}/opt/ums/UMS.conf \
            ${pkgdir}/opt/ums/WEB.conf \
            ${pkgdir}/opt/ums/debug.log \
            ${pkgdir}/opt/ums/database 

  unzip -q -u ${srcdir}/ums-$pkgver/ums.jar -x / /*.pom -d ums_jar
  install -d -m 755 ${pkgdir}/usr/share/pixmaps
  install -D -m 644 ${srcdir}/ums_jar/resources/images/logo.png ${pkgdir}/usr/share/pixmaps/ums.png
  install -D -m 644 ${srcdir}/ums.desktop ${pkgdir}/usr/share/applications/ums.desktop
  install -D -m 644 ${srcdir}/ums.service ${pkgdir}/usr/lib/systemd/system/ums@.service
  install -D -m 644 ${srcdir}/ums.timer ${pkgdir}/usr/lib/systemd/system/ums@.timer
}
