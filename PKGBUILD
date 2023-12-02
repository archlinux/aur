# To disable Qt6, set USE_QT6 variable to OFF. For example:
# USE_QT6=OFF makepkg -si

pkgbase=qbittorrent-enhanced-ua
pkgname=(qbittorrent-enhanced-ua qbittorrent-enhanced-ua-nox)
pkgver=4.6.2.10
pkgrel=1
pkgdesc="An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar (Enhanced Edition with original user-agent)"
arch=('x86_64')
_repo="qBittorrent-Enhanced-Edition"
url="https://github.com/c0re100/${_repo}"
license=('custom' 'GPL')
depends=('libtorrent-rasterbar')
makedepends=('cmake' 'boost')
optdepends=('python: needed for torrent search tab')

_rel="release-${pkgver}"
_snapshot="${_repo}-${_rel}"

source=("${_snapshot}.tar.gz::${url}/archive/${_rel}.tar.gz")
sha256sums=('22ad828e4addecabae208ffb29e79da43bbda8c51294fda3da400bbf04ed81db')

USE_QT6="${USE_QT6:-ON}"

if [ "${USE_QT6}" = "ON" ]; then
    depends+=('qt6-base')
    _gdeps=('qt6-svg')
    makedepends+=('qt6-svg' 'qt6-tools')
else
    depends+=('qt5-base')
    _gdeps=('qt5-svg')
    makedepends+=('qt5-svg' 'qt5-tools')
fi

prepare() {
    cd "${_snapshot}"
    sed -e 's|"qBittorrent Enhanced/"|"qBittorrent/"|' -i 'src/base/bittorrent/sessionimpl.cpp'
    sed -e 's|#define QBT_VERSION_BUILD .\+|#define QBT_VERSION_BUILD 0|' -i 'src/base/version.h.in'
}

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT6="${USE_QT6}"

    cmake --build "build"

    cmake -B "build-nox" -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT6="${USE_QT6}" \
        -DGUI=OFF \
        -DSYSTEMD=ON

    cmake --build "build-nox"
}

package_qbittorrent-enhanced-ua() {
    depends+=("${_gdeps[@]}" 'hicolor-icon-theme')
    provides=('qbittorrent')
    conflicts=('qbittorrent')

    DESTDIR="${pkgdir}" cmake --install "build"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_snapshot}/COPYING"
}

package_qbittorrent-enhanced-ua-nox() {
    provides=('qbittorrent-nox')
    conflicts=('qbittorrent-nox')

    DESTDIR="${pkgdir}" cmake --install "build-nox"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_snapshot}/COPYING"
}
