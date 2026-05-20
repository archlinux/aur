# Maintainer: ysltr

_pkgname=nheko
_mtxclientver=0.10.1
pkgname=nheko-scrollfix-git
pkgver=0.12.1.r6045.g90ff9c6f
pkgrel=4
pkgdesc="Desktop client for the Matrix protocol with Kirigami wheel scroll fix"
arch=('x86_64')
url="https://github.com/Nheko-Reborn/nheko"
license=(GPL-3.0-or-later)
provides=(
    "nheko=${pkgver}"
    "mtxclient=${_mtxclientver}"
    "libmatrix_client.so=${_mtxclientver}-64"
)
conflicts=(
    nheko
    nheko-git
    nheko-scrollfix
    mtxclient
    mtxclient-git
)
depends=(
    qt6-base
    qt6-svg
    qt6-multimedia
    qtkeychain-qt6
    qt6-declarative
    qt6-imageformats
    coeurl
    lmdb
    cmark
    libolm
    re2
    hicolor-icon-theme
    kdsingleapplication
    gst-plugins-bad-libs
    org.freedesktop.secrets
    kirigami
    openmp
)
makedepends=(
    git
    cmake
    ninja
    qt6-tools
    fontconfig
    nlohmann-json
    asciidoc
    lmdbxx
    spdlog
    extra-cmake-modules
)
optdepends=(
    'qt6-jdenticon: Auto-generated profile pictures (identicons)'
    'kimageformats: Extends the formats nheko supports for image attachments'
    'gst-plugins-base-libs: VoIP/Video calls'
    'gst-plugins-good: VoIP/Video calls'
    'gst-plugins-bad: VoIP/Video calls'
    'libnice: VoIP/Video calls'
    'gst-libav: Video messages'
    'gst-plugin-qml6: Video calls support'
)
source=(
    "git+https://github.com/Nheko-Reborn/nheko.git"
    "nheko-kirigami-scrollfix.patch"
    "KirigamiWheelHandler.qml"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    local version
    version="$(
        sed -n 's/^set(CPACK_PACKAGE_VERSION_\(MAJOR\|MINOR\|PATCH\) "\([^"]*\)")$/\2/p' CMakeLists.txt \
            | paste -sd .
    )"
    printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    install -Dm644 "$srcdir/KirigamiWheelHandler.qml" \
        "$srcdir/$_pkgname/resources/qml/components/KirigamiWheelHandler.qml"
    patch -Np1 -i "$srcdir/nheko-kirigami-scrollfix.patch"
}

build() {
    cmake \
        -B "$srcdir/build" \
        -G Ninja \
        -S "$srcdir/$_pkgname" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_SHARED_LIBS=ON \
        -DUSE_BUNDLED_MTXCLIENT=ON \
        -DBUILD_LIB_TESTS=OFF \
        -DBUILD_LIB_EXAMPLES=OFF \
        -Wno-dev
    cmake --build "$srcdir/build" --verbose
}

package() {
    depends+=(
        spdlog
        libspdlog.so
        libolm
        libolm.so
    )
    DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
