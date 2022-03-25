pkgname=qbittorrent-enhanced-ua
pkgver=4.4.2.10
pkgrel=1
pkgdesc="An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar. (Enhanced Edition with original user-agent)"
arch=('x86_64')
_name="qBittorrent-Enhanced-Edition"
url="https://github.com/c0re100/${_name}"
license=('custom' 'GPL')
depends=('libtorrent-rasterbar' 'qt6-base' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'boost' 'qt6-tools')
optdepends=('python: needed for torrent search tab')
provides=('qbittorrent')
conflicts=('qbittorrent')

_rel="release-${pkgver}"
_snapshot="${_name}-${_rel}"

source=(
    "${_snapshot}.tar.gz::${url}/archive/${_rel}.tar.gz"
    "revert-ua.patch"
)

sha256sums=(
    '6b052b6da4abbc8d4ac5c68ac5f764e74b4ee1c26140d5d75b58c34481b0ee5c'
    '25310df75d7b41b55cc15c11a7a845465358a199e3d3147044404d82edeac514'
)

prepare() {
    cd "${srcdir}/${_snapshot}"
    patch -p0 -N -i "${srcdir}/${source[1]}"
}

build() {
    cd "${srcdir}"

    cmake -B "build" -GNinja "${_snapshot}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT6=ON

    ninja -C "build"
}

package() {
    cd "${srcdir}"
    DESTDIR="${pkgdir}" ninja -C "build" install

    cd "${_snapshot}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYING"
}
