# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Grego Dadone <grego.dadone@gmail.com>
# Based on UMS PKGBUILD

pkgname=ums-headless
pkgver=9.7.1
pkgrel=3
pkgdesc="Universal Media Server: a DLNA-compliant UPnP Media Server for headless systems."
arch=('i686' 'x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://www.universalmediaserver.com/"
license=('GPL2')
depends=('mplayer' 'mencoder' 'libmediainfo')
makedepends=("unzip")
optdepends=("java-runtime: Java runtime environment"
            "ffmpeg: Complete solution to record, convert and stream audio and video"
            "vlc: For Internet video/audio")
optdepends_x86_64=("dcraw: thumbnails creation support"
                   "lib32-gcc-libs: tsMuxeR support"
                   "lib32-glibc: tsMuxeR support")
backup=(opt/ums/UMS.conf \
        opt/ums/WEB.conf)
conflicts=('ums')
provides=('ums')

source_i686=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${pkgver}/UMS-${pkgver}-x86.tgz")
source_x86_64=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${pkgver}/UMS-${pkgver}-x86_64.tgz")
source_aarch64=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${pkgver}/UMS-${pkgver}-arm64.tgz")
source_arm=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${pkgver}/UMS-${pkgver}-armel.tgz")
source_armv6h=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${pkgver}/UMS-${pkgver}-armhf.tgz")
source_armv7h=(${source_armv6h})
source=('ums.desktop'
        'ums.service'
        'ums.timer')

sha256sums=('0cdadbabef215b6539e56755147a8f626d9f1fadfb85e2e5b7f7f1b66f1cdef9'
            '1f6efefa58dde9148396bd9236a6985db0fa27f1c767067b52bfae1832f32284'
            '7fd36db71f39fde3d515c697101190f979b308d910b3c4210b90422669683ab0')
sha256sums_i686=('23e5226ef4969267d73486e75fcf942689b224b9c6af2ca52d940e23a6ff379e')
sha256sums_x86_64=('3554f8ede91e70b48d3d2528cb90381a1ca244c9af3ac7af387ecf00690b09ac')
sha256sums_aarch64=('675cdbd52e0d777ea1ef65ead2911fe7fb555771a41e0a5dd99de7c71d64c002')
sha256sums_arm=('e1a5425a0830ace4e2b5c12088195d438e7d85a2a5a9150349af4ccc16bae934')
sha256sums_armv6h=('1d8a21e61cb42528645a2c6eb64901a33d2950e73fc9507155248de7f1a97c46')
sha256sums_armv7h=('1d8a21e61cb42528645a2c6eb64901a33d2950e73fc9507155248de7f1a97c46')

package() {
  mkdir -p ${pkgdir}/opt/ums
  mkdir ${pkgdir}/opt/ums/database
  mkdir -p ${pkgdir}/usr/bin
  chmod -R 755 ${srcdir}/ums-${pkgver}/plugins ${srcdir}/ums-${pkgver}/documentation
  rm -R ${srcdir}/ums-${pkgver}/linux/*
  cp -r ${srcdir}/ums-${pkgver}/* ${pkgdir}/opt/ums/
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

  unzip -q -u ${srcdir}/ums-${pkgver}/ums.jar -x / /*.pom -d ums_jar
  install -d -m 755 ${pkgdir}/usr/share/pixmaps
  install -D -m 644 ${srcdir}/ums_jar/resources/images/logo.png ${pkgdir}/usr/share/pixmaps/ums.png
  install -D -m 644 ${srcdir}/ums.desktop ${pkgdir}/usr/share/applications/ums.desktop
  install -D -m 644 ${srcdir}/ums.service ${pkgdir}/usr/lib/systemd/system/ums@.service
  install -D -m 644 ${srcdir}/ums.timer ${pkgdir}/usr/lib/systemd/system/ums@.timer
}
