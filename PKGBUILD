# To use Qt6 build, set QT6_BUILD environment variable. Example:
# QT6_BUILD=1 makepkg -si

pkgname=torrent-file-editor
pkgver=0.3.18
pkgrel=2
pkgdesc='Qt based GUI tool designed to create and edit .torrent files'
arch=('x86_64')
url="https://${pkgname}.github.io/"
license=('GPL-3.0-or-later')

if [ "${QT6_BUILD}" ]; then
    depends=('qt6-base')
    makedepends=('cmake' 'qt6-tools' 'qt6-5compat')
    _buildflag='QT6_BUILD=1'
else
    depends=('qt5-base')
    makedepends=('cmake' 'qt5-tools')
    _buildflag='QT5_BUILD=1'
fi

_snapshot="${pkgname}-${pkgver}"
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${_snapshot}.tar.gz")
sha256sums=('78b69e0151c5998b4df8b69225e7930c18b7d4419eeaabcad769df0f38a86292')

build() {
    cmake -B 'build' -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "-D${_buildflag}"

    cmake --build 'build'
}

package() {
    DESTDIR="${pkgdir}" cmake --install 'build'
}
