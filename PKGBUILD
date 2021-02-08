# Maintainer: pvg <pvg@poczta.fm>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Mateusz Herych
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>

_name=kadu
_commit=c2007766
pkgname=$_name-git
pkgver=20170821
pkgrel=2
pkgdesc='Qt-based Jabber/XMPP and Gadu-Gadu client'
arch=('i686' 'x86_64')
url='https://gitlab.com/kadu/kadu'
license=('GPL')
depends=('enchant' 'boost' 'hicolor-icon-theme' 'injeqt' 'libarchive' 'libgadu' 'libmpdclient' 'libotr'
         'libxss' 'qt5-multimedia' 'qt5-script' 'qt5-svg' 'qt5-webkit' 'qt5-x11extras' 'qxmpp')
makedepends=('cmake' 'qt5-tools')
provides=('kadu')
conflicts=('kadu')
options=('!emptydirs')
source=("$pkgname::git+https://gitlab.com/kadu/kadu.git#commit=$_commit"
	        "kadu-find-x11-with-newer-cmake-modules.patch"
          "qcompare_and_qpainter.patch"
          "history_sql.patch")
sha256sums=('SKIP'
	    '997cacdf023dd4516cd7bf829e5732b42d0e2939e4119a85a2b73ed869138100'
	    '309319930594040f876f7565a3e879c38c06eb35713c92ee176b6c15d9e30e83'
      '6868f032d6beeca686f4f978a268f136acfc5385a3e8a379471c97f1b852ef2b')

prepare() {
  cd $pkgname
  patch -Np1 -i ../qcompare_and_qpainter.patch
  patch -Np1 -i ../kadu-find-x11-with-newer-cmake-modules.patch
  patch -Np1 -i ../history_sql.patch
  sed -i 's/ENCHANT enchant/ENCHANT enchant-2/' plugins/spellchecker/CMakeLists.txt
  sed -i 's/unity_integration//g' Plugins.cmake
  sed -i 's/indicator_docking//g' Plugins.cmake
}

build() {
  mkdir build
  cd build

  cmake ../$pkgname \
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
