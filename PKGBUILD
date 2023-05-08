# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=python-kosmorrolib
pkgver=1.0.8
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
sha256sums=("ba1a75850b29d43a8a130503d875af3c992f3ffc242787a81f47c07c5a646ca7")

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
