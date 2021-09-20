# Maintainer: Mitch <mitch at znation dot nl>
# Contributor: Red Squirrel <iam at redsquirrel87 dot com>
# Based on PMS PKGBUILD

pkgname=ums
pkgver=10.12.0
pkgrel=1
pkgdesc="Universal Media Server: a DLNA-compliant UPnP Media Server."
arch=('i686' 'x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="http://www.universalmediaserver.com/"
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
sha256sums_i686=('268e43886a4312f5eaaae06f6d081e8f217bb2b5bbb2b84566946bced92f6d48')
sha256sums_x86_64=('d66170780699533810fbefee81a688cae6d18972a810eebc566aa4e2e636c919')
sha256sums_aarch64=('511df8e139974222fbd6803ac901d9e17041b4cc5763ccf879ea70cd7b5265b8')
sha256sums_arm=('c3b52a8a086723ecb67b7a970dc7e7f90698fb6da0957afb0aa69fb03e066b6d')
sha256sums_armv6h=('8e85204a7648a11b8d993aee277ecd43ab0fd6cb4541b7d16dfbb332b2b2a3e1')
sha256sums_armv7h=(${sha256sums_armv6h})

package() {
  mkdir -p ${pkgdir}/opt/ums
  mkdir ${pkgdir}/opt/ums/database
  mkdir -p ${pkgdir}/usr/bin
  chmod -R 755 ${srcdir}/ums-$pkgver/plugins ${srcdir}/ums-$pkgver/documentation
  cp -r ${srcdir}/ums-$pkgver/* ${pkgdir}/opt/ums/
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

  unzip -q -u ${srcdir}/ums-$pkgver/ums.jar -d ums_jar
  install -d -m 755 ${pkgdir}/usr/share/pixmaps
  install -D -m 644 ${srcdir}/ums_jar/resources/images/logo.png ${pkgdir}/usr/share/pixmaps/ums.png
  install -D -m 644 ${srcdir}/ums.desktop ${pkgdir}/usr/share/applications/ums.desktop
  install -D -m 644 ${srcdir}/ums.service ${pkgdir}/usr/lib/systemd/system/ums@.service
  install -D -m 644 ${srcdir}/ums.timer ${pkgdir}/usr/lib/systemd/system/ums@.timer
}
