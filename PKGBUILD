pkgbase=qbittorrent-enhanced-ua
pkgname=(qbittorrent-enhanced-ua qbittorrent-enhanced-ua-nox)
pkgver=5.2.1.10
pkgrel=2
pkgdesc='An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar (Enhanced Edition with original user-agent)'
arch=('x86_64')
_repo='qBittorrent-Enhanced-Edition'
url="https://github.com/c0re100/${_repo}"
license=('GPL-2.0-or-later' 'GPL-3.0-or-later')

depends=(
    'glibc'
    'libgcc'
    'libstdc++'
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

source=(
    "${url}/archive/${_tag}/${_snapshot}.tar.gz"
    '01-libtorrent-2.1-compat.patch'
)
sha256sums=(
    'ee5e05db67ba52a9380b01501260473bcd6595b4750c5775c037ed3b6815e30b'
    '5376db81675d6a5bf1cee305745224e9eba495d3afcc04274cc7e8e6a7a6a6dd'
)

prepare() {
    cd "${_snapshot}"

    # Fix building against libtorrent 2.1
    patch -N -p1 -i "${srcdir}/01-libtorrent-2.1-compat.patch"

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
