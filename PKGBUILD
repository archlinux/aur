# Maintainer:  Leon     <leon.tty1 at gmail dot com>
# Contributor: proudzhu <proudzhu.fdu at gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Albert.Zhou <albert.zhou@wiz.cn>

pkgname=wiznote-qt4
pkgver=2.3.3
pkgrel=1
pkgdesc="Opensource cross-platform cloud based note-taking client"
arch=('i686' 'x86_64')
url="http://www.wiznote.com"
license=('GPL3' 'custom')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'crypto++' 'qtwebkit')
# shared clucene/quazip triggers segfault
makedepends=('cmake' 'git' 'boost')
conflicts=('wiznote')
provides=(wiznote=$pkgver)
install=wiznote.install
_wiznote_project_name="WizQTClient"
source=("git+https://github.com/WizTeam/${_wiznote_project_name}.git#branch=v2.3.3")
md5sums=('SKIP')

prepare() {
  rm -f $_wiznote_project_name/share/skins/default/Thumbs.db

  sed -e 's/add_subdirectory(cryptopp)//' \
      -i $_wiznote_project_name/lib/CMakeLists.txt

  sed -e 's/cryptlib/cryptopp/' \
      -i $_wiznote_project_name/src/CMakeLists.txt

  rm -rf build; mkdir build
}

build() {
  cd build

  # qt5 version is unusable
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ../$_wiznote_project_name
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
