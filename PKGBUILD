# Maintainer: Marcin Kornat <rarvolt@gmail.com>
pkgname=dymoprint
pkgver=2.0.0
pkgrel=2
pkgdesc="Linux Software to print with LabelManager PnP from Dymo"
arch=('any')
license=('Apache')
conflicts=()
provides=('dymoprint')
url="https://github.com/computerlyrik/dymoprint"
depends=(
    'python-appdirs' 
    'python-pillow'
    'python-pyqrcode'
    'python-barcode'
    'usb_modeswitch'
    )
makedepends=('python-pip')
source=(
        "${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/45/3f/d9ce830ad960ab275de014e6a6b13aad41d04cb238759ad607cdf6a3b23f/${pkgname}-${pkgver}.tar.gz"
        "91-dymo-labelmanager-pnp.rules"
        "dymo-labelmanager-pnp.conf"
        "dymoprint-68.patch"
    )
sha512sums=('553f706ad677f3237714a52de49bc3e0db5dd5b8b0eef41fce4522b158b52a5c1afa6a9e320ee6a401c6a0e32dd34ad9b83df74b39a2045fcea24c5843e1b547'
            '76c4d8b9b9abd6c9100b6d0032af0d3752fbb7827f2d3a8417b28d2b822b9f7956051163de015a26e0fa6c548851a0f73e74bea37d1c1583cc457a9dc6be6b68'
            'a73a5cd46e020d9d43d18cf52927085f055b9d3e77d5ed98f254e3fff07b053aff1125e931b2fd984f08dcb501d344544dc2de58adb66270455b4f482bc8f3f1'
            '8cf1234d6ea843455ce7a00afe829395c58566695933ba9d09aea3c8905585a739cfe6d10e5d161f9be55b2556a5ad5d74fd042fb0b4c7492aae7e3383db3fde')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/dymoprint-68.patch"
}


build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    install -Dm644 91-dymo-labelmanager-pnp.rules "${pkgdir}/etc/udev/rules.d/91-dymo-labelmanager-pnp.rules"
    install -Dm644 dymo-labelmanager-pnp.conf "${pkgdir}/etc/usb_modeswitch.d/dymo-labelmanager-pnp.conf"

    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
