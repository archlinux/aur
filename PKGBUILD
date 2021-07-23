# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=viper4linux-gui-git
pkgver=2.2.r12.g0851d8b
pkgrel=3
pkgdesc="Official UI for Viper4Linux"
arch=('x86_64')
url="https://github.com/Audio4Linux/Viper4Linux-GUI"
license=('GPL3')
depends=('gst-plugins-bad-libs' 'mesa' 'qt5-multimedia' 'qt5-svg' 'viper4linux-git')
makedepends=('git')
optdepends=('libappindicator-gtk3: tray icon support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/Audio4Linux/Viper4Linux-GUI.git"
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            '05a46b8ad3508e9275388d9255247cda09977eb8087fa5dd96d04bc25c17a77c')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  qmake V4L_Frontend.pro \
    QMAKE_CFLAGS="$CFLAGS" \
    QMAKE_CXXFLAGS="$CXXFLAGS" \
    QMAKE_LFLAGS="$LDFLAGS"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 V4L_Frontend "$pkgdir/usr/bin/viper-gui"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 viper.png "$pkgdir/usr/share/pixmaps/viper-gui.png"
}
