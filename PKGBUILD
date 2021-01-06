# Maintainer: degreeme <suratovvlad@gmail.com>

pkgname=libqdark-git
pkgver=0.5.7.r1.gd582b5d
pkgrel=2
pkgdesc="Plugin for Qt applications. Choose the dark side of the style."
arch=('i686' 'x86_64')
url="http://github.com/suratovvlad/libqdark"
license=('MIT')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("${pkgname%-*}::git+https://github.com/suratovvlad/libqdark.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  git describe --long --tags | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${pkgname%-*}
    git submodule update --init
    patch -d $srcdir/libqdark/src/QDarkStyleSheet -p1 < $srcdir/libqdark/0001_fix_class_names.patch
    patch -d $srcdir/libqdark/src/QDarkStyleSheet_2.1 -p1 < $srcdir/libqdark/0002_QDarkStyleSheet_2_1_Change_naming.patch
}

build() {
    echo ${pwd}
    cd ${pkgname%-*}
    qmake-qt5 libqdark.pro
    make
}

package() {
    cd ${pkgname%-*}
    make INSTALL_ROOT="$pkgdir" install
}