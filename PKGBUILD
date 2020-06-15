# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: farseerfc <farseerfc@gmail.com>
# Contributor: nylocx <just18@gmx.de>
# Contributor: Llumex03 <l.lumex03@gmail.com>
# Original uploader in CCR: FranzMari
# Original uploader in AUR: á¸¶á¸·umex03

_fragment="#commit=c8a34b0"
pkgname=libqtelegram-ae
epoch=3
pkgver=10.0.0+72+gc8a34b0
pkgrel=2
pkgdesc="Telegram library written in Qt based on telegram-cli code"
arch=('x86_64')
license=('GPL3')
url="https://launchpad.net/libqtelegram"
depends=('qt5-base' 'qt5-multimedia' 'openssl-1.0')
makedepends=('cmake' 'git')
source=("$pkgname::git+https://github.com/Aseman-Land/libqtelegram-aseman-edition.git$_fragment"
        "libqtelegram-code-generator::git+https://github.com/Aseman-Land/libqtelegram-code-generator.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/\1/;s/-/+/g;s/.stable//g;s/v//g'
}

prepare() {
  cd $pkgname
  git config submodule.libqtelegram-code-generator.url "${srcdir}"/libqtelegram-code-generator
  git submodule update --init --recursive --remote
}

build() {
  cd $pkgname
  set -x
  mkdir -p build{,.init}
  cd build.init
  qmake-qt5 -r ../libqtelegram-code-generator
  make
  ./libqtelegram-generator 68 "$srcdir"/$pkgname/scheme/scheme-68.tl ..
  cd ../telegram
  chmod 644 -- */*.cpp
  chmod 644 -- */*.h
  cd ../build
  export CXXFLAGS+=" -Wno-narrowing"
  qmake-qt5 -r OPENSSL_INCLUDE_PATH=/usr/include/openssl-1.0 PREFIX=/usr INSTALL_LIBS_PREFIX=/usr/lib INSTALL_HEADERS_PREFIX=/usr/include QMAKE_CFLAGS_ISYSTEM= CONFIG+=typeobjects ..
  make
}

package() {
  cd $pkgname/build
  make INSTALL_ROOT="$pkgdir" install
}
