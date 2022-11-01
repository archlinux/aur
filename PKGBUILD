# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Tilman BLUMENBACH <tilman+aur AT ax86 DOT net>

pkgname=(barrier barrier-headless)
pkgver=2.4.0
pkgrel=2
pkgdesc="Open-source KVM software based on Synergy"
arch=(x86_64)
url="https://github.com/debauchee/barrier"
license=("custom:GPL2WithOpenSSLException")
changelog=CHANGELOG.rst
depends=(curl avahi libx11 libxrandr libxext
        libxinerama xorgproto libxtst libxi
        libsm libice openssl)
makedepends=(cmake git qt5-base hicolor-icon-theme)
source=("git+https://github.com/debauchee/barrier.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "barrier"
    git submodule update --init --recursive
    # lib/platform: Fix encoding for text copied between linux and windows
    # https://github.com/debauchee/barrier/commit/dd3ea8adfef868e52098ea24d2ed08320a90e3b9
    git cherry-pick -n dd3ea8adfef868e52098ea24d2ed08320a90e3b9

    # Add missing cstddef includes for NULL
    # https://github.com/debauchee/barrier/commit/4b12265ae5d324b942698a3177e1d8b1749414d7
    git cherry-pick -n 4b12265ae5d324b942698a3177e1d8b1749414d7
}

build() {
    cd "barrier"

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


_package_common() {
    # Install binaries:
    cd "barrier/build"
    DESTDIR="${pkgdir}" make install

    # Install the license:
    cd ..
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install the manpages:
    mkdir -p "${pkgdir}/usr/share/man/man1"
    install -m 644 doc/*.1 "${pkgdir}/usr/share/man/man1"

    # Install the examples:
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    install -m 644 doc/barrier.conf* "${pkgdir}/usr/share/doc/${pkgname}"
}

package_barrier() {
    pkgdesc="Open-source KVM software based on Synergy (GUI)"
    depends=("barrier-headless=${pkgver}-${pkgrel}" qt5-base hicolor-icon-theme)

    # Install all the files:
    _package_common

    # Now go and delete files that are already in
    # barrier-headless:
    for file in \
        /usr/share/doc \
        /usr/share/man \
        /usr/bin/barrier{s,c} \
    ;do
        rm -rf "${pkgdir}/${file}"
    done
}

package_barrier-headless() {
    pkgdesc="Open-source KVM software based on Synergy (client and server CLI binaries)"

    # Install all the files:
    _package_common

    # Now go and delete the GUI-related files:
    for file in \
        /usr/bin/barrier \
        /usr/share/applications \
        /usr/share/icons \
    ;do
        rm -rf "${pkgdir}/${file}"
    done
}
