_name=knotifications
pkgname=${_name}-light
pkgver=5.103.0
pkgrel=2
pkgdesc='Abstraction for system notifications (stripped from unnecessary dependencies)'
arch=('x86_64')
url='https://community.kde.org/Frameworks'
license=('LGPL')
depends=('kwindowsystem' 'kconfig' 'kcoreaddons' 'libxtst' 'libdbusmenu-qt5')
makedepends=('extra-cmake-modules' 'qt5-tools')
groups=('kf5')

conflicts=("${_name}")
provides=("${_name}")

_snapshot="${_name}-${pkgver}"
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/${_snapshot}.tar.xz"{,.sig})

sha256sums=(
    '8f3ccd6a0303408fecb1e5d9ceb22cbdbf9b1ceb08a92d32b7167dd5e2a8d936'
    'SKIP'
)

validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>

_disable=(
    'Qt5Qml'
    'Qt5TextToSpeech'
    'Canberra'
)

_disable=("${_disable[@]/#/"-DCMAKE_DISABLE_FIND_PACKAGE_"}")
_disable=("${_disable[@]/%/"=ON"}")

build() {
    cmake -B build -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF \
        -DBUILD_QCH=OFF \
        "${_disable[@]}"

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
}
