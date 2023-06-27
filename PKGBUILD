# To use Qt6 build, set QT6_BUILD environment variable. Example:
# QT6_BUILD=1 makepkg -si

pkgname=torrent-file-editor
pkgver=0.3.18
pkgrel=1
pkgdesc='Qt based GUI tool designed to create and edit .torrent files'
arch=('x86_64')
url="https://${pkgname}.github.io/"
license=('GPL3')

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
sha256sums=('29977de90102242eb3136031f167a8614efb852519bdc515393191b9088e171c')

prepare() {
    # Fix wrong app version in the source
    sed -i "s/set(APP_VERSION .*)/set(APP_VERSION \"${pkgver}\")/;" "${_snapshot}/CMakeLists.txt"
}

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "-D${_buildflag}"

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_snapshot}/LICENSE"
}
