# Maintainer: Grego Dadone <grego.dadone@gmail.com>
# Contributor: Grego Dadone <grego.dadone@gmail.com>
# Based on UMS PKGBUILD

pkgname=ums-headless
pkgver=13.8.0
pkgrel=2
pkgdesc="Universal Media Server: a DLNA-compliant UPnP Media Server for headless systems."
arch=('i686' 'x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://www.universalmediaserver.com/"
license=('GPL2')
depends=('java-runtime-headless')
makedepends=("unzip")
conflicts=('ums')
provides=('ums')
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
sha256sums_i686=('825eca1211c96d49147bbd1613e24e3b0a94a545403d41428f17cba3cfe71c22')
sha256sums_x86_64=('214dda41f1c5d41df3cc11b4f9a29f6adbe61e4e9e643e8e1b92dcca307eeeb0')
sha256sums_aarch64=('66c07d385f1b1e7d0f9f06097216268b9cd6ded7df37ccb502cbe75bad7ba4b5')
sha256sums_arm=('7ff40b4c636dfecd3a184f3e727f25b65d4643dd23dddfe33fb27761ce467605')
sha256sums_armv6h=('b9dce551ae83c5c15cb0635880b6d1e7ab104f21ce08114e081be63230f2cea7')
sha256sums_armv7h=('b9dce551ae83c5c15cb0635880b6d1e7ab104f21ce08114e081be63230f2cea7')

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
