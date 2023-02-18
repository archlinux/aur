_name=dolphin
pkgname=${_name}-light
pkgver=22.12.2
pkgrel=4
pkgdesc='KDE File Manager (stripped from unnecessary dependencies)'
arch=('x86_64')
url='https://apps.kde.org/dolphin/'
license=(LGPL)
groups=('kde-applications' 'kde-system')
conflicts=("${_name}")
provides=("${_name}")
depends=('knewstuff' 'kcmutils' 'kparts' 'kconfig' 'kcoreaddons' 'kwindowsystem' 'phonon-qt5')
makedepends=('extra-cmake-modules')

optdepends=(
    'kio-extras: extra protocols support (sftp, fish and more)'
    'kio-fuse: to mount remote filesystems via FUSE'
    'kde-cli-tools: for editing file type options'
    'ffmpegthumbs: video thumbnails'
    'kdegraphics-thumbnailers: PDF and PS thumbnails'
    'konsole: terminal panel'
    'purpose: share context menu'
)

_snapshot="${_name}-${pkgver}"
source=("https://download.kde.org/stable/release-service/${pkgver}/src/${_snapshot}.tar.xz"{,.sig})

sha256sums=(
    'e0e1cfd10e76f95db62c2c0b02df9ba99020d0f18786ca90fb47c377f9de573e'
    'SKIP'
)

validpgpkeys=(
    'CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7' # Albert Astals Cid <aacid@kde.org>
    'F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87' # Christoph Feck <cfeck@kde.org>
    'D81C0CB38EB725EF6691C385BB463350D6EF31EF' # Heiko Becker <heiko.becker@kde.org>
)

options=('!docs')

_disable=(
    'KUserFeedback'
    'KF5Activities'
    'KF5DocTools'
    'PackageKitQt5'
    'KF5Baloo'
    'KF5BalooWidgets'
    'KF5FileMetaData'
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
