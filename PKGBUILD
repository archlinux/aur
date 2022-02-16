pkgname=qbittorrent-enhanced-ua
pkgver=4.4.1.10
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
    '6615145de1ae717f06fb8c44e110be00b4548854c77e1d19226a23aff89b5715'
    '25310df75d7b41b55cc15c11a7a845465358a199e3d3147044404d82edeac514'
)

prepare() {
    cd "${srcdir}/${_snapshot}"

    patch -p0 -N -i "${srcdir}/${source[1]}"
}

build() {
    mkdir -p "${srcdir}/build" && cd "$_"

    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT6=ON \
        -GNinja "${srcdir}/${_snapshot}"

    ninja
}

package() {
    cd "${srcdir}/build"
    DESTDIR="${pkgdir}" ninja install

    cd "${srcdir}/${_snapshot}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYING"
}
