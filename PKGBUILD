# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=qtcam-git
pkgver=r10.34326dc8
pkgrel=1
pkgdesc='A free, Open Source Linux Webcamera Software with more than 10 image control settings'
arch=('i686' 'x86_64')
url='http://www.e-consystems.com/opensource-linux-webcam-software-application.asp'
license=('GPL')
depends=(
qt5-declarative
ffmpeg
libusb
)
if [[ $CARCH = x86_64 ]]; then
  depends+=(gcc-libs-multilib)
fi
makedepends=(
git
qtchooser
)
source=(
'git://github.com/econsysqtcam/qtcam.git'
codecid.patch
qml.patch
project.patch
qtcam.desktop
)
sha256sums=('SKIP'
            'b980cc36f0af3aa111eada5f311a689c480cde8d6e9cd19ba9d121fab9d3c420'
            'be3a4790936b2f1d4d0015c565a69428a99c2e455f1e1febc694b039370efddc'
            '82293ff09cd283b1458c16e0c60ab7ee77d2691d662adedee0b29a90079ccf3c'
            'e185af699a218115b5b2b3223d6989e5abcb56293f3e19c4e57308a460c86834')
_gitname='qtcam'
prepare() {
  cd $_gitname
  patch -p1 -i "$srcdir/codecid.patch"
  patch -p1 -i "$srcdir/qml.patch"
  patch -p1 -i "$srcdir/project.patch"
}
pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd $_gitname/src
  qmake
  make
}
package() {
  cd $_gitname/src
  make INSTALL_ROOT="$pkgdir" install
  install -dm755 "$pkgdir"/usr/share/qtcam/qml
  install -Dm644 "$srcdir"/qtcam.desktop "$pkgdir"/usr/share/applications/qtcam.desktop
  install -Dm644 "$srcdir"/qtcam/src/qtcam/icon/images/icon.jpg "$pkgdir"/usr/share/pixmaps/qtcam.jpg
  mv "$pkgdir"/usr/bin/qtcam/* "$pkgdir"/usr/share/qtcam/qml/
  rmdir "$pkgdir"/usr/bin/qtcam
}
