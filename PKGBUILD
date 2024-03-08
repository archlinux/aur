# To use Qt5 build, define 'QT5_BUILD' environment variable. Example:
# QT5_BUILD= makepkg -si

pkgname=torrent-file-editor
pkgver=0.3.18
pkgrel=2
pkgdesc='Qt based GUI tool designed to create and edit .torrent files'
arch=('x86_64')
url="https://${pkgname}.github.io/"
license=('GPL-3.0-or-later')

depends=()
makedepends=('cmake')
_buildflags=()

if [[ -v 'QT5_BUILD' ]]; then
    depends+=('qt5-base')
    makedepends+=('qt5-tools')
    _buildflags+=('QT6_BUILD=OFF' 'QT5_BUILD=ON')
else
    depends+=('qt6-base')
    makedepends+=('qt6-tools' 'qt6-5compat')
    _buildflags+=('QT6_BUILD=ON' 'QT5_BUILD=OFF')
fi

_buildflags=("${_buildflags[@]/#/'-D'}")

_snapshot="${pkgname}-${pkgver}"
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${_snapshot}.tar.gz")
sha256sums=('78b69e0151c5998b4df8b69225e7930c18b7d4419eeaabcad769df0f38a86292')

build() {
    cmake -B 'build' -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "${_buildflags[@]}"

    cmake --build 'build'
}

package() {
    DESTDIR="${pkgdir}" cmake --install 'build'
}
