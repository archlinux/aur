# Maintainer: taotieren <admin@taotieren.com>

pkgname=nrf-command-line-tools-bin
_pkgname=${pkgname%-bin}
pkgver=10.17.3
pkgrel=0
arch=('x86_64' 'aarch64')
depends=(jlink-software-and-documentation
        python
        python-future
        python-tomli-w)
makedepends=(python-wheel
            python-setuptools)
options=(!strip)
provides=(nrfjprog
          mergehex
          python-pynrfjprog)
conflicts=(nrf5x-command-line-tools
           nrfjprog
           mergehex
           python-pynrfjprog)
replaces=()
pkgdesc="The nRF Command Line Tools is used for development, programming and debugging of Nordic Semiconductor's nRF51, nRF52, nRF53 and nRF91 Series devices."
license=('Commercial')
url="https://www.nordicsemi.com/Products/Development-tools/nrf-command-line-tools/download"
_source="https://nsscprodmedia.blob.core.windows.net/prod/software-and-other-downloads/desktop-software/${_pkgname}/sw/versions-10-x-x/${pkgver//./-}/${_pkgname}-${pkgver}_linux"
source_x86_64=("$_source-amd64.tar.gz")
source_aarch64=("$_source-arm64.tar.gz")
sha256sums_x86_64=('79fce3994c9493faf01db412fe422870145548c76170d6a8958fe966b499eff9')
sha256sums_aarch64=('c02f9a2cdb4132b77a9a099044ef9b294dcd3499ad56170cabb92c03fd08572d')
optdepends=("nrf-udev: udev rules for nRF (Nordic Semiconductor) development kits"
            "pc-nrfconnect-programmer: Programmer app for nRF Connect for Desktop")

build () {
    cd "${srcdir}"/${_pkgname}/python
    python setup.py build_ext --inplace
    python setup.py build
}

package() {
    install -dm0755  "${pkgdir}/usr/bin/" \
                     "${pkgdir}/opt/"

    cd "${srcdir}"/${_pkgname}/python
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    cd "${srcdir}"
    install -Dm644 ${_pkgname}/LICENSE.txt "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
    rm -r ${_pkgname}/LICENSE* ${_pkgname}/python
    cp -r ${_pkgname} "${pkgdir}"/opt/${_pkgname}
    ln -sf /opt/${_pkgname}/bin/nrfjprog ${pkgdir}/usr/bin/nrfjprog
    ln -sf /opt/${_pkgname}/bin/mergehex ${pkgdir}/usr/bin/mergehex
}


