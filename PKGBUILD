# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=python-kosmorrolib
pkgver=1.0.9
pkgrel=1
pkgdesc='A library to compute the ephemerides'

depends=(
        'python>=3.8.0'
        'python-skyfield'
        'python-skyfield-data'
        'python-dateutil'
        )

makedepends=(
        'python-pip'
        'python-poetry'
        )

arch=('any')
url='https://kosmorro.space/lib'
license=('AGPL')

source=("${pkgname}-v${pkgver}.tar.gz::https://codeload.github.com/Kosmorro/lib/tar.gz/refs/tags/v${pkgver}")
sha256sums=("5c401c99f15036fa0b21b9d9b08d27369bf593981381ae8a6170e2a8615aec01")

build() {
    cd "${srcdir}/lib-${pkgver}"
    poetry build
}

package() {
    PYTHON_VERSION=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
    echo "Found Python ${PYTHON_VERSION}."

    SOURCE_DIR="${srcdir}/lib-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip3 install --isolated --ignore-installed --no-deps --root="${pkgdir}/" ${SOURCE_DIR}/dist/kosmorrolib-${pkgver}-py3-none-any.whl

    rm -rf "${pkgdir}/usr/lib/python${PYTHON_VERSION}/site-packages/kosmorrolib/__pycache__"
    rm "${pkgdir}/usr/lib/python${PYTHON_VERSION}/site-packages/kosmorrolib-${pkgver}.dist-info/direct_url.json"
}
