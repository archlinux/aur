# Maintainer: OpenSorcerer <alex at opensourcery dot eu>
pkgname=airvpn-suite
_pkgname=AirVPN-Suite
pkgver=1.3.0
pkgrel=3
_commit_suite="1c47cac6218b5268769038a54c2a60474f74e58d"
_commit_openvpn='63f028de99548f2ed9d61bc9fb908c6fec6326d4'
pkgdesc="AirVPN client software collection – stable"
arch=('x86_64')
url="https://gitlab.com/AirVPN/$_pkgname"
license=('GPL3')
provides=('hummingbird' 'hummingbird-bin' 'airvpn-suite-bin' 'airvpn-suite-beta-bin')
conflicts=('hummingbird' 'hummingbird-bin' 'airvpn-suite-bin' 'airvpn-suite-beta-bin')
depends=('dbus' 'libxml2' 'crypto++' 'curl' 'zlib' 'lz4' 'openssl' 'zstd' 'xz' 'glibc' 'gcc-libs')
makedepends=('git' 'wget' 'wireguard-tools' 'asio')
source=(
    "git+$url.git#commit=$_commit_suite"
    "git+https://github.com/AirVPN/openvpn3-airvpn.git#commit=$_commit_openvpn")
sha256sums=('933e0cf26da5dd394b1179a775899e974c74ff9711c26ff095b1f7aaa9384586'
            'cdadf843ac5950a6b652f38b58b10b9adffbd821356227ee97ea29c085f604f0')
backup=('etc/airvpn/bluetit.rc')
install="$pkgname.install"
changelog="Changelog-Suite.txt"

prepare() {
    sed -i 's|-I${ASIO}/asio/include||' "$_pkgname/build-hummingbird.sh" "$_pkgname/build-bluetit.sh"
    sed -i 's|-DASIO_STANDALONE|${CXXFLAGS} ${LDFLAGS} -Wno-error=format-security|' "$_pkgname/build-hummingbird.sh" "$_pkgname/build-bluetit.sh"
    sed -i 's|-Wno-shift-count-overflow|-Wno-shift-count-overflow ${CXXFLAGS} ${LDFLAGS} -Wno-error=format-security|' "$_pkgname/build-goldcrest.sh"
}

build() {
    # build the suite
    cd "$srcdir/$_pkgname"
    mkdir -p obj
    gcc $CFLAGS -c /usr/share/wireguard-tools/examples/embeddable-wg-library/wireguard.c -o obj/wireguard.o
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
