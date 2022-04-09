# Maintainer: willemw <willemw12@gmail.com>

pkgname=3ncode-git
pkgver=r56.acf550a
pkgrel=1
pkgdesc="Graphical video and audio converter for ffmpeg"
arch=('any')
url="https://github.com/NeptuneOS/3ncode"
license=('BSD')
#'python-pyside2'    # Alternative Python binding for Qt5
depends=('ffmpeg' 'kirigami2' 'python-pyqt5')
optdepends=('faac: codec'
            'faad2: codec'
            'lame: codec'
            'mkvtoolnix-cli: for mkv files'
            'opencore-amr: codec'
            'opus: codec'
            'x264: codec'
            'xvidcore: codec')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git#branch=kirigami_app")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  sed -i 's/=[Ee]ncode$/=3ncode/g' debian/encode.desktop
  sed -i 's|/usr/share/encode|/usr/share/3ncode|g' encode
}

package() {
  cd $pkgname
  install -Dm644 debian/encode.desktop "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
  install -Dm644 qml/img/encode.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm755 encode "$pkgdir/usr/bin/${pkgname%-git}"

  install -dm755       "$pkgdir/usr/share/${pkgname%-git}/qml/img"
  cp -a ./*.py ./*.qml "$pkgdir/usr/share/${pkgname%-git}"
  cp -a qml/*.qml      "$pkgdir/usr/share/${pkgname%-git}/qml"
  cp -a qml/img/*.png  "$pkgdir/usr/share/${pkgname%-git}/qml/img"
}

