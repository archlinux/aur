# Maintainer: taotieren <admin@taotieren.com>

pkgbase=nrf-command-line-tools-bin
pkgname=(nrf-command-line-tools python-nrf-command-line-tools)
_pkgname=${pkgbase%-bin}
pkgver=10.23.4
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
sha256sums_x86_64=('fa46acb6057d8dfbe7a46138f0edc54aa0bdddc08bf775b6382c9a1d5fbdebe5')
sha256sums_aarch64=('7f946077afec413e8175cae884723e0e16e21ac7381dba3ad1fd18ebed7e331d')
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
