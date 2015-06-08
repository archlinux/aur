# Maintainer: Antonio Rojas

pkgbase=telepathy-morse-git
pkgname=('telepathy-morse-qt4-git' 'telepathy-morse-git')
pkgver=r47.e8dd644
pkgrel=1
pkgdesc="Telepathy Connection Manager for the Telegram network"
arch=('i686' 'x86_64')
url="https://github.com/Kaffeine/telepathy-morse/"
license=('GPL')
makedepends=('cmake' 'git' 'telegram-qt4-git' 'telegram-qt5-git' 'telepathy-qt4' 'telepathy-qt5')
source=("git+https://github.com/Kaffeine/telepathy-morse/")
md5sums=('SKIP')

pkgver() {
  cd telepathy-morse
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build{4,}

  sed -i 's|CTelegramCore.hpp|TelegramQt/CTelegramCore.hpp|' telepathy-morse/textchannel.hpp
}

build() {
  pushd build4
  cmake ../telepathy-morse \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/telepathy \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_QT4=ON
  popd

  pushd build
  cmake ../telepathy-morse \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/telepathy \
    -DCMAKE_BUILD_TYPE=Release
  popd

}

package_telepathy-morse-qt4-git() {
  depends=('telepathy-qt4')

  cd build4
  make DESTDIR="$pkgdir" install
}

 
package_telepathy-morse-git() {
  depends=('telepathy-qt5')

  cd build
  make DESTDIR="$pkgdir" install
}

