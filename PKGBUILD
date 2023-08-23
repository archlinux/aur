# Maintainer: taotieren <admin@taotieren.com>

pkgname=nrf-command-line-tools-bin
_pkgname=${pkgname%-bin}
pkgver=10.22.0
pkgrel=0
arch=('x86_64' 'aarch64')
depends=(jlink-software-and-documentation
    python
    python-future
    python-tomli-w)
makedepends=(python-wheel
    python-setuptools
    python-pip
    python-poetry)
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
sha256sums_x86_64=('acf15afea603bb98516f758e1850e59a5f5047e0f9ac08be7c5271970d5f16db')
sha256sums_aarch64=('ed96d2adcf6a482d0f297b0586fb9538644bd4e81addf4eac91bddf3ef211e18')
optdepends=("nrf-udev: udev rules for nRF (Nordic Semiconductor) development kits"
    "pc-nrfconnect-programmer: Programmer app for nRF Connect for Desktop")

build () {
    cd "${srcdir}"/${_pkgname}/python
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}"/${_pkgname}/python
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm0755 "${srcdir}"/${_pkgname}/bin/nrfjprog ${pkgdir}/usr/bin/nrfjprog
    install -Dm0755 "${srcdir}"/${_pkgname}/bin/mergehex ${pkgdir}/usr/bin/mergehex

    install -Dm0755 /dev/stdin ${pkgdir}/usr/bin/jlinkarm-nrf-worker <<EOF
#!/bin/bash

python_version=\$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
worker_path="/usr/lib/python\${python_version}/site-packages/pynrfjprog/lib_x64/"

cd "\$worker_path" || exit 1

./jlinkarm_nrf_worker_linux
EOF
}


