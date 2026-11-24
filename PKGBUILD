# Maintainer: samtoxie <sam@toxopeus.it>

pkgname=sonar-bin
_pkgname=sonar
pkgver=0.1.1
pkgrel=1
pkgdesc='A file manager inspired by KDE Dolphin (prebuilt release)'
arch=('x86_64')
url='https://github.com/samtoxie/sonar'
license=('EUPL-1.2')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme' 'shared-mime-info' 'xdg-utils' 'libarchive')
optdepends=('udisks2: mount and eject removable drives from the sidebar'
            'breeze-icons: file and folder icons (or another icon theme)'
            'xdg-desktop-portal: let other apps use Sonar as their file chooser')
provides=('sonar')
conflicts=('sonar' 'sonar-git')
options=('!strip')
source=("$_pkgname-$pkgver.deb::$url/releases/download/v$pkgver/Sonar_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/samtoxie/sonar/v$pkgver/LICENSE")
sha256sums=('42b77a7895aa496e3483e3a253c9c3aa824ccc0172bab0b68fd7d7e2b4070434'
            '57fb42fbcd0b037ce528ed8f72f1ec095d67bc6825ecf1448ff39be1fe68a4b4')

prepare() {
  mkdir -p deb
  bsdtar -xf data.tar.gz -C deb
}

package() {
  # Same layout as the `sonar` package (the .deb names some files differently).
  install -Dm755 deb/usr/bin/sonar "$pkgdir/usr/bin/sonar"
  install -Dm644 deb/usr/share/applications/Sonar.desktop "$pkgdir/usr/share/applications/sonar.desktop"
  local size
  for size in 32x32 128x128 512x512; do
    install -Dm644 "deb/usr/share/icons/hicolor/$size/apps/sonar.png" "$pkgdir/usr/share/icons/hicolor/$size/apps/sonar.png"
  done
  install -Dm644 deb/usr/share/icons/hicolor/256x256@2/apps/sonar.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/sonar.png"
  install -Dm644 deb/usr/share/xdg-desktop-portal/portals/org.freedesktop.impl.portal.desktop.sonar.portal "$pkgdir/usr/share/xdg-desktop-portal/portals/org.freedesktop.impl.portal.desktop.sonar.portal"
  install -Dm644 deb/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.sonar.service "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.sonar.service"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
