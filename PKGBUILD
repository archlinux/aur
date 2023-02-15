_name=knewstuff
pkgname=${_name}-light
pkgver=5.103.0
pkgrel=1
pkgdesc='Support for downloading application assets from the network (stripped from unnecessary dependencies)'
arch=('x86_64')
url='https://community.kde.org/Frameworks'
license=('LGPL')
groups=('kf5')
conflicts=("${_name}")
provides=("${_name}")
depends=('kio' 'kpackage' 'attica' 'kconfig' 'kcoreaddons')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-declarative')
optdepends=('kirigami2: QML components')

_snapshot="${_name}-${pkgver}"
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/${_snapshot}.tar.xz"{,.sig})

sha256sums=(
    '46ba797c01fa258585968c5cad0051323cc24b7cc794714fefd7a79c1deab78e'
    'SKIP'
)

validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>
options=('!docs')

_disable=(
    'KF5Syndication'
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
