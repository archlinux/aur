# Maintainer: Martin Hoeher <martin@rpdev.net>
# Automatically released from https://gitlab.com/rpdev/opentodolist/-/pipelines/1621012735
pkgname=opentodolist
pkgver=3.49.0
pkgrel=1
pkgdesc="Maintain todo lists, notes and images in libraries, which can be synced via various services like NextCloud between your devices."
arch=('x86_64')
url="https://opentodolist.rpdev.net/"
license=('GPL')
depends=('qt6-base' 'qt6-declarative' 'qt6-remoteobjects' 'qt6-networkauth' 'libsecret' 'ttf-roboto' 'noto-fonts' 'qtkeychain-qt6')
makedepends=('git' 'git-lfs' 'cmake' 'ninja' 'qt6-tools')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
source=("${pkgname}::git+https://gitlab.com/rpdev/opentodolist.git#commit=${pkgver}")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
        cd "$srcdir/${pkgname%}"
        release_build=yes
        if [ -n "$release_build" ]; then
            printf "${pkgver}"
        else
            printf "%s" "$(git describe --long --tags | cut -f1 -d'-')"
        fi
}

prepare() {
        cd "$srcdir/${pkgname%}"
        git submodule update --init --recursive
}

build() {
        cd "$srcdir/${pkgname%}"
        mkdir -p build
        cd build
        cmake \
                -GNinja \
                -DCMAKE_BUILD_TYPE=Release \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DOPENTODOLIST_USE_SYSTEM_QTKEYCHAIN=ON \
                -DOPENTODOLIST_USE_SYSTEM_KF_SYNTAX_HIGHLIGHTING=OFF \
                -DOPENTODOLIST_QT_VERSIONS=Qt6 \
                -DOPENTODOLIST_FORCE_STATIC_3RD_PARTY_LIBRARIES=ON \
                ..
        cmake --build .
}

check() {
        cd "$srcdir/${pkgname%}"
        cd build
        # Some unit tests are failing sometimes - this is due to multi-threading issues
        # where the test does not "wait in the right order" (kind of). Ideally, we'd fix
        # this, however, in order to avoid issues, retry the testing.
        # If the test fails three times, this is a clear sign that something IS broken.
        cmake --build . --target test || \
                cmake --build . --target test || \
                cmake --build . --target test
}

package() {
        cd "$srcdir/${pkgname%}"
        cd build
        DESTDIR="$pkgdir/" cmake --build . --target install
        rm -rf \
                $pkgdir/usr/include/ \
                $pkgdir/usr/lib/
}
