_name=kio-extras
pkgname=${_name}-light
pkgver=22.12.2
pkgrel=1
pkgdesc='Additional components to increase the functionality of KIO (stripped from unnecessary dependencies)'
arch=('x86_64')
url='https://www.kde.org/'
license=('LGPL')
groups=('kde-applications' 'kde-network')
conflicts=("${_name}")
provides=("${_name}")

depends=('kio' 'kdnssd' 'syntax-highlighting' 'shared-mime-info')

makedepends=(
    'extra-cmake-modules' 'kdoctools'
    'libtirpc' 'libssh' 'libmtp' 'gperf'
    'smbclient' 'kdsoap-ws-discovery-client'
    'libappimage' 'openexr' 'libxcursor'
    'taglib' 'phonon-qt5'
)

optdepends=(
    'libssh: SFTP support'
    'libmtp: MTP support'
    'libtirpc: NFS support'
    'smbclient: SMB support'
    'perl: info nodes support'
    'gperf: man support'
    'qt5-imageformats: thumbnails for additional image formats'
    'kimageformats: thumbnails for additional image formats'
    'libappimage: AppImage thumbnails'
    'icoutils: Windows executable thumbnails'
    'openexr: EXR format thumbnails'
    'libxcursor: XCursor thumbnails'
    'taglib: audio file thumbnails'
    'phonon-qt5: audio preview plugin'
)

_snapshot="${_name}-${pkgver}"
source=("https://download.kde.org/stable/release-service/${pkgver}/src/${_snapshot}.tar.xz"{,.sig})

sha256sums=(
    'ca06d0177933959586526e08edb117d90a9eea101f98184f810304e7209f4090'
    'SKIP'
)

validpgpkeys=(
    'CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7' # Albert Astals Cid <aacid@kde.org>
    'F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87' # Christoph Feck <cfeck@kde.org>
    'D81C0CB38EB725EF6691C385BB463350D6EF31EF' # Heiko Becker <heiko.becker@kde.org>
)

options=('!docs')

prepare() {
    rm -r "${_snapshot}/po/"*"/docs"
}

_disable=(
    'Qt5Test'
    'KF5Activities'
    'KF5ActivitiesStats'
    'Qt5Sql'
    'KF5KExiv2'
)

_disable=("${_disable[@]/#/"-DCMAKE_DISABLE_FIND_PACKAGE_"}")
_disable=("${_disable[@]/%/"=ON"}")

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DBUILD_TESTING=OFF \
        -DDISABLE_ALL_OPTIONAL_SUBDIRECTORIES=ON \
        -DLIBAPPIMAGE_LIBRARIES=libappimage.so \
        "${_disable[@]}"

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
}
