pkgbase=qbittorrent-enhanced-ua
pkgname=(qbittorrent-enhanced-ua qbittorrent-enhanced-ua-nox)
pkgver=5.1.2.10
pkgrel=1
pkgdesc='An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar (Enhanced Edition with original user-agent)'
arch=('x86_64')
_repo='qBittorrent-Enhanced-Edition'
url="https://github.com/c0re100/${_repo}"
license=('GPL-2.0-or-later' 'GPL-3.0-or-later')

depends=(
    'gcc-libs'
    'glibc'
    'libtorrent-rasterbar'
    'openssl'
    'qt6-base'
    'zlib'
)
makedepends=(
    'boost'
    'cmake'
    'qt6-svg'
    'qt6-tools'
)
optdepends=('python: needed for torrent search tab')

_tag="release-${pkgver}"
_snapshot="${_repo}-${_tag}"

source=("${url}/archive/${_tag}/${_snapshot}.tar.gz")
sha256sums=('929f421b8ce1be0bc530868b030252ea6db876b923a93ba1f4a1a86d48efa949')

prepare() {
    cd "${_snapshot}"
    sed -e '/USER_AGENT =/s/ Enhanced//' -i 'src/base/bittorrent/sessionimpl.cpp'
    sed -e '/^#define QBT_VERSION_BUILD/s/[[:digit:]]\+/0/' -i 'src/base/version.h.in'
}

build() {
    cmake -B 'build' -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build 'build'

    cmake -B 'build-nox' -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGUI=OFF \
        -DSYSTEMD=ON

    cmake --build 'build-nox'
}

package_qbittorrent-enhanced-ua() {
    depends+=('qt6-svg' 'hicolor-icon-theme')
    provides=('qbittorrent')
    conflicts=('qbittorrent')

    DESTDIR="${pkgdir}" cmake --install 'build'
}

package_qbittorrent-enhanced-ua-nox() {
    provides=('qbittorrent-nox')
    conflicts=('qbittorrent-nox')

    DESTDIR="${pkgdir}" cmake --install 'build-nox'
}
