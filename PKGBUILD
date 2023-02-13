# Maintainer: Mitch <mitch at znation dot nl>
# Contributor: Red Squirrel <iam at redsquirrel87 dot com>
# Based on PMS PKGBUILD

pkgname=ums
pkgver=13.2.0
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
sha256sums_i686=('91a5c534664441064c772dcace5bcef02edac82d8d3c67155ddd803deabeb52c')
sha256sums_x86_64=('1b009c7deb737641e173a0a82c0b105d8e33a4392de661562e156e4434a4ed17')
sha256sums_aarch64=('f2b05cec5fa6e51b9b5e1884b1ecdb99ca4e11bc0793a5cbea66c0f5c7e03a1a')
sha256sums_arm=('622c1845996472137cd4a47898433ee995802edd6df3d7768f16336d79316452')
sha256sums_armv6h=('5e478d40336600517a6f765c49c45bb81c627b76113b571d3ae09e9457429b3e')
sha256sums_armv7h=('5e478d40336600517a6f765c49c45bb81c627b76113b571d3ae09e9457429b3e')

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
