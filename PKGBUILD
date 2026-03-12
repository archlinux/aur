# To use Qt5 build, define 'QT5_BUILD' environment variable. Example:
# QT5_BUILD= makepkg -si

pkgname=torrent-file-editor
pkgver=1.0.1
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
    depends+=('qt5-base')
    makedepends+=('qt5-tools')
    _buildflags+=('QT6_BUILD=OFF' 'QT5_BUILD=ON')
else
    depends+=('qt6-base' 'qt6-5compat')
    makedepends+=('qt6-tools')
    _buildflags+=('QT6_BUILD=ON' 'QT5_BUILD=OFF')
fi

_snapshot="${pkgname}-${pkgver}"
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}/${_snapshot}.tar.gz")
sha256sums=('60633357d25c3a9bfd2a2db9c7fcffe7093082049383f013861fc8f4bdba4b33')

build() {
    cmake -B 'build' -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "${_buildflags[@]/#/'-D'}"

    cmake --build 'build'
}

package() {
    DESTDIR="${pkgdir}" cmake --install 'build'
}
