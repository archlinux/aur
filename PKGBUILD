# Maintainer: Tilman BLUMENBACH <tilman+aur AT ax86 DOT net>

pkgname=barrier
pkgver=2.1.1
pkgrel=2
pkgdesc="Open-source KVM software based on Synergy"
url="https://github.com/debauchee/barrier"
license=("custom:GPL2WithOpenSSLException")
changelog=CHANGELOG.rst
source=(
    "https://github.com/debauchee/barrier/archive/v${pkgver?}.tar.gz"
    0001-Handle-removal-of-cmake-macro-qt5_use_modules.patch
)
arch=(x86_64)
depends=(curl libx11 libxrandr libxext libxinerama xorgproto libxtst libxi avahi libsm libice openssl qt5-base
         hicolor-icon-theme)
makedepends=(cmake)

prepare() {
    cd "barrier-${pkgver?}"

    for patch in "${srcdir?}"/*.patch; do
        patch -Np1 -i "${patch?}"
    done
}

build() {
    cd "barrier-${pkgver?}"

    mkdir -p build
    cd build

    cmake -G "Unix Makefiles" \
        -D CMAKE_BUILD_TYPE:STRING=Release \
        -D CMAKE_INSTALL_PREFIX:STRING=/usr \
        -D BARRIER_REVISION:STRING=00000000 \
        -D BARRIER_VERSION_STAGE:STRING=RELEASE \
        ..
    make
}

package() {
    # Install binaries:
    cd "barrier-${pkgver?}/build"
    DESTDIR="${pkgdir?}" make install

    # Install the license:
    cd ..
    install -m 644 -D LICENSE "${pkgdir?}/usr/share/licenses/${pkgname?}/LICENSE"

    # Install the manpages:
    mkdir -p "${pkgdir?}/usr/share/man/man1"
    install -m 644 doc/*.1 "${pkgdir?}/usr/share/man/man1"

    # Install the examples:
    mkdir -p "${pkgdir?}/usr/share/doc/${pkgname?}"
    install -m 644 doc/barrier.conf* "${pkgdir?}/usr/share/doc/${pkgname?}"
}

sha256sums=('775d504db6091c4dc479657fc4fc566ceb9893426664ae60c9a2bb198b562774'
            '142750baea34ee068ee77a7557fd4fd69ede0e151dcf8d905d88c67c59a22cc5')
