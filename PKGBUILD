# $Id: PKGBUILD 208988 2017-01-25 08:21:35Z arojas $
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Mateusz Herych
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>

pkgname=kadu
pkgver=4.3
pkgrel=1
pkgdesc='Qt-based Jabber/XMPP and Gadu-Gadu client'
arch=('i686' 'x86_64')
url='http://www.kadu.net/'
license=('GPL')
depends=('enchant' 'hicolor-icon-theme' 'injeqt' 'libarchive' 'libgadu' 'libmpdclient' 'libotr'
         'libxss' 'qt5-multimedia' 'qt5-script' 'qt5-svg' 'qt5-webkit' 'qt5-x11extras' 'qxmpp')
makedepends=('cmake' 'qt5-tools')
options=('!emptydirs')
source=(http://download.kadu.im/stable/$pkgname-$pkgver.tar.bz2
        gcc7.patch)
md5sums=('011899121ca5a7e653892f29072032e2'
         'bc2c5ad95bc492cefd92964b4dfe24ca')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../gcc7.patch
  sed -i 's/ENCHANT enchant/ENCHANT enchant-2/' plugins/spellchecker/CMakeLists.txt
  sed -i 's/unity_integration//g' Plugins.cmake
  sed -i 's/indicator_docking//g' Plugins.cmake
}

build() {
  mkdir build
  cd build

  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_CXX_STANDARD=14 \
    -DENABLE_TESTS=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" LIBDIR=/usr/lib install
}
