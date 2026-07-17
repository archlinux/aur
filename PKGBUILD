# Maintainer: Sam Schlegel <git@lutin.us>
pkgname=simagic-ff-dkms
_pkgbase=simagic-ff
pkgver=2.0.0
pkgrel=1
pkgdesc="DKMS kernel module adding native force feedback support for Simagic steering wheelbases (post firmware v159)"
arch=('any')
url="https://github.com/JacKeTUs/simagic-ff"
license=('GPL-2.0-only')
depends=('dkms')
provides=('simagic-ff')
conflicts=('simagic-ff')
source=("$_pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "11-simagic.rules")
sha256sums=('799b0ed482819f8a9b293cc4e3571da0f1bbeaeef58ebb81c441da101837d078'
            'b06327e889acbbc90b15d3c76803e325238e083e3a2ec38db2eba28d843a020a')

package() {
    cd "$_pkgbase-$pkgver"

    # Upstream dkms.conf still ships PACKAGE_VERSION="0.0.1"; keep the DKMS
    # source path and registration in sync with the packaged release version.
    sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$pkgver\"/" dkms.conf

    # Drop the deprecated CLEAN variable (DKMS warns on it; default clean suffices).
    sed -i '/^CLEAN=/d' dkms.conf

    install -Dm644 -t "$pkgdir/usr/src/$_pkgbase-$pkgver" \
        dkms.conf Kbuild Makefile hid-simagic*.c hid-simagic*.h

    install -Dm644 "$srcdir/11-simagic.rules" \
        "$pkgdir/usr/lib/udev/rules.d/11-simagic.rules"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
