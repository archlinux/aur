# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=nfc-eventd-git
pkgver=20150407
pkgrel=1
pkgdesc="NFC monitor daemon which is able to launch modules (libraries) on action (tag inserted or removed)"
arch=("any")
url="https://github.com/nfc-tools/nfc-eventd"
license=("unknown")
depends=("libnfc")
source=("git+https://github.com/nfc-tools/nfc-eventd" "nfc-eventd.service")
sha256sums=('SKIP'
            '93adad251f5263250f0d403030cdf509595f439f5c276b73fc80db12615dc76c')

pkgver() {
    cd "$srcdir/nfc-eventd"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
    cd "$srcdir/nfc-eventd"
    autoreconf -vis
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package(){
    cd "$srcdir/nfc-eventd"
    make DESTDIR=$pkgdir install

    # Install systemd service file
    install -Dm 644 "${srcdir}/nfc-eventd.service" \
        "${pkgdir}/usr/lib/systemd/system/nfc-eventd.service"
}
