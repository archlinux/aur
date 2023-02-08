pkgbase=qbittorrent-beta
pkgname=(qbittorrent-beta qbittorrent-beta-nox)
pkgver=4.5.0beta1
pkgrel=2
pkgdesc="An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar (beta)"
arch=('x86_64')
_repo="qBittorrent"
url="https://github.com/qbittorrent/${_repo}"
license=('custom' 'GPL')
depends=('libtorrent-rasterbar' 'qt6-base')
makedepends=('cmake' 'boost' 'qt6-tools' 'qt6-svg')
optdepends=('python: needed for torrent search tab')

_rel="release-${pkgver}"
_snapshot="${_repo}-${_rel}"

source=("${_snapshot}.tar.gz::${url}/archive/${_rel}.tar.gz")
sha256sums=('6501b725ba23b6f9c504bd07b0bb70eeaadb689b3d7306db289cc9b473bd40c0')

build() {
    cmake -B "build" "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT6=ON

    cmake --build "build"

    cmake -B "build-nox" "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT6=ON \
        -DGUI=OFF \
        -DSYSTEMD=ON

    cmake --build "build-nox"
}

package_qbittorrent-beta() {
    depends+=('qt6-svg' 'hicolor-icon-theme')
    provides=('qbittorrent')
    conflicts=('qbittorrent')

    DESTDIR="${pkgdir}" cmake --install "build"

    cd "${_snapshot}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYING"
}

package_qbittorrent-beta-nox() {
    provides=('qbittorrent-nox')
    conflicts=('qbittorrent-nox')

    DESTDIR="${pkgdir}" cmake --install "build-nox"

    cd "${_snapshot}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYING"
}
