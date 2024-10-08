# To use Qt5 build, define 'QT5_BUILD' environment variable. Example:
# QT5_BUILD= makepkg -si

pkgname=torrent-file-editor
pkgver=1.0.0
pkgrel=1
pkgdesc='Qt based GUI tool designed to create and edit .torrent files'
arch=('x86_64')
url="https://${pkgname}.github.io/"
license=('GPL-3.0-or-later')

depends=('glibc')
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
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${_snapshot}.tar.gz")
sha256sums=('47162b34fd9969aaf2afd43d1a5ee4a641f2e482dbfbbc8e8257a8c05d8fd42e')

build() {
    cmake -B 'build' -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "${_buildflags[@]/#/'-D'}"

    cmake --build 'build'
}

package() {
    DESTDIR="${pkgdir}" cmake --install 'build'
}
