# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=QPrompt-Teleprompter
pkgname=${_pkgname,,} ; pkgname=${pkgname%-*}
pkgver=1.1.6
pkgrel=2
arch=('x86_64')
pkgdesc="Teleprompter software for video creators"
url="https://qprompt.app/"
_url_github="https://github.com/Cuperino/${_pkgname}"
license=('GPL-3.0-only')
depends=('hicolor-icon-theme' 'kcrash5' 'ki18n5')
makedepends=('extra-cmake-modules' 'kiconthemes5' 'kirigami2' 'ninja')
source=("$_pkgname-$pkgver.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('fd5b2946e5f5abe48c9b7d0a681caee6673963c62b3d4f43337d40ecadc21940bb05a5f2dc81d818f323a9aab5f080e9d0a580a1edcae7fca47acc1a7f38687d')

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
