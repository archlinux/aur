pkgname=syncovery-bin
pkgver=11.13.6
pkgrel=1
pkgdesc="Syncovery File Synchronization Tool"
arch=('x86_64')
url="https://www.syncovery.com"
license=('custom')
install=syncovery-bin.install
depends=('glibc' 'gcc-libs')
makedepends=('curl' 'libarchive')
provides=('syncovery')
conflicts=('syncovery')

source=("syncoverycl.service")
sha256sums=('SKIP')

pkgver() {
    curl -s https://www.syncovery.com/syncovery11linux/ \
    | grep -oP 'Syncovery-\K[0-9.]+(?=-amd64\.deb)' \
    | sort -V \
    | tail -1
}

prepare() {
    local version=$(pkgver)
    echo "Detected version: $version"

    curl -L -o "$srcdir/syncovery.deb" \
        "https://www.syncovery.com/release/Syncovery-${version}-amd64.deb"
}

package() {
    cd "$srcdir"

    # Extract .deb
    bsdtar -xf syncovery.deb

    # Extract payload
    bsdtar -xf data.tar.* -C "$pkgdir"

    # Remove Debian service file (we replace it)
    rm -f "$pkgdir/usr/lib/systemd/system/syncoverycl.service"

    # Install our Arch-native service
    install -Dm644 "$srcdir/syncoverycl.service" \
        "$pkgdir/usr/lib/systemd/system/syncoverycl.service"
}
