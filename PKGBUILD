# Merged with official ABS okular PKGBUILD by João, 2021/04/30 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Alex Talker

pkgname=okular-git
pkgver=24.04.70_r10609.gd01acce2
pkgrel=1
pkgdesc='Document Viewer'
arch=($CARCH)
url="https://kde.org/applications/graphics/okular/"
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(discount djvulibre freetype2 gcc-libs glibc plasma-activities karchive kbookmarks
         kcolorscheme kcompletion kconfig kconfigwidgets kcoreaddons kcrash ki18n kio
         kitemviews kparts kpty ktextwidgets kwallet kwidgetsaddons kwindowsystem kxmlgui libjpeg-turbo libkexiv2
         libspectre libtiff phonon-qt6 poppler-qt6 purpose qt6-base qt6-declarative qt6-speech
         qt6-svg threadweaver zlib)
makedepends=(git ebook-tools extra-cmake-modules kdegraphics-mobipocket kdoctools)
groups=(kde-applications-git kde-graphics-git)
optdepends=('calligra: ODT and ODP support'
            'ebook-tools: mobi and epub support'
            'kdegraphics-mobipocket-git: mobi support'
            'unarchiver: Comic Book Archive support (alternative)'
            'unrar: Comic Book Archive support')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _major_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MAJOR' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MINOR' CMakeLists.txt | cut -d '"' -f2)"
  _micro_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MICRO' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_micro_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
