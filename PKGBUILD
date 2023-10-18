# Maintainer: pinsl <johannes.neyer at gmail dot com>
# Contributor: pjvds <pj at born2code dot net>
# Contributor: dp7hgh7 <c.s.w.friedrich at gmail dot com>
# Contributor: Alexis Polti <alexis at free dot fr>
# Contributor: Nim65s <guilhem at saurel dot me>
# Contributor: CvR_XX <info at carlosvanrooijen dot nl>

pkgname=nrf5x-command-line-tools
_pkgname=nrf-command-line-tools
pkgver=10.23.2
pkgrel=0
pkgdesc="Tools for programming Nordic nRF51, nRF52, nRF53 and nRF91 Series devices"
arch=('x86_64')
url="https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF-Command-Line-Tools"
license=('custom')
depends=('jlink-software-and-documentation')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('nrfjprog' 'mergehex' 'python-pynrfjprog')
conflicts=('python-pynrfjprog' 'python-pynrfjprog-git')
options=()
source_x86_64=("https://nsscprodmedia.blob.core.windows.net/prod/software-and-other-downloads/desktop-software/nrf-command-line-tools/sw/versions-${pkgver%.*.*}-x-x/${pkgver//./-}/${_pkgname}-${pkgver}_linux-amd64.tar.gz")
sha256sums_x86_64=('ccbf6d5e5d87b0ef09657106b23838fa50c9273df44ad38c1fdeab53b9de0ec8')

build() {
    cd ${_pkgname}/python
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}"/${_pkgname}/python
    python -m installer --destdir="${pkgdir}" dist/*.whl

    cd "${srcdir}"

    install -Dm644 ${_pkgname}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

    rm -r ${_pkgname}/LICENSE* ${_pkgname}/python

    mkdir -p "${pkgdir}"/opt
    cp -r ${_pkgname} "${pkgdir}"/opt/${pkgname}

    mkdir -p "${pkgdir}"/usr/bin
    ln -s /opt/${pkgname}/bin/nrfjprog "${pkgdir}"/usr/bin
    ln -s /opt/${pkgname}/bin/mergehex "${pkgdir}"/usr/bin
}
