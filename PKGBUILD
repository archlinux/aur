# Maintainer: Patrizio Bekerle <patrizio at bekerle dot com>
# https://wiki.archlinux.org/title/PKGBUILD

pkgname=qownnotes
pkgver=26.3.12
tag="fb5164a2ec4af3d84b537fb97869a892e22ad2b3"
pkgrel=1
pkgdesc="Plain-text file markdown note taking with Nextcloud/ownCloud integration"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://www.qownnotes.org/'
license=('GPL2')
groups=('qownnotes')
depends=('qt6-base' 'qt6-svg' 'qt6-declarative' 'qt6-websockets' 'aspell' 'botan' 'libgit2')
makedepends=('qt6-tools' 'cmake')
source=("https://github.com/pbek/QOwnNotes/releases/download/v${pkgver}/qownnotes-${pkgver}.tar.xz")
sha256sums=('4e4a54d2b4ef7f3e04b484ef588d924351c9560e4ad3678bd6ff84e2e75aa267')

prepare() {
    cd "${pkgname}-${pkgver}"
    echo "#define RELEASE \"AUR\"" > release.h
}

build() {
    cd "${pkgname}-${pkgver}"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQON_QT6_BUILD=ON \
        -DBUILD_WITH_SYSTEM_BOTAN=ON \
        -DBUILD_WITH_LIBGIT2=ON \
        -DBUILD_WITH_ASPELL=ON \
        -DCMAKE_C_FLAGS_RELEASE="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS_RELEASE="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS_RELEASE="${LDFLAGS}"
    cmake --build build
}

package() {
    cd "${pkgname}-${pkgver}"

    # Use cmake install target
    DESTDIR="${pkgdir}" cmake --install build
}
