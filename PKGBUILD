# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
# Import the PGP key first: gpg --recv-key 2F062CD1542547AF71BD9B818FC5CD2B9DFB1B4B
# You can also find that key referenced here: https://www.thethingsnetwork.org/docs/network/cli/quick-start.html
pkgname=ttnctl-bin
pkgver=2.10.4
pkgrel=1
pkgdesc="Command line tool for The Things Network (TTN)"
arch=('i686' 'x86_64' 'arm')
url="https://www.thethingsnetwork.org/docs/network/cli/quick-start.html"
license=('MIT')
depends=()
makedepends=('gnupg')
provides=('ttnctl')
conflicts=()
replaces=()
backup=()
_baseurl="https://ttnreleases.blob.core.windows.net/release"
source=(
        "${_baseurl}/v${pkgver}/checksums"
        "${_baseurl}/v${pkgver}/checksums.sig"
        "https://raw.githubusercontent.com/TheThingsNetwork/ttn/develop/LICENSE")
source_i686=("${_baseurl}/v${pkgver}/ttnctl-linux-386.tar.gz")
source_x86_64=("${_baseurl}/v${pkgver}/ttnctl-linux-amd64.tar.gz")
source_arm=("${_baseurl}/v${pkgver}/ttnctl-linux-arm.tar.gz")

# Skipping checksums since we validate against the PGP signed checksum file instead
sha256sums=('SKIP' 'SKIP' 'SKIP')
sha256sums_i686=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_arm=('SKIP')

validpgpkeys=('2F062CD1542547AF71BD9B818FC5CD2B9DFB1B4B')

if [ "$CARCH" == "i686" ]; then
    _binname=ttnctl-linux-386
elif [ "$CARCH" == "x86_64" ]; then
    _binname=ttnctl-linux-amd64
elif [ "$CARCH" == "arm" ]; then
    _binname=ttnctl-linux-arm
fi

prepare() {
    echo "Validating checksums..."
    cat checksums | grep $_binname | sha256sum -c --quiet
    echo "Checksums valid!"
}

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    install $_binname $pkgdir/usr/bin/ttnctl
    install LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
