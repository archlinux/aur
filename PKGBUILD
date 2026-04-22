# Maintainer:
# Contributor: Alexander Fetting <deeznuts420692@proton.me>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=flightgear
pkgver=2024.1.5
pkgrel=1
pkgdesc="An open-source, multi-platform flight simulator"
arch=('x86_64')
url="https://www.flightgear.org"
license=("GPL-2.0-or-later")
depends=('dbus'
         'glibc'
         'gsm'
         'hicolor-icon-theme'
         'libevent'
         'libgcc'
         'libglvnd'
         'libstdc++'
         'libx11'
         'openal'
         'openscenegraph'
         'qt6-base'
         'qt6-declarative'
         'simgear'
         'speex'
         'speexdsp'
         'sqlite'
         'systemd-libs'
         'zlib')
makedepends=('boost' 'cmake' 'plib' 'qt6-svg' 'qt6-tools')
optdepends=('flightgear-data: Base data package')
source=("https://gitlab.com/flightgear/flightgear/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d433fcf51bf05c96d5a6ae54a2161bf0545bbe2f69fd43470be9e479f505c52c')

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i 's|Exec=\(.*\)|Exec=\1 --fg-root=/usr/share/flightgear/data|' package/org.flightgear.FlightGear.desktop.in
}

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CHECK_FOR_QT5=OFF \
        -D FG_DATA_DIR=/usr/share/flightgear/data \
        -D SYSTEM_SQLITE=ON
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    rm -r "${pkgdir}/usr/appdir"
}
