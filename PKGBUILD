# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=qtcam-git
pkgver=c4ce3eb8
pkgrel=1
pkgdesc='a free, Open Source Linux Webcamera Software with more than 10 image control settings'
arch=('i686' 'x86_64')
url='http://www.e-consystems.com/opensource-linux-webcam-software-application.asp'
license=('GPL')
depends=(qt5-declarative ffmpeg)
if [[ $CARCH = x86_64 ]]; then
  depends+=(gcc-libs-multilib)
fi
makedepends=(git qtchooser)
source=('git://github.com/econsysqtcam/qtcam.git'
codecid.patch
qml.patch
project.patch
)
_gitname='qtcam'
md5sums=('SKIP'
         '5e4a675763c997834e417011b37d7280'
         'eb9f2e07d33c885888865ed80266d593'
         '8fc48b5c9f69a62a43d638df2195a02a')
prepare() {
  cd "$srcdir"/$_gitname
  patch -p1 -i "$srcdir"/codecid.patch
  patch -p1 -i "$srcdir"/qml.patch
  patch -p1 -i "$srcdir"/project.patch
}
pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    git describe --always | sed 's|-|.|g'
  fi
}
build(){
  cd "$srcdir"/$_gitname/src
  msg2 "Starting make"

  qmake
  make
}
package(){
  cd "$srcdir"/$_gitname/src
  msg2 "Starting make install"
  make INSTALL_ROOT="$pkgdir" install
  install -dm755 "$pkgdir"/usr/share/qtcam/qml
  mv "$pkgdir"/usr/bin/qtcam/* "$pkgdir"/usr/share/qtcam/qml/
  rmdir "$pkgdir"/usr/bin/qtcam
}
