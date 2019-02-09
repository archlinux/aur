# Maintainer: Michael J. Pento <mjpento@verizon.net>

pkgname=ocsstore
pkgver=3.5.0
pkgrel=1
pkgdesc="OCS-Store frontend. Downloading and Managing Linux softwares,fonts,artworks,desktop-themes and so on"
arch=('x86_64')
url="https://www.opendesktop.org/c/1492685474"
license=('GPL3')
provides=('ocsstore')
depends=('gconf' 'libxss' 'libxtst' 'qt5-base>=5.3.0' 'qt5-websockets>=5.3.0' 'libnotify' 'libappindicator' 'libindicator')
options=('!strip' '!emptydirs')
noextract=('opendesktop-app-${pkgver}-${pkgrel}-${arch.AppImage}')

_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1525953341/s/${_hash_time[0]}/t/${_hash_time[1]}/u/opendesktop-app-${pkgver}-${pkgrel}-${arch}.AppImage")

md5sums=('6a1dc04d5622efe28704422924591365')

prepare() {
  chmod ugo+x "${srcdir}/opendesktop-app-${pkgver}-${pkgrel}-${arch}.AppImage"
  "${srcdir}/opendesktop-app-${pkgver}-${pkgrel}-${arch}.AppImage" --appimage-extract
  chmod ugo-x "${srcdir}/opendesktop-app-${pkgver}-${pkgrel}-${arch}.AppImage"
}

package() {
  install -dm755 "${pkgdir}/usr"
  cp -r "${srcdir}/squashfs-root/usr/"* "${pkgdir}/usr"
  rm -f "${pkgdir}/usr/bin/opendesktop-app-appimage"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr" -type f -exec chmod 644 {} \;
  chmod ugo+x "${pkgdir}/usr/bin/opendesktop-app"
  chmod ugo+x "${pkgdir}/usr/lib/opendesktop-app-linux-x64/opendesktop-app"
  chmod ugo+x "${pkgdir}/usr/lib/opendesktop-app-linux-x64/resources/app/bin/ocs-manager"
}
