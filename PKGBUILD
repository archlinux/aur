# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=mpc-qt-git
pkgver=r798.69b1468
pkgrel=1
pkgdesc='A clone of Media Player Classic reimplimented in Qt.'
url='https://github.com/cmdrkotori/mpc-qt'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('mpv' 'qt5-x11extras')
makedepends=('git' 'imagemagick' 'librsvg')
provides=('mpc-qt')
conflicts=('mpc-qt')
source=("git+${url}.git"
        'mpc-qt.desktop')
sha256sums=('SKIP'
            '7694745aac0e52c050a6bc069a0686b025e509136919d985d3c4495eec0f1c9d')

pkgver() {
  cd mpc-qt
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd mpc-qt
  qmake-qt5 CONFIG+=debug mpc-qt.pro
  make
}

package() {
  cd mpc-qt
  install -Dm755 mpc-qt "$pkgdir/usr/bin/mpc-qt"
  install -Dm644 ../mpc-qt.desktop "$pkgdir/usr/share/applications/mpc-qt.desktop"
  install -Dm644 images/bitmaps/icon.png "$pkgdir/usr/share/pixmaps/mpc-qt.png"
  install -Dm644 image-sources/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/mpc-qt.png"
  for size in 256 192 128 64 48 32 24 22 16; do
    install -d "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps
    convert image-sources/logo.svg -resize ${size} \
    	"${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/mpc-qt.png
  done
}
