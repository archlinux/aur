# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=heaptrack-git
_pkgname=heaptrack
pkgver=1543.c8ed4c5
pkgrel=1
pkgdesc="A heap memory profiler"
arch=('x86_64')
url="https://apps.kde.org/heaptrack/"
license=('LGPL-2.1-or-later')
depends=(boost-libs
         gcc-libs
         glibc
         hicolor-icon-theme
         kcolorscheme
         kconfig
         kconfigwidgets
         kcoreaddons
         kdiagram
         ki18n
         kiconthemes
         kio
         kwidgetsaddons
         libelf
         libunwind
         qt6-base
         qt6-svg
         rustc-demangle
         sh
         threadweaver
         zstd
)
makedepends=(boost
             extra-cmake-modules
             git
             kitemmodels
             ninja
)
provides=('heaptrack')
conflicts=('heaptrack')
source=('heaptrack::git+https://invent.kde.org/sdk/heaptrack.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/heaptrack"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  mkdir -p "$srcdir/build"
}

build() {
  cmake -B build -S $_pkgname \
   -G Ninja \
   -DCMAKE_INSTALL_PREFIX=/usr \
   -DBUILD_TESTING=OFF \
   -DHEAPTRACK_USE_QT6=ON \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
