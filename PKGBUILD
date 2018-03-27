# Maintainer: Albert Graef <aggraef at gmail.com>

pkgname=faustlive-git
pkgver=2.46.r808.2a7adef
pkgrel=1
epoch=1
pkgdesc="A graphical frontend to the Faust compiler."
arch=('i686' 'x86_64')
url="http://faust.grame.fr/"
license=('GPL')
# Qt5 will work as well, but I found that FaustLive has some issues with it
# (invisible check boxes in some parts of the GUI), so we build against Qt4
# for now. YMMV, though, if you want to use Qt5 instead, replace the
# dependency below and use 'qm=qmake-qt5' in the build command.
depends=('qt4' 'faust' 'jack2' 'qrencode' 'libmicrohttpd' 'openssl' 'liblo' 'curl')
makedepends=('git')
provides=('faustlive')
conflicts=('faustlive')
source=("$pkgname::git+https://github.com/grame-cncm/faustlive.git#branch=dev")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  echo $(cat Resources/distVersion.txt).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $srcdir/$pkgname
  git submodule update --init
}

build() {
  cd $srcdir/$pkgname
  make arch=Linux PREFIX=/usr STATIC=0 NETJACK=1 qm=qmake-qt4
}

package() {
  cd $srcdir/$pkgname
  make install arch=Linux PREFIX=/usr DESTDIR="$pkgdir"
  # docs
  install -d "$pkgdir/usr/share/doc/faustlive"
  install -d "$pkgdir/usr/share/doc/faustlive/FilesToConfigure"
  cp GPL.txt Build/Linux/README.txt Documentation/*.pdf Build/Linux/Distributions/*.pdf "$pkgdir/usr/share/doc/faustlive"
  (cd Build/Linux/Distributions && cp DefaultDSP.dsp DefaultDSP.lib process.svg "$pkgdir/usr/share/doc/faustlive/FilesToConfigure")
}
