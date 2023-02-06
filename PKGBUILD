# Maintainer: taotieren <admin@taotieren.com>

pkgname=nrf-command-line-tools-bin
_pkgname=${pkgname%-bin}
pkgver=10.19.0
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
          nrf5x-command-line-tools
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
sha256sums_x86_64=('022bb174caa88c821e99934ff7ecd5f3723103aa10fd984d26168267eeb59203')
sha256sums_aarch64=('8dd4b86b9c870f171a1ea0fb56b5b71f49838a3039275a4a2b79c1df211db9c7')
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


