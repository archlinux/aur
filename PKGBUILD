# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-filemanager
pkgver=0.8
pkgrel=3
pkgdesc="Cutefish File Manager, simple to use, beautiful, and retain the classic PC interactive design"
arch=('x86_64')
url="https://github.com/cutefishos/filemanager"
license=('GPL-3.0-or-later')
groups=('cutefish')
depends=('fishui' 'kio5' 'solid5')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/filemanager/archive/$pkgver/$pkgname-$pkgver.tar.gz"
         fix-build.patch)
sha512sums=('af3f1caa982c19e14357346d6227034086020977f21b4f06af500d5d92845d142ee530fb151649fd2e7dadbd1837eb13c400968a3b407412baed7044fb60101d'
            'd01169ed902847a30cb6468c153e16876a6c21d795a47a7f530ae503fe79e5a1824214ce08b5ba0451a2c59512677df1e1504f0fd11b44e111ca079789edc667')

prepare() {
  cd filemanager-$pkgver

  # Fix build
  patch -p1 -i ../fix-build.patch

  # Disable layer effect when the Qt Quick software backend is used
  sed -i 's/layer\.enabled: _image\.visible/layer.enabled: GraphicsInfo.api !== GraphicsInfo.Software \&\& _image.visible/
          s/layer\.enabled: true/layer.enabled: GraphicsInfo.api !== GraphicsInfo.Software/' qml/*.qml

  # Use standard icon name
  sed -i 's/QIcon::fromTheme("file-manager")/QIcon::fromTheme("system-file-manager")/' application.cpp
  sed -i 's/file-system-manager/system-file-manager/' qml/FolderPage.qml cutefish-filemanager.desktop
}

build() {
  cmake -G Ninja -B build -S filemanager-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
  cmake --build build --target translations
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
