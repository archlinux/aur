# To disable Qt6, set USE_QT6 variable to OFF. For example:
# USE_QT6=OFF makepkg -si

pkgname=qbittorrent-enhanced-ua
pkgver=4.4.3.12
pkgrel=3
pkgdesc="An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar. (Enhanced Edition with original user-agent)"
arch=('x86_64')
_name="qBittorrent-Enhanced-Edition"
url="https://github.com/c0re100/${_name}"
license=('custom' 'GPL')
depends=('libtorrent-rasterbar' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'boost')
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
    '67f741ad176a487ad9e5d910f9782838082eada623ca84c67774bb859f601bf2'
    '45b197be81dcc4e5f9cc3df6868ed2aba920514af8c47323ed2d67bcbd8c4d6f'
)

USE_QT6="${USE_QT6:-ON}"

if [[ "${USE_QT6}" = "ON" ]]; then
    depends+=('qt6-base' 'qt6-svg')
    makedepends+=('qt6-tools')
else
    depends+=('qt5-base' 'qt5-svg')
    makedepends+=('qt5-tools')
fi

prepare() {
    cd "${srcdir}/${_snapshot}"
    patch -p0 -i "${srcdir}/${source[1]}"
}

build() {
    cd "${srcdir}"

    cmake -B "build" -GNinja "${_snapshot}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT6="${USE_QT6}"

    ninja -C "build"
}

package() {
    cd "${srcdir}"
    DESTDIR="${pkgdir}" ninja -C "build" install

    cd "${_snapshot}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYING"
}
