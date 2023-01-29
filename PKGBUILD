# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=QPrompt
pkgname=${_pkgname,,}
pkgver=1.1.3
pkgrel=1
arch=('x86_64')
pkgdesc="Teleprompter software for video creators"
url="https://qprompt.app/"
_url="https://github.com/Cuperino/QPrompt"
license=('GPL3' 'LGPL3')
depends=('hicolor-icon-theme' 'kcrash' 'ki18n')
makedepends=('extra-cmake-modules' 'kiconthemes' 'kirigami2' 'ninja')
source=("$_pkgname-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('fcbaf1aa64d6563c3e50d41ea122db65c71ec9be2261cbce9163c01c93dbec6a327934f24fddf32789a627f0a4d3f8c8b606ac63fa87e2c64c1fbd4d24c843e5')

prepare() {
  # Change docs directory to "/usr/share/doc"
  sed -i '/DOC_INSTALL_DIR/ s|"|"share/|' $_pkgname-$pkgver/CMakeLists.txt

  # The "kirigami2" package, used by QPrompt, uses Qt5.
  # For now, we've removed Qt6 references in the CMake script.
  sed -i '/find_package(QT/ s/Qt6 //' $_pkgname-$pkgver/CMakeLists.txt
}

build() {
  cd $_pkgname-$pkgver
  cmake -GNinja \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  ninja -C build/
}

package() {
  cd $_pkgname-$pkgver
  DESTDIR="$pkgdir" ninja -C build/ install
}
