# Maintainer: Mitch <mitch at znation dot nl>
# Contributor: Red Squirrel <iam at redsquirrel87 dot com>
# Based on PMS PKGBUILD

pkgname=ums
pkgver=13.0.1
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
backup=(opt/ums/UMS.conf)

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
sha256sums_i686=('7525e84e9e4d07d42550e7521635a9dfafcaaa5ab51570beeb485bc49b6e6e74')
sha256sums_x86_64=('0e09b4a9a0daa985e61b3c1f1c98abc103a8396973f37195363fdc2d07cee231')
sha256sums_aarch64=('3c55d8f212a96e9fca349afec871789193b9c64baed81a46f9faf1eab01bb268')
sha256sums_arm=('5bc72b5fcadcdd49cf9487ef754ba156068d2391e2bc354f0dcca1ab04401050')
sha256sums_armv6h=('56688cee1f4a4b1bd791417c28c93904e1e5cd3dbe4fc7473617c18b57974bdd')
sha256sums_armv7h=('56688cee1f4a4b1bd791417c28c93904e1e5cd3dbe4fc7473617c18b57974bdd')

package() {
  mkdir -p "${pkgdir}/opt/ums"
  mkdir "${pkgdir}/opt/ums/database"
  mkdir -p "${pkgdir}/usr/bin"
  cp -r "${srcdir}/ums-$pkgver"/* "${pkgdir}/opt/ums/"
  touch "${pkgdir}/opt/ums/UMS.conf"
  touch "${pkgdir}/opt/ums/debug.log"
  chgrp users "${pkgdir}/opt/ums/UMS.conf" \
              "${pkgdir}/opt/ums/debug.log" \
              "${pkgdir}/opt/ums/database"

  chmod g+w "${pkgdir}/opt/ums/UMS.conf" \
            "${pkgdir}/opt/ums/debug.log" \
            "${pkgdir}/opt/ums/database"

  unzip -q -u "${srcdir}/ums-$pkgver/ums.jar" -d ums_jar
  install -d -m 755 "${pkgdir}/usr/share/pixmaps"
  install -D -m 644 "${srcdir}/ums_jar/resources/images/logo.png" "${pkgdir}/usr/share/pixmaps/ums.png"
  install -D -m 644 "${srcdir}/ums.desktop" "${pkgdir}/usr/share/applications/ums.desktop"
  install -D -m 644 "${srcdir}/ums.service" "${pkgdir}/usr/lib/systemd/system/ums@.service"
  install -D -m 644 "${srcdir}/ums.timer" "${pkgdir}/usr/lib/systemd/system/ums@.timer"

  install -d -m 755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/UMS.sh" "${pkgdir}/usr/bin/${pkgname}"
}
