# Maintainer: Tilman BLUMENBACH <tilman+aur AT ax86 DOT net>

pkgname=barrier
pkgver=2.1.2
pkgrel=1
pkgdesc="Open-source KVM software based on Synergy"
url="https://github.com/debauchee/barrier"
license=("custom:GPL2WithOpenSSLException")
changelog=CHANGELOG.rst
source=(
    "https://github.com/debauchee/barrier/archive/v${pkgver?}.tar.gz"
)
arch=(x86_64)
depends=(
    # Barrier core dependencies:
    curl
    avahi
    libx11
    libxrandr
    libxext
    libxinerama
    xorgproto
    libxtst
    libxi
    libsm
    libice
    openssl

    # Barrier GUI dependencies:
    qt5-base
    hicolor-icon-theme
)
makedepends=(cmake)

prepare() {
    cd "barrier-${pkgver?}"

    for patch in "${srcdir?}"/*.patch; do
        if [ -f "${patch?}" ]; then
            patch -Np1 -i "${patch?}"
        fi
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

sha384sums=('9d3f1e784ca1f1c1622f47be30632f6e0fc2fe07a38ab057df447e96b79a87e3362321ae0f3f5a8de98008bf76d479da')
