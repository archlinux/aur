# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=plasma-sdk-tools-git
pkgver=r1384.73c78cf
pkgrel=1
pkgdesc='KDE Plasma tools that were in kde-workspace 4.9'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/sdk/plasma-sdk'
license=('LGPL')
depends=('plasma-framework' 'ktexteditor')
makedepends=('extra-cmake-modules' 'git')
conflicts=('plasmate-tools' 'plasmate' 'plasma-sdk' 'plasma-sdk-tools' 'kdebase-workspace<=4.9.80')
replaces=('plasmate-tools-frameworks-git' 'plasmate-tools-git')
source=('git://anongit.kde.org/plasma-sdk')
md5sums=('SKIP')

pkgver() {
  cd plasma-sdk
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../plasma-sdk \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF \
    -DPLASMATE_BUILD_WITH_KDEVPLATFORM=OFF

  for i in cuttlefish engineexplorer plasmoidviewer; do
    cd $i
    make
    cd ../
  done
}

package() {
  cd build
  for i in cuttlefish engineexplorer plasmoidviewer; do
    cd $i
    make DESTDIR="${pkgdir}" install
    cd ..
  done
}
