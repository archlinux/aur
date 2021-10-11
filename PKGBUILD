# Maintainer: OpenSorcerer <alex at opensourcery dot eu>
pkgname=airvpn-suite
_pkgname=AirVPN-Suite
pkgver=1.1.0
pkgrel=2
_commit="46273bd11471b5b7d4c551c65bd1f304e12e1877"
pkgdesc="AirVPN client software collection including Bluetit, Goldcrest and Hummingbird – stable"
arch=('x86_64')
url="https://gitlab.com/AirVPN/$_pkgname"
license=('GPL3')
provides=('hummingbird' 'hummingbird-bin' 'airvpn-suite-bin' 'airvpn-suite-beta-bin')
conflicts=('hummingbird' 'hummingbird-bin' 'airvpn-suite-bin' 'airvpn-suite-beta-bin')
depends=('dbus' 'openssl' 'libxml2' 'xz' 'lz4' 'crypto++')
makedepends=('gcc' 'make' 'pkgconf' 'autoconf' 'automake' 'git' 'wget')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')
install="$pkgname.install"
changelog="Changelog-Suite.txt"

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
    install -Dm755 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # place license
    install -Dm755 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

    # place configuration
    install -Dm600 -t "$pkgdir/etc/airvpn/" "$_pkgname"/etc/airvpn/*

    # place D-Bus config
    install -Dm644 -t "$pkgdir/etc/dbus-1/system.d/" "$_pkgname"/etc/dbus-1/system.d/*

    # place Systemd service
    install -Dm644 "$_pkgname/etc/systemd/system/bluetit.service" "$pkgdir/etc/systemd/system/bluetit.service"
}
