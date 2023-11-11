# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=python-kosmorrolib
pkgver=1.0.10
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
sha256sums=("a31593d738c542a61a966553a16438af4c7d978b77f3e3d656e5239b34749b76")

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
