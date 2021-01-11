# Maintainer: willemw <willemw12@gmail.com>

pkgname=3ncode-git
pkgver=r37.2222e41
pkgrel=1
pkgdesc="Graphical video and audio converter for ffmpeg"
arch=('any')
url="https://github.com/llelectronics/3ncode"
license=('BSD')
#kdelibs
depends=('ffmpeg' 'kdebase-runtime' 'python2-pyqt4')
optdepends=('mkvtoolnix-cli: mkv files')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git"
        "${pkgname%-git}.sh"
        "${pkgname%-git}.desktop")
md5sums=('SKIP'
         'a7879368369e806012f0785542370f47'
         'bdf9a12bcd4780479e867e6a5d1f1d34')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  sed -i 's|#!/usr/bin/python.*$|#!/usr/bin/python2|' encode.py

  # Allow 'aac' codec: add '-strict -2' to ffmpeg options
  sed -i 's|\(var[ ]*cmd[ ]*=[ ]*"ffmpeg.*$\)|\1 + " -strict -2"|' qml/encodeItem.qml
}

package() {
  install -Dm755 "${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"

  cd $pkgname
  install -Dm644 qml/img/encode.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  install -dm755 "$pkgdir/usr/share/${pkgname%-git}"
  cp -a *.py *.qml qml/ "$pkgdir/usr/share/${pkgname%-git}"
}

