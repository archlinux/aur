# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: farseerfc <farseerfc@gmail.com>
# Contributor: nylocx <just18@gmx.de>
# Contributor: Llumex03 <l.lumex03@gmail.com>
# Original uploader in CCR: FranzMari
# Original uploader in AUR: á¸¶á¸·umex03

pkgname=libqtelegram-ae
_pkgname=libqtelegram-aseman-edition
epoch=3
pkgver=10.0.0+72+gc8a34b0
pkgrel=1
pkgdesc="Telegram library written in Qt based on telegram-cli code"
arch=('x86_64')
license=('GPL3')
url="https://launchpad.net/libqtelegram"
depends=('qt5-base' 'qt5-multimedia')
makedepends=('cmake' 'git')
source=("$pkgname"::"git+https://github.com/Aseman-Land/libqtelegram-aseman-edition.git#commit=c8a34b0"
        libqtelegram-code-generator::git+https://github.com/Aseman-Land/libqtelegram-code-generator.git)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/\1/;s/-/+/g' | sed 's/.stable//g' | sed 's/v//g'
}

prepare() {
  cd $pkgname
  mkdir -p build{,.init}
  mv ../libqtelegram-code-generator .
  cd build.init
  qmake-qt5 -r ../libqtelegram-code-generator
  make
  ./libqtelegram-generator 68 ../scheme/scheme-68.tl ..
  cd ../telegram
  chmod 644 */*.cpp
  chmod 644 */*.h
}

build() {
  cd $pkgname/build
  qmake-qt5 -r PREFIX=/usr INSTALL_LIBS_PREFIX=/usr/lib INSTALL_HEADERS_PREFIX=/usr/include QMAKE_CFLAGS_ISYSTEM= CONFIG+=typeobjects ..
  make
}

package() {
  cd $pkgname/build
  make INSTALL_ROOT="$pkgdir" install
}
