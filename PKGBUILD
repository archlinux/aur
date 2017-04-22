# Maintainer: Dimitrios Misdanitis <d.misdanitis@gmail.com>

pkgname=yakuake-sp-git
pkgver=v3.0.3.g778bd25.focusfix
pkgrel=1
pkgdesc="A drop-down terminal emulator based on KDE Konsole technology. (GIT version with wrong split focus patch)"
arch=('i686' 'x86_64')
url='https://www.kde.org/applications/system/yakuake'
license=('GPL')
depends=('knewstuff'
         'konsole'
         'kwayland'
         'hicolor-icon-theme'
         )
makedepends=('extra-cmake-modules'
             'git'
             'python'
             )
conflicts=('yakuake')
provides=('yakuake')
source=('git://anongit.kde.org/yakuake.git')
sha1sums=('SKIP')

pkgver() {
  cd yakuake
  echo "$(git describe --long --tags | tr - .).focusfix"
}

prepare() {
  cd ${srcdir}/yakuake
  patch -p1 <../../0001-focus-fix.patch
  cd ${srcdir}
  mkdir -p build
}

build() {
  cd build
  cmake ../yakuake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
