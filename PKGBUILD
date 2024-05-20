# Maintainer: OpenSorcerer <alex at opensourcery dot eu>
pkgname=airvpn-suite
_pkgname=AirVPN-Suite
pkgver=1.3.0
pkgrel=2
_commit="ef5ce5ad8fff24f3476f3a072f44d31a5cd1d3fc"
pkgdesc="AirVPN client software collection – stable"
arch=('x86_64')
url="https://gitlab.com/AirVPN/$_pkgname"
license=('GPL3')
provides=('hummingbird' 'hummingbird-bin' 'airvpn-suite-bin' 'airvpn-suite-beta-bin')
conflicts=('hummingbird' 'hummingbird-bin' 'airvpn-suite-bin' 'airvpn-suite-beta-bin')
depends=('dbus' 'libxml2' 'crypto++' 'curl' 'zlib' 'lz4' 'openssl' 'zstd' 'xz' 'glibc' 'gcc-libs')
makedepends=('git' 'wget' 'wireguard-tools')
source=(
    "git+$url.git#commit=$_commit"
    'openvpn3-airvpn-source::git+https://github.com/AirVPN/openvpn3-airvpn.git')
sha256sums=('c7c823d7bb813ac384cd8feb2854bff37c03c295b3a0ed2835ac21c46485b1ff'
            'SKIP')
backup=('etc/airvpn/bluetit.rc')
install="$pkgname.install"
changelog="Changelog-Suite.txt"

build() {
    # set vars needed by original OpenVPN3 build scripts
    export O3="$srcdir/O3" && mkdir "$O3"
    export DEP_DIR="$O3/deps" && mkdir "$DEP_DIR"
    export DL="$O3/dl" && mkdir "$DL"
    cd "$O3"

    # build OpenVPN3 core
    ln -sf "$srcdir/openvpn3-airvpn-source" 'core'
    cd core/scripts/linux
    ./build-all

    # move directories around for the suite build scripts
    rm -rf "$srcdir/openvpn3-airvpn" && mv "$O3/core" "$srcdir/openvpn3-airvpn"
    rm -rf "$srcdir/asio" && mv "$O3/deps/asio" "$srcdir"

    # build the suite
    cd "$_pkgname"
    mkdir obj
    cp /usr/share/wireguard-tools/examples/embeddable-wg-library/wireguard.? src/
    cp /usr/share/wireguard-tools/examples/embeddable-wg-library/wireguard.h src/include/
    ./build-bluetit.sh
    ./build-goldcrest.sh
    ./build-hummingbird.sh
}

package() {
    cd $srcdir/$_pkgname

    # place binaries
    install -Dm755 bluetit "$pkgdir/usr/bin/bluetit"
    install -Dm755 goldcrest "$pkgdir/usr/bin/goldcrest"
    install -Dm755 hummingbird "$pkgdir/usr/bin/hummingbird"

    # place documentation
    install -Dm755 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # place license
    install -Dm755 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

    # place configuration
    install -Dm600 -t "$pkgdir/etc/airvpn/" "$_pkgname"/etc/airvpn/*

    # place D-Bus config
    install -Dm644 -t "$pkgdir/etc/dbus-1/system.d/" "$_pkgname"/etc/dbus-1/system.d/*

    # place Systemd service
    install -Dm644 "$_pkgname/etc/systemd/system/bluetit.service" "$pkgdir/usr/lib/systemd/system/bluetit.service"
}
