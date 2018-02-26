# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kdepimlibs4
pkgver=4.14.10
_kdeappver=15.04.3
pkgrel=15
pkgdesc="KDE4 PIM Libraries"
arch=('x86_64')
url='https://projects.kde.org/projects/kde/kdepimlibs'
license=('GPL' 'LGPL')
depends=('kdelibs' 'libakonadi-qt4' 'libical>=3.0.0' 'qjson')
makedepends=('cmake' 'automoc4' 'boost' 'cyrus-sasl' 'akonadi-qt4')
conflicts=('kdepimlibs')
provides=('kdepimlibs')
replaces=('kdepimlibs')
source=("https://download.kde.org/Attic/applications/${_kdeappver}/src/kdepimlibs-${pkgver}.tar.xz"
   kdepimlibs4-bug338658-1.patch::"https://cgit.kde.org/kdepimlibs.git/patch/?id=4429619"
   kdepimlibs4-bug338658-2.patch::"https://cgit.kde.org/kdepimlibs.git/patch/?id=d8b5da7"
   fix-build-with-ical-3.0.diff)
sha1sums=('8db2f59b8a33f4d1bbebfdff8b772d30669c9932'
          '8bebf347baf5a8058b5abac42a5bb417540ade1a'
          'cf33e0350b0384b6bc640ebc1c65fa10650b35ce'
          '33604606832f4489390bdbc0f94ea51bb791fc4b')

prepare() {
  mkdir -p build

# Fix https://bugs.kde.org/show_bug.cgi?id=338658
  cd kdepimlibs-$pkgver
  patch -p1 -i ../kdepimlibs4-bug338658-1.patch
  patch -p1 -i ../kdepimlibs4-bug338658-2.patch

# Don't build gpgme++ 
  sed -e '/gpgme++/d' -e '/qgpgme/d' -i CMakeLists.txt

# Allow for building against libical 3
# With thanks to the Fedora maintainers
  patch -p1 -i ../fix-build-with-ical-3.0.diff
}

build() {
  cd build
  cmake ../kdepimlibs-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

# Conflicts with KF5
  rm -r "$pkgdir"/usr/{bin,share/{akonadi,config.kcfg}}
}
