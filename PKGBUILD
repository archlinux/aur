_name=ktextwidgets
pkgname=${_name}-light
pkgver=5.103.0
pkgrel=1
pkgdesc='Advanced text editing widgets (stripped from unnecessary dependencies)'
arch=('x86_64')
url='https://community.kde.org/Frameworks'
license=('LGPL')
depends=('kcompletion' 'kconfigwidgets' 'sonnet')
makedepends=('extra-cmake-modules' 'qt5-tools')
groups=('kf5')

conflicts=("${_name}")
provides=("${_name}")

_snapshot="${_name}-${pkgver}"
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/${_snapshot}.tar.xz"{,.sig})

sha256sums=(
    '95e029aaae1b80669c9e1b241797645dabf562c5a1ceb68e398d0a06d969b5e7'
    'SKIP'
)

validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>

_disable=(
    'Qt5TextToSpeech'
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
