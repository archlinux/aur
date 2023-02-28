# To disable Qt6, set USE_QT6 variable to OFF. For example:
# USE_QT6=OFF makepkg -si

pkgbase=qbittorrent-enhanced-ua
pkgname=(qbittorrent-enhanced-ua qbittorrent-enhanced-ua-nox)
pkgver=4.5.2.10
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

source=(
    "${_snapshot}.tar.gz::${url}/archive/${_rel}.tar.gz"
    "revert-ua.patch"
)

sha256sums=(
    '21ed8db3487e306d2de8afbb3c5bf347ac0a29f1d26457b649c48fed8ba04cb4'
    'f39dcbcd65216310e99d6006aa43e479b8cbf7028e173ac602d643651d19c7f1'
)

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
    patch -p0 -Z -i "${srcdir}/${source[1]}"
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
