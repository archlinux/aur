# Maintainer: taotieren <admin@taotieren.com>

pkgname=nrf-command-line-tools-bin
_pkgname=${pkgname%-bin}
pkgver=10.18.0
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
sha256sums_x86_64=('9f9d643ac46acb1ffde19b89e0c3f60c166abb33057f60dbd3ad98144d0c17e5')
sha256sums_aarch64=('cd33375b6b69df055b3e98c4f7d2f6a03636a9af73f1219bfcdadb6a69a7ff0f')
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


