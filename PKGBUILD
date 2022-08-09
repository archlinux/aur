# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=QPrompt
pkgname=${_pkgname,,}
pkgver=1.1.0
pkgrel=1
arch=('x86_64')
pkgdesc="Teleprompter software for video creators"
url="https://qprompt.app/"
_url="https://github.com/Cuperino/QPrompt"
license=('GPL3' 'LGPL3')
depends=('hicolor-icon-theme' 'kcrash' 'ki18n')
makedepends=('extra-cmake-modules' 'kiconthemes' 'kirigami2' 'ninja')
source=("$_pkgname-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ea2972c31f40b9712a572231a7b5e7e9106746cc64cec9db9dcc79f012609380dd19eb7b75c85204bac952c5da3fb9cb5fe0699023030b0b9201e07288852720')

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
