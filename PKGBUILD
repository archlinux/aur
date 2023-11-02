# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=QPrompt
pkgname=${_pkgname,,}
pkgver=1.1.6
pkgrel=2
arch=('x86_64')
pkgdesc="Teleprompter software for video creators"
url="https://qprompt.app/"
_url="https://github.com/Cuperino/QPrompt"
license=('GPL3' 'LGPL3')
depends=('hicolor-icon-theme' 'kcrash5' 'ki18n5')
makedepends=('extra-cmake-modules' 'kiconthemes5' 'kirigami2' 'ninja')
source=("$_pkgname-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ba2003b803209f38e59ac97f19b33e01fa61bf6fb9a4ed625ea16396063361c5d4edfaa1439ae812071275b053dedbfe0d152a70f2bb7ffcc8c7b9d65b10b936')

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
