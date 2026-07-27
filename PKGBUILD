# Maintainer: Alex Indigo <ai at aegis dot one>
# Contributor: Alex Indigo <ai at aegis dot one>

pkgname=jami-qt-git
_pkgname=jami-client-qt
_release_ver=20260707.0
pkgver=20260717.0.r17.g2e34c0bb
pkgrel=2
pkgdesc="Free and universal communication platform which preserves the users' privacy and freedoms (Qt client, built from upstream git)"
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
replaces=('jami-qt')

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
    git describe --long --tags --match 'stable/*' --always 2>/dev/null \
        | sed 's/^stable\///;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || echo "${_release_ver}.r0.g$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    # Init 3rdparty submodules only (skip daemon submodule — use system jami-daemon)
    git submodule update --init --recursive -- 3rdparty

    # Fix build against system zxing-cpp 3.x — upstream uses unqualified
    # #include <BitMatrix.h> etc., zxing-cpp 3 ships headers under ZXing/.
    # (Same patch Arch's extra/jami-qt uses.)
    patch -p1 < "${srcdir}/zxing-cpp-3.patch"

    # Add explicit avutil to the link line — with binutils --as-needed,
    # transitively-used libavutil (via libjami) isn't pulled in unless named.
    # (Same patch Arch's extra/jami-qt uses.)
    patch -p1 < "${srcdir}/fix-link.patch"

    # Fix ValueFilter QML property typo: invert -> inverted.
    # Qt 6.10+ ships native SortFilterProxyModel / ValueFilter (QtQml.Models);
    # the invertible bool is 'inverted' on QQmlFilterBase, not 'invert'. Upstream
    # jami-client-qt uses the wrong name in 5 places (AccountComboBox.qml:101,
    # LinkedDevicesBase.qml:100, VideoSettingsPage.qml:161/198/229) → SidePanel
    # and settings dialogs fail to load on modern Qt.
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
