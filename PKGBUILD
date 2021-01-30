# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Mateusz Herych
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>

pkgname=kadu
pkgver=4.3
pkgrel=3
pkgdesc='Qt-based Jabber/XMPP and Gadu-Gadu client'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/kadu/'
license=('GPL')
depends=('enchant' 'hicolor-icon-theme' 'injeqt' 'libarchive' 'libgadu' 'libmpdclient' 'libotr'
         'libxss' 'qt5-multimedia' 'qt5-script' 'qt5-svg' 'qt5-webkit' 'qt5-x11extras' 'qxmpp')
makedepends=('cmake' 'qt5-tools')
options=('!emptydirs')
source=("https://downloads.sourceforge.net/sourceforge/kadu/${pkgname}-${pkgver}.tar.bz2"
        "gcc7.patch"
	"kadu-4.3-find-x11-with-newer-cmake-modules.patch"
	"qcompare_qpainter.patch")
sha256sums=('ad5d1cbb908c3cd07f2955d343d44b993cd5639427a48a2912441955cfd2bd6e'
            '44314715021666a7221460cea2400db0c1cc1d93dcb220738434d8a472924172'
	    '997cacdf023dd4516cd7bf829e5732b42d0e2939e4119a85a2b73ed869138100'
	    '066f19cf32dc9dfeb01db5d734494830e6811bbcbadff8c2c4a9db34372a7ffe')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../gcc7.patch
  patch -Np1 -i ../qcompare_qpainter.patch
  patch -Np1 -i ../kadu-4.3-find-x11-with-newer-cmake-modules.patch
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
