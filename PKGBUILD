# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=kfloppy
pkgver=23.04.3
pkgrel=1
pkgdesc='Utility that provides a straightforward graphical means to format 3.5" and 5.25" floppy disks'
arch=(x86_64)
url='https://apps.kde.org/kfloppy/'
license=(GPL-2.0-only)
depends=(
  dosfstools
  e2fsprogs
  gcc-libs
  glibc
  hicolor-icon-theme
  kcompletion
  kconfig
  kconfigwidgets
  kcoreaddons
  kcrash
  ki18n
  kwidgetsaddons
  kxmlgui
  qt6-5compat
  qt6-base
)
makedepends=(
  cmake
  extra-cmake-modules
  git
  kdoctools
  ninja
)
source=(
  "git+https://invent.kde.org/utilities/kfloppy.git?signed#tag=v$pkgver"
  kfloppy-window-icon.patch
  kfloppy-fix-crash.patch
)
b2sums=(
  677dfc433bc2281ab5ee765a966ce655ef11ca15396a406fee19033f8d2eac222ee5aaa720f0c19a54aef6fcb96076f8464c42c7055412ec404336798b3b40ff
  52362f7e7e5e4feb7bf227eadd5497d1fa80f9eccf5d946285e6914e5348117fad7b5256644fe74b54df54d6ef583bb074f863bc02b2a44cabcc1203b47b3856
  1f4f38e8fa8aab9b8f72eff4b3fb2d651eba376f6953f49ffdd486dc7481097e7cb022d2ebf927839fcde7a5e9baf1fdf91813de290facd4d602ced29088e8b3
)
validpgpkeys=(D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
  cd $pkgname

  # Fix build with Qt6
  git cherry-pick -n 13dfd92dcf0a0327f18652fcf69191a8b8fb3a90
  git cherry-pick -n 35d2668feda9428315d7930f8ab1ce054e419da6

  # Set window icon
  # https://invent.kde.org/utilities/kfloppy/-/merge_requests/12
  git apply -3 ../kfloppy-window-icon.patch

  # Fix crash on quit
  # https://invent.kde.org/utilities/kfloppy/-/merge_requests/13
  git apply -3 ../kfloppy-fix-crash.patch
}

build() {
  cmake -S $pkgname -B build -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_WITH_QT6=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
