# Maintainer: James Condron <james@zero-internet.org.uk>
pkgname=threes
pkgver=0.1.0
pkgrel=1
pkgdesc="a tool for bringing up tailscale connected virtual machines."
arch=('any')
url="https://code.fatlads.lol/threes/threes"
license=('BSD-3-Clause')
depends=("rqlite")
makedepends=('go>=1.24')
source=(
    "$url/archive/v$pkgver.tar.gz"
    "threes.service"
    "10-config.env"
)
sha256sums=('380ae81eea12cf4c61d1f869b0faa8171435ccdb03a3b4b22db73ad05747ba41'
            'db96ac71314885e915fc97f54bb5d391fb982dc3f9e6204513e1090153ec5bfa'
            '66048b51f4a8a524f4325c9229997796c45efc804520c627ab4df4551d98008b')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    go build -ldflags="-s -w" -trimpath -o my-app ./cmd/
}

package() {
    cd "$pkgname-$pkgver"

    # Install binaries
    install -Dm755 threes "$pkgdir/usr/bin/threes"

    # Install systemd unit
    install -Dm644 "$srcdir/threes.service" \
            "$pkgdir/usr/lib/systemd/system/threes.service"

    # Install config file
    install -Dm644 "$srcdir/10-config.env" \
            "$pkgdir/etc/threes/10-config.env"

    # Stick license somewhere useful
    install -Dm644 "LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
    echo "Please follow the instructions at https://code.fatlads.lol/threes/threes#networking prior to starting.

You will also need to edit /etc/threes/10-config.env, if you haven't already, with various tailscale tokens."
}
