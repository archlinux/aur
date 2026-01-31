# Maintainer:
# Contributor: Alexander Fetting <deeznuts420692@proton.me>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=flightgear
pkgver=2024.1.4
pkgrel=1
pkgdesc="An open-source, multi-platform flight simulator"
arch=('x86_64')
url="https://www.flightgear.org"
license=("GPL-2.0-or-later")
depends=('dbus'
         'gcc-libs'
         'glibc'
         'gsm'
         'hicolor-icon-theme'
         'libevent'
         'libglvnd'
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
sha256sums=('7a91d585b6150a04423914d71e5094137cc90046c705abc5489441f0c2829a56')

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
