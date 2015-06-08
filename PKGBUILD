# Maintainer: willemw <willemw12@gmail.com>

_pkgname=3ncode
pkgname=$_pkgname-git
pkgver=r35.30e0440
pkgrel=1
pkgdesc="Graphical video and audio converter for ffmpeg"
arch=('any')
url="https://github.com/llelectronics/3ncode"
license=('BSD')
#kdelibs
depends=('ffmpeg' 'kdebase-runtime' 'python2-pyqt4')
optdepends=('mkvtoolnix-cli: mkv files')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git://github.com/llelectronics/$_pkgname.git
        $_pkgname.sh
        $_pkgname.desktop)
md5sums=('SKIP'
         'a7879368369e806012f0785542370f47'
         'bdf9a12bcd4780479e867e6a5d1f1d34')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  sed -i 's|#!/usr/bin/python[ ]*$|#!/usr/bin/python2|' encode.py

  # Fix aac audio
  # 1) Allow 'aac' codec: add '-strict -2' to ffmpeg options
  sed -i 's|\(var[ ]*cmd[ ]*=[ ]*"ffmpeg.*$\)|\1 + " -strict -2"|' qml/encodeItem.qml
  # 2) Rename 'libfaac' codec to 'aac' codec
  sed -i 's|libfaac|aac|g' *.qml qml/*.qml
}

package() {
  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"

  cd $_pkgname
  install -Dm644 qml/img/encode.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -dm755 "$pkgdir/usr/share/$_pkgname"
  cp -r *.py *.qml qml/ "$pkgdir/usr/share/$_pkgname"
}

