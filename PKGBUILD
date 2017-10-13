# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=crusta-browser-git
pkgver=1.4.1.r7.gc73381f
pkgrel=1
pkgdesc="Fast, secure, and free web browser built for the modern web."
arch=('i686' 'x86_64')
url="http://www.crustabrowser.com/"
license=('GPL3')
depends=('qt5-speech' 'qt5-webengine')
makedepends=('git' 'qt5-charts')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/CrustaBrowser/CrustaBrowser.git')
sha256sums=('SKIP')

pkgver() {
  cd CrustaBrowser
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd CrustaBrowser/crusta
  qmake-qt5 crusta.pro
  make
}

package() {
  cd CrustaBrowser
  install -Dm755 crusta/crusta "${pkgdir}/opt/${pkgname%-*}/crusta"
  install -d "$pkgdir/usr/bin"
  ln -sf "/opt/${pkgname%-*}/crusta" "$pkgdir/usr/bin/crusta"
  cp -r {3rd_party,speeddial} "${pkgdir}/opt/${pkgname%-*}"
  install -Dm644 crusta/res/drawables/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/crusta.svg"
  sed "s/Exec=.*/Exec=crusta/g;s/Icon=.*/Icon=crusta/g;s/GNOME/Network;GNOME/g" -i Crusta.desktop
  install -Dm755 Crusta.desktop "$pkgdir/usr/share/applications/Crusta.desktop"
}
