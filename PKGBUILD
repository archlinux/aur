_name=gwenview
pkgname=${_name}-light
pkgver=22.12.2
pkgrel=4
pkgdesc='A fast and easy to use image viewer (stripped from unnecessary dependencies)'
url="https://apps.kde.org/${_name}/"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications' 'kde-graphics')
depends=('kparts' 'kitemmodels' 'phonon-qt5' 'kimageannotator')
makedepends=('extra-cmake-modules')

optdepends=(
    'qt5-imageformats: support for tiff, webp, and more image formats'
    'kimageformats: support for dds, xcf, exr, psd, and more image formats'
    'kamera: import pictures from gphoto2 cameras'
)

conflicts=("${_name}")
provides=("${_name}")

_snapshot="${_name}-${pkgver}"
source=("https://download.kde.org/stable/release-service/${pkgver}/src/${_snapshot}.tar.xz"{,.sig})

sha256sums=(
    '7dc1066d03e4b8975109af637929cd391ff2e591b6d3ccc46ac8426b9b7f6fb6'
    'SKIP'
)

validpgpkeys=(
    'CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7' # Albert Astals Cid <aacid@kde.org>
    'F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87' # Christoph Feck <cfeck@kde.org>
    'D81C0CB38EB725EF6691C385BB463350D6EF31EF' # Heiko Becker <heiko.becker@kde.org>
)

options=('!docs' '!emptydirs')

_disable=(
    'KF5Activities'
    'KF5DocTools'
    'KF5Purpose'
    'CFitsio'
    'TIFF'
    'KF5Baloo'
    'KF5KDcraw'
)

_disable=("${_disable[@]/#/"-DCMAKE_DISABLE_FIND_PACKAGE_"}")
_disable=("${_disable[@]/%/"=ON"}")

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF \
        "${_disable[@]}"

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
}
