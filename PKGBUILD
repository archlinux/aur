# To use Qt5 build, define 'QT5_BUILD' environment variable. Example:
# QT5_BUILD= makepkg -si

pkgname=torrent-file-editor
pkgver=1.0.3
pkgrel=1
pkgdesc='Qt based GUI tool designed to create and edit .torrent files'
arch=('x86_64')
url="https://${pkgname}.github.io/"
license=('GPL-3.0-or-later')

depends=(
    'glibc'
    'hicolor-icon-theme'
    'libgcc'
    'libstdc++'
)

makedepends=('cmake')
_buildflags=()

if [[ -v 'QT5_BUILD' ]]; then
    depends+=('qt5-base' 'qt5-svg')
    makedepends+=('qt5-tools')
    _buildflags+=('QT6_BUILD=OFF' 'QT5_BUILD=ON')
else
    depends+=('qt6-base' 'qt6-5compat' 'qt6-svg')
    makedepends+=('qt6-tools')
    _buildflags+=('QT6_BUILD=ON' 'QT5_BUILD=OFF')
fi

_snapshot="${pkgname}-${pkgver}"
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${_snapshot}.tar.gz")
sha256sums=('9a49c8ae27026d4bac5bcfeef33070425f6377e4e556e58205542a8b2b3216ca')

build() {
    cmake -B 'build' -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "${_buildflags[@]/#/'-D'}"

    cmake --build 'build'
}

package() {
    DESTDIR="${pkgdir}" cmake --install 'build'
}
