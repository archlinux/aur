# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=qtutilities
_cfg=qt6
pkgname=qtutilities-$_cfg
_name=${pkgname%-$_cfg}
pkgver=6.12.0
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='Common Qt related C++ classes and routines used by my applications such as dialogs, widgets and models (using Qt 6)'
license=('GPL')
depends=('libc++utilities.so' 'qt6-base')
makedepends=('cmake' 'ninja' 'qt6-tools' 'qt6-declarative' 'clang' 'mesa')
optdepends=("$_name-doc: API documentation")
provides=(libqtutilities-qt6.so)
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('d3b8bc68c82d195cfeb4aa8d599c020774322aea7faebf5243e139088d89a82c')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCONFIGURATION_NAME:STRING="$_cfg" \
    -DCONFIGURATION_DISPLAY_NAME="Qt 6" \
    -DCONFIGURATION_TARGET_SUFFIX:STRING="$_cfg" \
    -DQT_PACKAGE_PREFIX:STRING='Qt6' \
    -DBUILTIN_TRANSLATIONS:BOOL=ON \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    .
  ninja
}

check() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  QT_QPA_PLATFORM=offscreen ninja check
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  DESTDIR="${pkgdir}" ninja install
}
