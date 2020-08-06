# Maintainer: Mitch <mitch at znation dot nl>
# Contributor: Red Squirrel <iam at redsquirrel87 dot com>
# Based on PMS PKGBUILD

pkgname=ums
pkgver=9.8.0
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
sha256sums_i686=('459d93b68f0dc86bc1e06e6eea364707ebcae07488bf92488e5d66553f83837d')
sha256sums_x86_64=('a61deef3f57f464212f189f0aba26ed7cf3640ef2c78fa109d2e014025b4c788')
sha256sums_aarch64=('b91859ccf30015d445dfcbce400b526e99f695c3ecb89fb8ff8bd84c790948cf')
sha256sums_arm=('16bcaca01364b67192d8ad12e69f67d12ee6dbb8e9f44adbe69753c0563acede')
sha256sums_armv6h=('92f9028a465103e0f129617c5794c4c19ecc548da0b918e5307243dfcfd24740')
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
