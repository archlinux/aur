# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-roi-ui
pkgver=1.1.1
pkgrel=3
pkgdesc="Region of Interest Editor for OBS Studio 30.1+"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/encoder-region-of-interest-editor.1904/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=30.1" "glibc" "gcc-libs" "ffmpeg" "qt6-base>=6.10")
makedepends=("cmake" "git")
options=("debug")
source=("$pkgname::git+https://github.com/derrod/$pkgname#tag=$pkgver")
sha256sums=("SKIP")

prepare() {
  cd $pkgname

  sed -i '33 a #include <obs-nix-platform.h>\n#include <qpa/qplatformnativeinterface.h>' src/external/qt-wrappers.cpp
  sed -i 's/find_qt(/find_package(Qt6 REQUIRED /g' CMakeLists.txt
  sed -i '16 a find_package(Qt6GuiPrivate REQUIRED)' CMakeLists.txt
  sed -i 's/Qt::Widgets/Qt::Widgets Qt::GuiPrivate/g' CMakeLists.txt

  sed -i 's|obs_sceneitem_get_id(item)|QVariant::fromValue(obs_sceneitem_get_id(item))|g' src/roi-editor.cpp
  sed -i 's|findData(data.scene_item_id)|findData(QVariant::fromValue(data.scene_item_id))|g' src/roi-editor.cpp
  sed -i 's|1LL|1L|g' src/roi-editor.cpp

  sed -i '12 a #include <thread>\n#include <condition_variable>' src/encoder-preview.hpp
}

build() {
  cmake -B build -S "$pkgname" \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DQT_VERSION=6 \
  -DCMAKE_CXX_FLAGS="-Wno-error=deprecated-declarations -Wno-error=conversion -Wno-error=float-conversion -Wno-error=shadow" \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
