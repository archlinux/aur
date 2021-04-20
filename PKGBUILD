# Maintainer: OpenSourcerer <alex at opensourcery dot eu>
pkgname=hummingbird
pkgver=1.1.1
pkgrel=2
_commit="d55d88c96c0e77c7d39886ec52937678dbf98c7b"
pkgdesc="FLOSS OpenVPN3 client using AirVPN's OpenVPN3 library fork"
arch=('x86_64')
url="https://gitlab.com/AirVPN/$pkgname"
license=('GPL3')
provides=('hummingbird-bin')
conflicts=('hummingbird-bin' 'airvpn-suite' 'airvpn-suite-bin')
depends=('openssl' 'xz' 'lz4')
makedepends=('gcc' 'make' 'pkgconf' 'autoconf' 'automake' 'git' 'crypto++')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')
changelog="Changelog.txt"

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
    
    # move directories around for the client build script
    cd "$srcdir"
    mv "$O3/core" "$srcdir/openvpn3-airvpn"
    mv "$O3/deps/asio" "$srcdir"
    
    # build the client
    cd "$pkgname"
    ./build.sh
}

package() {
    cd $srcdir/$pkgname

    # place binaries
    install -Dm755 hummingbird "$pkgdir/usr/bin/hummingbird"

    # place documentation
    install -Dm755 README.md "$pkgdir/usr/share/doc/hummingbird/README.md"
}
