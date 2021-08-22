# Maintainer: Andreas Born <futur[DOT]andy[AT]googlemail[DOT]com>

pkgname=lrz-syncshare
pkgver=16.3.100
pkgrel=1
pkgdesc="Sync client for the LRZ Sync+Share service"
url='https://syncandshare.lrz.de/'
arch=('any')
license=('custom')
#depends=('desktop-file-utils' 'hicolor-icon-theme' 'jre>16' 'jre<17' 'xdg-utils')
#depends=('desktop-file-utils' 'hicolor-icon-theme' 'jre11' 'xdg-utils')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'java-runtime>=11' 'xdg-utils' 'archlinux-java-run')
source=("LRZ_Sync_Share_${pkgver}_Linux.tar.gz::https://syncandshare.lrz.de/client_deployment/LRZ_Sync_Share_Latest_Linux.tar.gz")
sha256sums=('f7b6de9b13ef8a8cc9ce032b4fa31c5c709b6e54fd02f62ee0754ad09e3b15b2')

pkgver() {
  cat "${srcdir}/LRZ_Sync_Share/VERSION" | sed -e 's/\s*$//'
}

prepare() {
  cd "${srcdir}/LRZ_Sync_Share"

  sed -e "s;^CLIENT_INSTALL=.*\$;CLIENT_INSTALL=/usr/share/${pkgname};" \
      -e 's;^RUN_CMD="$CLIENT_INSTALL/jre/bin/java ;RUN_CMD="/usr/bin/archlinux-java-run -a 11 -- --illegal-access=permit ;' \
      -i LRZ_Sync_Share-Client.sh
  sed -e "s;^Icon=.*;Icon=${pkgname};" \
      -e "s;^Exec=.*;Exec=${pkgname};" -i install-files/LRZ_Sync_Share.desktop
}

package() {
  cd "${srcdir}/LRZ_Sync_Share"

  install -Dm755 LRZ_Sync_Share-Client.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LRZ_Sync_Share.jar -t "${pkgdir}/usr/share/${pkgname}/"

  install -Dm644 install-files/LRZ_Sync_Share.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 install-files/LRZ_Sync_Share.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

