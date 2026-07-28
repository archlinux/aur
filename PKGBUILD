# Maintainer: Alex Indigo <ai at aegis dot one>
# Contributor: Alex Indigo <ai at aegis dot one>

pkgname=jami-qt-beta-git
_pkgname=jami-client-qt
_release_ver=202607271335
pkgver=202607271335.r3.g2e34c0bb
pkgrel=1
pkgdesc="Free and universal communication platform which preserves the users' privacy and freedoms (Qt client, beta channel)"
arch=('x86_64')
url="https://jami.net"
license=('GPL-3.0-or-later')
groups=('jami')

depends=(
    'jami-daemon'
    'glib2'
    'gdk-pixbuf2'
    'libnm'
    'libnotify'
    'qt6-declarative'
    'qt6-multimedia'
    'qt6-svg'
    'qt6-5compat'
    'qt6-webengine'
    'qt6-httpserver'
    'qt6-webchannel'
    'qt6-shadertools'
    'hunspell'
    'tidy'
    'md4c'
    'qwindowkit'
    'zxing-cpp'
)
makedepends=(
    'cmake'
    'git'
    'python'
    'qt6-tools'
    'qt6-networkauth'
)

provides=('jami-qt' 'jami-client-qt')
conflicts=('jami-qt' 'jami-client-qt')

source=(
    "${_pkgname}::git+https://git.jami.net/savoirfairelinux/jami-client-qt.git"
    'zxing-cpp-3.patch'
    'fix-link.patch'
    'fix-valuefilter-invert.patch'
)
sha256sums=(
    'SKIP'
    '0b26f155c94f91a0c541879698f2d1b14544036685267e7367f6523dacd8a91f'
    'ce15c9c4ed91768cbd75bf7bd0fa904f553a12da32c17b700d85fdd8c8cbedce'
    '44ab7cfbf1c3b58a118e4852227d86f08f28d5636d3d6a0e4f966e87535a80b0'
)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags --match 'beta/*' --always 2>/dev/null \
        | sed 's/^beta\///;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || echo "${_release_ver}.r0.g$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule update --init --recursive -- 3rdparty
    patch -p1 < "${srcdir}/zxing-cpp-3.patch"
    patch -p1 < "${srcdir}/fix-link.patch"
    patch -p1 < "${srcdir}/fix-valuefilter-invert.patch"
}

build() {
    cmake -B build -S "${srcdir}/${_pkgname}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DENABLE_LIBWRAP=ON \
        -DJAMICORE_AS_SUBDIR=OFF \
        -DWITH_DAEMON_SUBMODULE=OFF \
        -Wno-dev
    make -C build VERBOSE=1
}

package() {
    make -C build DESTDIR="${pkgdir}" install
}
