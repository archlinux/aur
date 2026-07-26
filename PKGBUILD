# Maintainer: Patrizio Bekerle <patrizio at bekerle dot com>
# https://wiki.archlinux.org/title/PKGBUILD

pkgname=qownnotes
pkgver=26.7.10
tag="b7f66153f1f44b3bfb6bb310c762c97ac4e03646"
pkgrel=1
pkgdesc="Plain-text file markdown note taking with Nextcloud/ownCloud integration"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://www.qownnotes.org/'
license=('GPL2')
groups=('qownnotes')
depends=('qt6-base' 'qt6-svg' 'qt6-declarative' 'qt6-websockets' 'aspell' 'botan' 'libgit2' 'libsecret')
makedepends=('qt6-tools' 'cmake')
source=("https://github.com/pbek/QOwnNotes/releases/download/v${pkgver}/qownnotes-${pkgver}.tar.xz")
sha256sums=('7c6836a5fa18b5a02415c02835548e4b130f8921963c31697ab6c4e0691583cc')

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
