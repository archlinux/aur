pkgname=pamac-qt-git
pkgver=r80.f23e1c8.2019.07.31
pkgrel=1
pkgdesc="A Qt5 frontend for libpamac - git version"
arch=('i686' 'x86_64')
url="https://gitlab.manjaro.org/applications/pamac-qt"
license=('GPL3')
depends=('pamac-cli' 'pamac-common' 'qt5-base>=5.12.0' 'qt5-quickcontrols2' 'qt5-quickcontrols' 'qt5-graphicaleffects' 'breeze-icons')
makedepends=('git')
replaces=('pamac-qt')
conflicts=('pamac-qt')
options=(!emptydirs)
source=("${pkgname%-*}::git+$url" "pamac-qt.desktop")
sha256sums=('SKIP'
            'cf812140e172fafd83dd662dada06e77ce4e14cc04f38216c23c32dace63cc45')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  printf "r%s.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" "$(date +%Y.%m.%d)"
}

prepare() {
  cd pamac-qt
  sed -i -e "s/VERSION/\"$_ver\"/" app/src/cpp/src/main.cpp
  cd ..

  mkdir -p build
}

build() {
  cd build
  cmake -DVERSION="$_ver" -DCMAKE_INSTALL_PREFIX="/usr" ../pamac-qt
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/usr/bin/pamac-qt-app "${pkgdir}"/usr/bin/pamac-qt
  mkdir -p "${pkgdir}"/usr/share/applications
  install ../pamac-qt.desktop "${pkgdir}"/usr/share/applications/pamac-qt.desktop
}

