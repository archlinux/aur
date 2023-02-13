_name=prison
pkgname=${_name}-light
pkgver=5.103.0
pkgrel=1
pkgdesc='A barcode API to produce QRCode barcodes and DataMatrix barcodes (stripped from unnecessary dependencies)'
arch=('x86_64')
url='https://community.kde.org/Frameworks'
license=('GPL')
depends=('qrencode')
makedepends=('extra-cmake-modules' 'qt5-tools')
conflicts=("${_name}")
provides=("${_name}")
groups=('kf5')

_snapshot="${_name}-${pkgver}"
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/${_snapshot}.tar.xz"{,.sig})

sha256sums=(
    '44c5f902fac041e6aeb2baa6f26a1b58b3531d500f40e0411e171d3607b0f288'
    'SKIP'
)

validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>

_disable=(
    'Qt5Quick'
    'Qt5Multimedia'
    'Dmtx'
    'ZXing'
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
