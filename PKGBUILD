# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=QPrompt
pkgname=${_pkgname,,}
pkgver=1.1.2
pkgrel=1
arch=('x86_64')
pkgdesc="Teleprompter software for video creators"
url="https://qprompt.app/"
_url="https://github.com/Cuperino/QPrompt"
license=('GPL3' 'LGPL3')
depends=('hicolor-icon-theme' 'kcrash' 'ki18n')
makedepends=('extra-cmake-modules' 'kiconthemes' 'kirigami2' 'ninja')
source=("$_pkgname-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('64ff5c0cd7386dc4eeec61d9f49b5c198c694a309007b021cf076e4da0c30527f6a9608344ebc6dadb30dcdfcea7c6f3d821e139213ee1bfafa6c898861f2ee8')

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
