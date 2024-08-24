# To disable Qt6, set USE_QT6 variable to OFF. For example:
# USE_QT6=OFF makepkg -si

pkgbase=qbittorrent-enhanced-ua
pkgname=(qbittorrent-enhanced-ua qbittorrent-enhanced-ua-nox)
pkgver=4.6.6.10
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
    'zlib'
)
makedepends=(
    'boost'
    'cmake'
)
optdepends=('python: needed for torrent search tab')

_tag="release-${pkgver}"
_snapshot="${_repo}-${_tag}"

source=("${url}/archive/${_tag}/${_snapshot}.tar.gz")
sha256sums=('763e95966bf0b49951484ee22e0080261a39cbe5b883bbed1b55ccc47ea1b7fb')

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
    sed -e 's|^#define QBT_VERSION_BUILD .\+|#define QBT_VERSION_BUILD 0|' -i 'src/base/version.h.in'
}

build() {
    cmake -B 'build' -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT6="${USE_QT6}"

    cmake --build 'build'

    cmake -B 'build-nox' -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT6="${USE_QT6}" \
        -DGUI=OFF \
        -DSYSTEMD=ON

    cmake --build 'build-nox'
}

package_qbittorrent-enhanced-ua() {
    depends+=("${_gdeps[@]}" 'hicolor-icon-theme')
    provides=('qbittorrent')
    conflicts=('qbittorrent')

    DESTDIR="${pkgdir}" cmake --install 'build'
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_snapshot}/COPYING"
}

package_qbittorrent-enhanced-ua-nox() {
    provides=('qbittorrent-nox')
    conflicts=('qbittorrent-nox')

    DESTDIR="${pkgdir}" cmake --install 'build-nox'
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_snapshot}/COPYING"
}
