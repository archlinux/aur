
pkgname=plasma5support-git
pkgver=5.240.0_r98.ge75d11c
pkgrel=1
pkgdesc='Support components for porting from KF5/Qt5 to KF6/Qt6'
arch=($CARCH)
url='https://invent.kde.org/plasma/plasma5support'
license=(LGPL)
depends=(kconfig-git kcoreaddons-git ki18n-git kio-git kservice-git kxmlgui-git plasma-framework-git)
makedepends=(extra-cmake-modules-git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://invent.kde.org/plasma/plasma5support.git)
md5sums=('SKIP')

pkgver() {
    cd ${pkgname%-git}
    _ver="$(grep -m1 'set(KF_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
    echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir"
    cmake -B build -S "${pkgname%-git}" \
          -DQT_MAJOR_VERSION=6 \
          -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
