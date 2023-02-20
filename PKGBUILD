_name=spectacle
pkgname=${_name}-light
pkgver=22.12.2
pkgrel=1
pkgdesc='KDE screenshot capture utility (stripped from unnecessary dependencies)'
arch=('x86_64')
url='https://apps.kde.org/spectacle/'
license=('GPL')
depends=('xcb-util-cursor' 'knewstuff' 'kwayland' 'qt5-tools' 'kimageannotator')
makedepends=('extra-cmake-modules')
groups=('kde-applications' 'kde-graphics')
provides=("${_name}")
conflicts=("${_name}")

_snapshot="${_name}-${pkgver}"
source=("https://download.kde.org/stable/release-service/${pkgver}/src/${_snapshot}.tar.xz"{,.sig})

sha256sums=(
    '1295d1914b4bf313d2d00ffb5a82e808b111069aae52e999452a901c351f5fbf'
    'SKIP'
)

validpgpkeys=(
    'CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7' # Albert Astals Cid <aacid@kde.org>
    'F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87' # Christoph Feck <cfeck@kde.org>
    'D81C0CB38EB725EF6691C385BB463350D6EF31EF' # Heiko Becker <heiko.becker@kde.org>
)

options=('!docs')

_disable=(
    'KF5DocTools'
    'KF5Purpose'
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
