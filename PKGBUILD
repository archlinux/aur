# Maintainer: Sami Ahmed <https://github.com/SamiAhmed7777>
pkgname=triangles-qt-bin
pkgver=5.9.20
pkgrel=1
pkgdesc="Cryptographic Triangles (TRI) cryptocurrency wallet - Qt GUI"
arch=('x86_64')
url="https://cryptographic-triangles.org"
license=('MIT')
depends=('qt5-base' 'openssl' 'boost-libs' 'db' 'leveldb' 'libevent' 'miniupnpc' 'tor')
optdepends=('tor: anonymous networking support')
provides=('triangles-qt' 'trianglesd' 'triangles-cli')
conflicts=('triangles-qt' 'trianglesd' 'triangles-cli')
source=(
    "https://github.com/SamiAhmed7777/triangles_v5/releases/download/v${pkgver}/cryptographic-triangles_${pkgver}_amd64.deb"
    "https://github.com/SamiAhmed7777/triangles_v5/releases/download/v${pkgver}/cryptographic-triangles-daemon_${pkgver}_amd64.deb"
    "triangles-qt.desktop"
)
sha256sums=('b4afcf758f55c8fb256f4742917971414078ce37c0fe346383ccda5251917bde'
            '068d015cf73206f3f3604b0c8fbf60db307c20234cbe06e236996fb9a336df51'
            'SKIP')

prepare() {
    cd "$srcdir"
    # Qt GUI + bundled Qt/libs come from the full wallet .deb
    ar x "cryptographic-triangles_${pkgver}_amd64.deb"
    tar --use-compress-program=unzstd -xf data.tar.zst
    rm -f control.tar.zst data.tar.zst debian-binary

    # Headless daemon + JSON-RPC client come from the daemon .deb
    ar x "cryptographic-triangles-daemon_${pkgver}_amd64.deb"
    tar --use-compress-program=unzstd -xf data.tar.zst
    rm -f control.tar.zst data.tar.zst debian-binary
}

package() {
    cd "$srcdir"

    # Install the actual binaries to /opt/triangles
    install -dm755 "${pkgdir}/opt/triangles"
    install -m755 usr/lib/cryptographic-triangles/triangles-qt \
        "${pkgdir}/opt/triangles/triangles-qt"
    install -m755 usr/lib/cryptographic-triangles/trianglesd \
        "${pkgdir}/opt/triangles/trianglesd"
    install -m755 usr/lib/cryptographic-triangles/triangles-cli \
        "${pkgdir}/opt/triangles/triangles-cli"

    # Install bundled shared libraries to /opt/triangles/lib.
    # Many are version-pinned (librocksdb.so.6.11, libgflags.so.2.2,
    # libdb_cxx-5.3.so, libboost_program_options.so.1.74.0) and are not
    # available at the right version on Arch, so we ship them ourselves.
    install -dm755 "${pkgdir}/opt/triangles/lib"
    # Use GUI .deb libs (it has the full Qt set + everything daemon needs)
    install -m644 usr/lib/cryptographic-triangles/lib/* \
        "${pkgdir}/opt/triangles/lib/"

    # Wrapper scripts in /usr/bin set LD_LIBRARY_PATH and exec the real binary.
    # System Qt5/openssl/etc. are still on the default loader path and take
    # precedence for libs NOT in our private directory.
    install -dm755 "${pkgdir}/usr/bin"
    for bin in triangles-qt trianglesd triangles-cli; do
        install -m755 /dev/stdin "${pkgdir}/usr/bin/${bin}" <<EOF
#!/bin/bash
export LD_LIBRARY_PATH=/opt/triangles/lib\${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}
exec /opt/triangles/${bin} "\$@"
EOF
    done

    # .desktop file
    install -Dm644 triangles-qt.desktop \
        "${pkgdir}/usr/share/applications/triangles-qt.desktop"
}
