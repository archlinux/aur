_name=kio
pkgname=${_name}-light
pkgver=5.103.0
pkgrel=4
pkgdesc='Resource and network access abstraction (stripped from unnecessary dependencies)'
arch=('x86_64')
url='https://community.kde.org/Frameworks'
license=('LGPL')
groups=('kf5')
conflicts=("${_name}")
provides=("${_name}")
depends=('solid' 'kjobwidgets' 'kbookmarks' 'libxslt' 'ktextwidgets' 'kservice')
makedepends=('extra-cmake-modules' 'qt5-tools')

optdepends=(
    'kio-extras: extra protocols support (sftp, fish and more)'
    'kio-fuse: to mount remote filesystems via FUSE'
    'kded: proxy management and cookie storage'
)

_snapshot="${_name}-${pkgver}"
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/${_snapshot}.tar.xz"{,.sig})

sha256sums=(
    '0b4837365aa489cc4007badb21f49e7d7729b758020cf2a0717ab12fbf97f447'
    'SKIP'
)

validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>
options=('!docs')

_disable=(
    'KF5DocTools'
    'KF5Wallet'
)

_disable=("${_disable[@]/#/"-DCMAKE_DISABLE_FIND_PACKAGE_"}")
_disable=("${_disable[@]/%/"=ON"}")

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DBUILD_TESTING=OFF \
        -DBUILD_QCH=OFF \
        "${_disable[@]}"

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
}
