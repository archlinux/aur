# Maintainer: taotieren <admin@taotieren.com>

pkgbase=nrf-command-line-tools-bin
pkgname=(nrf-command-line-tools python-nrf-command-line-tools)
_pkgname=${pkgbase%-bin}
pkgver=10.23.2
pkgrel=0
arch=('x86_64' 'aarch64')
makedepends=(python-wheel
    python-setuptools-scm
    python-pip
    python-poetry
    python-validate-pyproject)
options=(!strip)
replaces=()
pkgdesc="The nRF Command Line Tools is used for development, programming and debugging of Nordic Semiconductor's nRF51, nRF52, nRF53 and nRF91 Series devices."
license=('Commercial')
url="https://www.nordicsemi.com/Products/Development-tools/nrf-command-line-tools/download"
_source="https://nsscprodmedia.blob.core.windows.net/prod/software-and-other-downloads/desktop-software/${_pkgname}/sw/versions-10-x-x/${pkgver//./-}/${_pkgname}-${pkgver}_linux"
source_x86_64=("${_pkgname}-${pkgver}_linux-amd64.tar.gz::$_source-amd64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}_linux-arm64.tar.gz::$_source-arm64.tar.gz")
sha256sums_x86_64=('ccbf6d5e5d87b0ef09657106b23838fa50c9273df44ad38c1fdeab53b9de0ec8')
sha256sums_aarch64=('002cb7ad7b2f0593555dd564a4fd80aabb28a8a3e58b0ea6f54516ac5382073b')
optdepends=("nrf-udev: udev rules for nRF (Nordic Semiconductor) development kits"
    "pc-nrfconnect-programmer: Programmer app for nRF Connect for Desktop")

build () {
    cd "${srcdir}"/${_pkgname}/python
    python -m build --wheel --no-isolation
}

package_nrf-command-line-tools() {
    depends=(jlink-software-and-documentation)
    provides=(nrfjprog
        mergehex)
    conflicts=(nrfjprog
        mergehex)

    install -Dm0755 "${srcdir}"/${_pkgname}/bin/* -t ${pkgdir}/usr/bin
    install -Dm0644 "${srcdir}"/${_pkgname}/include/*.h -t ${pkgdir}/usr/include
    install -Dm0644 "${srcdir}"/${_pkgname}/lib/*.so -t ${pkgdir}/usr/lib
    install -Dm0644 "${srcdir}"/${_pkgname}/LICENSE* -t ${pkgdir}/usr/share/licenses/${pkgname}

    cp -rv "${srcdir}"/${_pkgname}/share/* ${pkgdir}/usr/share
}

package_python-nrf-command-line-tools() {
    pkgdesc+=" (Python)"

    depends=(jlink-software-and-documentation
    python
    python-future
    python-tomli-w)

    provides=(python-pynrfjprog)
    conflicts=(python-pynrfjprog)

    cd "${srcdir}"/${_pkgname}/python
    python -m installer --destdir="$pkgdir" dist/*-${pkgver}*.whl
    install -Dm0644 "${srcdir}"/${_pkgname}/LICENSE* -t ${pkgdir}/usr/share/licenses/${pkgname}
}
