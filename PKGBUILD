# Maintainer: Mitch <mitch at znation dot nl>
# Contributor: Red Squirrel <iam at redsquirrel87 dot com>
# Based on PMS PKGBUILD

pkgname=ums
pkgver=14.10.1
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

source_i686=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${pkgver}/UMS-Linux-${pkgver}-x86.tgz")
source_x86_64=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${pkgver}/UMS-Linux-${pkgver}-x86_64.tgz")
source_aarch64=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${pkgver}/UMS-Linux-${pkgver}-arm64.tgz")
source_arm=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${pkgver}/UMS-Linux-${pkgver}-armel.tgz")
source_armv6h=("https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${pkgver}/UMS-Linux-${pkgver}-armhf.tgz")
source_armv7h=(${source_armv6h})
source=('ums.desktop'
        'ums.service'
        'ums.timer')

sha256sums=('0cdadbabef215b6539e56755147a8f626d9f1fadfb85e2e5b7f7f1b66f1cdef9'
            '1f6efefa58dde9148396bd9236a6985db0fa27f1c767067b52bfae1832f32284'
            '7fd36db71f39fde3d515c697101190f979b308d910b3c4210b90422669683ab0')
sha256sums_i686=('c40ac1da6806d51ebebe0c11d1319e53f617367501afa4a8ca4ee20a1085ee63')
sha256sums_x86_64=('13f5acfa236a96296b383a3bfa49cb157582134f8d6d3697f8eca431d9a3efc5')
sha256sums_aarch64=('e9f93b7be98417bcecba1599856c3368593f87f80be54c94dc25c26bb2763ae1')
sha256sums_arm=('f01eb1c590da23c8aa45c1111ccf79912912b4e31e4b7e2471970bd266d754ab')
sha256sums_armv6h=('f769227a1e77c25ef9ff72c6685d28ae00feac7a519ae3d0856dbc0ae170c212')
sha256sums_armv7h=('f769227a1e77c25ef9ff72c6685d28ae00feac7a519ae3d0856dbc0ae170c212')

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
