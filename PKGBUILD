# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>
# Contributor: Tajidin Abd <tajidinabd at archlinux dot us>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kgtk-git
pkgver=r35.e586217
pkgrel=1
pkgdesc="A quick-n-dirty hack to make gtk applications use Proper™ file dialogs"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/applications/kgtk'
license=('GPL')
depends=('kio' 'gtk2' 'gtk3')
makedepends=('extra-cmake-modules' 'git')
provides=('kgtk')
conflicts=('kgtk')
source=('git+https://github.com/sandsmark/kgtk.git')
md5sums=('SKIP')

pkgver() {
  cd kgtk
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  BUILD_TYPE=Release
  if [[ " ${OPTIONS[@]} " =~ " debug " ]]; then
    BUILD_TYPE=Debug
  elif [[ " ${OPTIONS[@]} " =~ " !strip " ]]; then
    BUILD_TYPE=RelDebug
  fi
  echo "${BUILD_TYPE}"

  cmake ../kgtk \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
