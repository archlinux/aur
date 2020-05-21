# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Grego Dadone <grego.dadone@gmail.com>
# Based on UMS PKGBUILD

pkgname=ums-headless
pkgver=9.4.3
pkgrel=2
pkgdesc="Universal Media Server: a DLNA-compliant UPnP Media Server for headless systems."
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'armv6h' 'arm')
url="https://www.universalmediaserver.com/"
license=('GPL2')
depends=('mplayer' 'mencoder' 'libmediainfo')
makedepends=("unzip")
optdepends=("java-runtime: Java runtime environment"
            "ffmpeg: Complete solution to record, convert and stream audio and video"
            "tsmuxer-ng-cli-bin: Remux/mux elementary streams without re-encoding"
            "vlc: For Internet video/audio")
optdepends_x86_64=("dcraw: thumbnails creation support"
                   "lib32-gcc-libs: tsMuxeR support"
                   "lib32-glibc: tsMuxeR support")
backup=(opt/ums/UMS.conf \
        opt/ums/WEB.conf)
conflicts=('ums')
source_x86_64=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${pkgver}/UMS-${pkgver}-x86_64.tgz")
source_i686=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${pkgver}/UMS-${pkgver}-x86.tgz")
source_armv7h=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${pkgver}/UMS-${pkgver}-armhf.tgz")
source_armv6h=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${pkgver}/UMS-${pkgver}-armhf.tgz")
source_aarch64=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${pkgver}/UMS-${pkgver}-arm64.tgz")
source_arm=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${pkgver}/UMS-${pkgver}-armel.tgz")

source=('ums.desktop'
        'ums.service'
        'ums.timer')
sha256sums=('0cdadbabef215b6539e56755147a8f626d9f1fadfb85e2e5b7f7f1b66f1cdef9'
            '1f6efefa58dde9148396bd9236a6985db0fa27f1c767067b52bfae1832f32284'
            '7fd36db71f39fde3d515c697101190f979b308d910b3c4210b90422669683ab0')
sha256sums_i686=('e042ebff51c16a0496066b6f92ea1363cd87a1bef15be694b63ffe02a35f72f5')
sha256sums_x86_64=('b5937574edf9e1a673edddd44fc2f724fa847449c55d4f96cdd68e62d7279459')
sha256sums_armv7h=('5134f5a15eba5b36b7d7a6770959e3b5890a3b254976164b6c5288ee2833e0c1')
sha256sums_aarch64=('2d26b6f8b79a59c8b72dab679f8fa82d532cb7406e5227e747e602f539b67e35')
sha256sums_armv6h=('5134f5a15eba5b36b7d7a6770959e3b5890a3b254976164b6c5288ee2833e0c1')
sha256sums_arm=('6bab92aa6520fcdc1d9ab013dbeeafc3e260b18fa3af36ea356277941af91d7e')

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
