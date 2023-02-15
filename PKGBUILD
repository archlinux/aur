_name=krunner
pkgname=${_name}-light
pkgver=5.103.0
pkgrel=1
pkgdesc='Framework for providing different actions given a string query (stripped from unnecessary dependencies)'
arch=('x86_64')
url='https://community.kde.org/Frameworks'
license=('LGPL')
groups=('kf5')
conflicts=("${_name}")
provides=("${_name}")
depends=('plasma-framework' 'threadweaver' 'kconfig' 'kcoreaddons' 'kwindowsystem' 'milou')
makedepends=('extra-cmake-modules' 'qt5-tools')

_snapshot="${_name}-${pkgver}"
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/${_snapshot}.tar.xz"{,.sig})

sha256sums=(
    '05e89ea5f996caf8bc7df13f340eb33066edb98b29c8e367ede261eacc15ca72'
    'SKIP'
)

validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>
options=('!docs')

_disable=(
    'KF5Activities'
)

_disable=("${_disable[@]/#/"-DCMAKE_DISABLE_FIND_PACKAGE_"}")
_disable=("${_disable[@]/%/"=ON"}")

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF \
        -DBUILD_QCH=OFF \
        "${_disable[@]}"

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
}
