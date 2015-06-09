# $Id: PKGBUILD 130460 2015-04-01 07:57:08Z fyan $
# Maintainer: proudzhu <proudzhu.fdu at gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Albert.Zhou <albert.zhou@wiz.cn>

pkgname=wiznote-git
pkgver=2.1.0.r1103.g38bce53
pkgrel=1
pkgdesc="Opensource cross-platform cloud based note-taking client"
arch=('i686' 'x86_64')
url="http://www.wiznote.com"
license=('GPL3' 'custom')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'qt5-base' 'qt5-webkit' 'crypto++') # indirect: zlib glic gcc-libs
# shared clucene/quazip triggers segfault
makedepends=('cmake' 'git' 'boost')
conflicts=('wiznote')
provides=('wiznote')
install=wiznote.install
_wiznote_project_name="WizQTClient"
source=("git+https://github.com/WizTeam/${_wiznote_project_name}.git")
md5sums=('SKIP')

pkgver() {
  cd $_wiznote_project_name
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  rm $_wiznote_project_name/share/skins/default/Thumbs.db

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
    -DWIZNOTE_USE_QT5=YES \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ../$_wiznote_project_name
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
