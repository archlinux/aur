# Maintainer: Mervin Takos <mervintakos@proton.me>

pkgname=aic8800fc-dkms
_commit=2a995e3e01ddadb80e978ddf8558bbd406d0ef89
pkgver=20230807
pkgrel=1
pkgdesc="AICSemi AIC8800FC USB Wi-Fi driver (vendor 2023-08-07 release, patched for Linux 7.x) with firmware (DKMS)"
arch=('any')
url="https://github.com/lzwjava/aic8000"
license=('GPL-2.0-only' 'LicenseRef-AICSemi-firmware')
depends=('dkms' 'usb_modeswitch')
provides=('aic8800')
conflicts=('aic8800' 'aic8800-dkms' 'aic8800-usb-dkms' 'aic8800-linux7-dkms')
install=aic8800fc-dkms.install
source=("aic8000-${_commit}.tar.gz::https://github.com/lzwjava/aic8000/archive/${_commit}.tar.gz"
        "kernel-7.2.patch"
        "dkms.conf"
        "40-aic8800fc-modeswitch.rules")
sha256sums=('b331d664a00cd94c8c30c71481fd72247036366804ce8c4489d5c8d7a440efde'
            'c70304c56e5822c79f57ef657bc56a4a31804fbd7878a03391c95b6afd9a1e59'
            'bea1a3d3a7f459bb53a0aea157eb5076e18ece37ce1c5f443e8ea95e7dfb67d9'
            '278fc452e983b4e2f49e09091b7a595a8d584273507a42beddb43be861765732')

prepare() {
    cd "aic8000-${_commit}"
    patch -Np1 -i "${srcdir}/kernel-7.2.patch"
}

package() {
    cd "aic8000-${_commit}"

    local dest="${pkgdir}/usr/src/${pkgname%-dkms}-${pkgver}"
    install -dm755 "${dest}"
    cp -r drivers/aic8800/. "${dest}/"
    install -Dm644 "${srcdir}/dkms.conf" "${dest}/dkms.conf"
    sed -i "s/@PKGVER@/${pkgver}/" "${dest}/dkms.conf"

    install -Dm644 -t "${pkgdir}/usr/lib/firmware/aic8800DC" fw/aic8800DC/*

    install -Dm644 "${srcdir}/40-aic8800fc-modeswitch.rules" \
        "${pkgdir}/usr/lib/udev/rules.d/40-aic8800fc-modeswitch.rules"
}
