# Maintainer: OpenSorcerer <alex at opensourcery dot eu>
pkgname=airvpn-suite
_pkgname=AirVPN-Suite
pkgver=1.0.0
pkgrel=3
_commit="fee05fd016b22d222ec85846786c1d627b03b40e"
pkgdesc="AirVPN client software collection including Bluetit, Goldcrest and Hummingbird"
arch=('x86_64')
url="https://gitlab.com/AirVPN/$_pkgname"
license=('GPL3')
provides=('hummingbird-bin' 'hummingbird' 'airvpn-suite-bin')
conflicts=('hummingbird-bin' 'hummingbird' 'airvpn-suite-bin')
depends=('dbus' 'openssl' 'libxml2' 'xz' 'lz4')
makedepends=('gcc' 'make' 'pkgconf' 'autoconf' 'automake' 'git' 'crypto++')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')
install="$pkgname.install"

build() {
    # set vars needed by original OpenVPN3 build scripts
    export O3="$srcdir/O3" && mkdir "$O3"
    export DEP_DIR="$O3/deps" && mkdir "$DEP_DIR"
    export DL="$O3/dl" && mkdir "$DL"
    cd "$O3"
    
    # clone and build OpenVPN3 core
    git clone https://github.com/AirVPN/openvpn3-airvpn.git core
    cd core/scripts/linux
    ./build-all
    
    # move directories around for the suite build scripts
    cd "$srcdir"
    mv "$O3/core" "$srcdir/openvpn3-airvpn"
    mv "$O3/deps/asio" "$srcdir"
    
    # build the suite
    cd AirVPN-Suite
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
    install -Dm755 README.md "$pkgdir/usr/share/doc/airvpn-suite/README.md"

    # place configuration
    cd $_pkgname/etc
    for file in airvpn/*; do
        install -Dm600 "$file" "$pkgdir/etc/$file"
    done

    # place D-Bus config
    install -Dm644 dbus-1/system.d/org.airvpn.client.conf "$pkgdir/etc/dbus-1/system.d/org.airvpn.client.conf"
    install -Dm644 dbus-1/system.d/org.airvpn.server.conf "$pkgdir/etc/dbus-1/system.d/org.airvpn.server.conf"

    # place Systemd service
    install -Dm644 systemd/system/bluetit.service "$pkgdir/etc/systemd/system/bluetit.service"
}
