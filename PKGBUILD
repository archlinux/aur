# Maintainer: Volodymyr Zolotopupov <zvova7890@gmail.com>

pkgname=ksysguard6-git
pkgver=6.0.1
pkgrel=2
pkgdesc='Track and control the processes running in your system. KF6 version'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(gcc-libs
         glibc
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kdbusaddons
         ki18n
         kiconthemes
         kio
         knewstuff
         knotifications
         ksystemstats
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         libksysguard
         lm_sensors
         qt6-base
         zlib)
makedepends=(extra-cmake-modules
             kdoctools)
source=(git+https://invent.kde.org/vvova/ksysguard.git#branch=kf6)
sha256sums=('SKIP')

prepare() {
  cd ksysguard
  # I have no clue how to commit locales into KDE's git, so...
  sed -i s/\&kmenu/kmenu/g po/de/docs/ksysguard/index.docbook
  sed -i s/\&kmenu/kmenu/g po/pt/docs/ksysguard/index.docbook

  sed -i -e 's/#add_subdirectory( doc )/add_subdirectory( doc )/g;
             s/#kdoctools_install(po)/kdoctools_install(po)/g' \
             CMakeLists.txt
}

build() {
  cmake -B build -S ksysguard \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
