# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
 
pkgname=babe-git
pkgver=0.5.Beta.r199.gd0b98c7
pkgrel=1
pkgdesc='Tiny Qt Music Player to keep your favorite songs at hand'
arch=('i686' 'x86_64')
url="https://babe.kde.org/"
license=('GPL3')
depends=('desktop-file-utils' 'gtk-update-icon-cache' 'ki18n' 'knotifications' 'qt5-webengine' 'taglib')
makedepends=('git')
optdepends=('youtube-dl: youtube support')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" 'babe-qt')
replaces=('babe-qt')
source=('git+git://anongit.kde.org/babe.git')
sha256sums=('SKIP')

pkgver() {
  cd babe
  version="$(grep 'Version:' about.cpp | awk '{print $5 "." $6}' | awk -F'\' '{print $1}')"
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd babe
  qmake-qt5
  make
}
 
package() {
  cd babe
  install -Dm755 Babe "$pkgdir/usr/bin/babe"
  install -Dm644 data/48-apps-babe.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/babe.svg"
  install -Dm644 data/128-apps-babe.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/babe.png"
  install -Dm655 org.kde.babe.appdata.xml "$pkgdir/usr/share/metainfo/org.kde.babe.appdata.xml"
  install -Dm755 org.kde.babe.desktop "$pkgdir/usr/share/applications/org.kde.babe.desktop"
  sed -i 's|Exec=Babe|Exec=babe|' "${pkgdir}/usr/share/applications/org.kde.babe.desktop"
  sed -i 's|Icon=Babe|Icon=babe|' "${pkgdir}/usr/share/applications/org.kde.babe.desktop"
}
