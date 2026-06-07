# Maintainer:
# Contributor: Alexander Fetting <deeznuts420692@proton.me>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=flightgear
pkgver=2024.1.6
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
sha256sums=('9b1993cb6d8933a2f5b7376fe26b18e7c15de31b853a7aa39df49648869445f8')

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i 's|Exec=\(.*\)|Exec=\1 --fg-root=/usr/share/flightgear/data|' package/org.flightgear.FlightGear.desktop.in
}

build() {
    local cmake_options=(
        -B build
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D CHECK_FOR_QT5=OFF
        -D ENABLE_CCACHE=ON
        -D FG_DATA_DIR=/usr/share/flightgear/data
        -D SYSTEM_SQLITE=ON
        -S "${pkgname}-${pkgver}"
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    rm -r "${pkgdir}/usr/appdir"
}
