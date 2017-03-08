# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=nfc-eventd-git
pkgver=r74.aa2048c
pkgrel=1
pkgdesc="NFC monitor daemon which is able to launch modules (libraries) on action (tag inserted or removed)"
arch=("x86_64")
url="https://github.com/nfc-tools/nfc-eventd"
license=("unknown")
depends=("libnfc")
source=("git+https://github.com/nfc-tools/nfc-eventd" "nfc-eventd.service")
sha256sums=('SKIP'
            '93adad251f5263250f0d403030cdf509595f439f5c276b73fc80db12615dc76c')
backup=('etc/nfc-eventd.conf')

pkgver() {
    cd "${srcdir}/nfc-eventd"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/nfc-eventd"
    autoreconf -vis
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package(){
    cd "$srcdir/nfc-eventd"
    make DESTDIR="$pkgdir" install

    # Install systemd service file
    install -Dm 644 "${srcdir}/nfc-eventd.service" \
        "${pkgdir}/usr/lib/systemd/system/nfc-eventd.service"
}
